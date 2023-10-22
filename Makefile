template_default_dir = nimble-python

test-template:
	@# Check for unstaged changes, since Cruft ignores them.
	@if git diff-index --quiet HEAD --; then \
		echo "No uncommitted changes."; \
	else \
		echo "–––❌️ There are uncommitted changes, which are ignored by Cruft. –––"; \
		git add . && git commit -m "misc."; \
		echo "I've created a new commit to include all changes. You can undo this with `git reset --soft HEAD~1`."; \
	fi \

	rm -rf $(template_default_dir)
	cruft create . -y
	
	# Test the template
	docker rm -f $(template_default_dir) || true
	cd $(template_default_dir) && docker build . -t $(template_default_dir)