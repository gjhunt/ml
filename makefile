.PHONY: render html pdf epub preview clean md hash compare-hash

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