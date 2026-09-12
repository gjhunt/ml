.PHONY: render html pdf epub preview clean md hash compare-hash codex_container

# Main build target
render: html

# Render the GitHub Pages site
html:
	quarto render --to html

# Optional export formats
pdf:
	quarto render --to pdf --no-clean

epub:
	quarto render --to epub

# Local preview
preview:
	quarto preview

# Convert lecture notebooks to Markdown copies
MD_DIR := _build/mds
NOTEBOOKS := $(wildcard lectures/*.ipynb)
MARKDOWN := $(patsubst lectures/%.ipynb,$(MD_DIR)/%.md,$(NOTEBOOKS))

md: $(MARKDOWN)

$(MD_DIR)/%.md: lectures/%.ipynb
	mkdir -p $(@D)
	jupyter nbconvert --execute --inplace $<
	jupyter nbconvert --to markdown $< --output-dir $(@D)

# Hash rendered Markdown outputs for reproducibility checks
hash: md
	hashdeep -rl $(MD_DIR)/ > hash.ref

compare-hash: md
	hashdeep -rlvv -a -k hash.ref $(MD_DIR)/

# Remove generated outputs
clean:
	rm -rf docs _build hash.ref

#--- codex
BUILD_TAG := 
PORT := 8080
CONTAINER_NAME := codex
IMAGE := gjhunt/codex:24.04$(BUILD_TAG)
CONTAINERFILE := Containerfile

codex_container:
	podman run --rm -it \
		-p 127.0.0.1:$(PORT):8080 \
		--name $(CONTAINER_NAME) \
		-e USE_HTTPS=false \
		-e USE_PASS=true \
		-v $$(pwd):/home/repro/codex \
        --userns=keep-id \
		$(IMAGE)
