OUTPUT_DIR = instance

test-template:
	pip install copier || true
	copier copy . $(OUTPUT_DIR) --defaults --overwrite
	
	# Test the template
	docker rm -f $(OUTPUT_DIR) || true
	cd $(OUTPUT_DIR) && docker build . -t $(OUTPUT_DIR)
	cd $(OUTPUT_DIR) && docker run $(OUTPUT_DIR) make validate_ci
	@echo "✅✅✅ Template tests succeeded ✅✅✅"

#################
# PR management #
#################