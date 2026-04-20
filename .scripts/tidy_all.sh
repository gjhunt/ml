#!/bin/bash

# Exit on unset vars
set -u

# Define the R script path
RSCRIPT_PATH=".scripts/styleit.R"

DRY_RUN=false
START_DIR=""

usage() {
    echo "Usage: $0 [--dry-run] <start-directory>"
    exit 1
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        -*)
            echo "Unknown option: $1"
            usage
            ;;
        *)
            if [[ -z "$START_DIR" ]]; then
                START_DIR="$1"
                shift
            else
                echo "Unexpected argument: $1"
                usage
            fi
            ;;
    esac
done

# Require a start directory
if [[ -z "$START_DIR" ]]; then
    echo "Error: start directory is required."
    usage
fi

# Ensure start directory exists
if [[ ! -d "$START_DIR" ]]; then
    echo "Error: directory '$START_DIR' does not exist."
    exit 1
fi

# Ensure the R script exists
if [[ ! -f "$RSCRIPT_PATH" ]]; then
    echo "Error: R script '$RSCRIPT_PATH' not found."
    exit 1
fi

# Function to process files recursively
process_files() {
    local directory="$1"

    find "$directory" -type f -name "*.ipynb" \
        -not -path '*/.ipynb_checkpoints/*' \
        -not -path '*/.virtual_documents/*' \
        -not -path '*/.*' |
    while read -r file; do

        echo ">>> Processing: $file"

        # conditional notebook cleaning
        # 1) make a tmp copy of the notebook
        tmp="$(mktemp --suffix=".ipynb")" || { echo "mktemp failed"; continue; }
        cp -p -- "$file" "$tmp" || { echo "Error copying $file to tmp"; rm -f -- "$tmp"; continue; }

        # 2) run nb-clean clean on tmp
        if ! nb-clean clean "$tmp"; then
            rm -f -- "$tmp"
            continue
        fi

        # 3) compare hashes of existing notebook and tmp cleaned file
        orig_hash="$(sha256sum -- "$file" | awk '{print $1}')"
        tmp_hash="$(sha256sum -- "$tmp"  | awk '{print $1}')"

        # 4) IF hashes don't match, replace existing notebook with cleaned tmp (conditional on dry_mode)
        if [ "$orig_hash" != "$tmp_hash" ]; then
            if [ "${DRY_RUN:-false}" = "true" ]; then
                echo "DRY-RUN nbclean: Notebook changed; updating $file"
            else
                echo "nbclean: Notebook changed; updating $file"
                mv -f -- "$tmp" "$file" || { echo "Error replacing $file"; rm -f -- "$tmp"; continue; }               
            fi
        fi

        # conditional notebook reformatting
        if [ "${DRY_RUN:-false}" = "true" ]; then
                if ! Rscript "$RSCRIPT_PATH" --file="$file" --dry_run="on"; then
                    echo "DRY-RUN styler: Error processing $file"
                fi
            else
                if ! Rscript "$RSCRIPT_PATH" --file="$file"; then
                    echo "styler: Error processing $file"
                fi
        fi
        
    done
}

# Start processing from the requested directory
process_files "$START_DIR"