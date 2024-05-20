OUTPUT_DIR = instance

test-template:
	rm -rf $(OUTPUT_DIR)
	copier copy . $(OUTPUT_DIR) --defaults --overwrite
	
	# Test the template
	cd $(OUTPUT_DIR) && docker build . -f .github/Dockerfile.dev -t $(OUTPUT_DIR)
	cd $(OUTPUT_DIR) && docker run $(OUTPUT_DIR) make validate_ci
	@echo "✅✅✅ Template tests succeeded ✅✅✅"

#################
# PR management #
#################