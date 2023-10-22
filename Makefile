template_default_dir = nimble-python

test-template:
	@# Check for unstaged changes, since Cruft ignores them.
	@if git diff-index --quiet HEAD --; then \
		echo "No uncommitted changes."; \
	else \
		echo "–––❌️ There are uncommitted changes, which are ignored by Cruft. Make sure to commit them. –––"; \
	fi \

	rm -rf $(template_default_dir)
	cruft create . -y
	
	# Test the template
	cd $(template_default_dir) && \
	docker build . -t docker-test-username/container-name:latest && \
	make validate