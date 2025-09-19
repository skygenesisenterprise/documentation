# Makefile for a general documentation project

# Variables
DOC_SOURCE_DIR = src
DOC_BUILD_DIR = build
DOC_OUTPUT_DIR = output
DOC_TOOL = sphinx-build  # You can change this to your documentation tool

# Default target
.PHONY: all
all: build

# Build the documentation
.PHONY: build
build:
	$(DOC_TOOL) -b html $(DOC_SOURCE_DIR) $(DOC_BUILD_DIR)

# Clean the build directory
.PHONY: clean
clean:
	rm -rf $(DOC_BUILD_DIR)

# Serve the documentation locally
.PHONY: serve
serve:
	cd $(DOC_BUILD_DIR) && python -m http.server 8000

# Generate PDF documentation
.PHONY: pdf
pdf:
	$(DOC_TOOL) -b latex $(DOC_SOURCE_DIR) $(DOC_BUILD_DIR)
	make -C $(DOC_BUILD_DIR)/latex all-pdf

# Generate ePub documentation
.PHONY: epub
epub:
	$(DOC_TOOL) -b epub $(DOC_SOURCE_DIR) $(DOC_BUILD_DIR)

# Generate man pages
.PHONY: man
man:
	$(DOC_TOOL) -b man $(DOC_SOURCE_DIR) $(DOC_BUILD_DIR)

# Help target to display available commands
.PHONY: help
help:
	@echo "Makefile for documentation project"
	@echo "Usage:"
	@echo "  make all       - Build the documentation"
	@echo "  make build     - Build the documentation"
	@echo "  make clean     - Clean the build directory"
	@echo "  make serve     - Serve the documentation locally"
	@echo "  make pdf       - Generate PDF documentation"
	@echo "  make epub      - Generate ePub documentation"
	@echo "  make man       - Generate man pages"
	@echo "  make help      - Display this help message"
