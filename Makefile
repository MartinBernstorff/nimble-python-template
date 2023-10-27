template_default_dir = nimble-python

test-template:
	
	# Delete existing template
	rm -rf $(template_default_dir)
	
	# Install cruft if not already installed
	pip install cruft || true
	cruft create . -y
	
	# Test the template
	# Create the config file if it does not exist
	mkdir -p ~/.config/gh
	touch ~/.config/gh/hosts.yml
	docker rm -f $(template_default_dir) || true
	cd $(template_default_dir) && docker build . -t $(template_default_dir)
	cd $(template_default_dir) && docker run $(template_default_dir) make validate

sync-pr:
	git push --set-upstream origin HEAD
	git push

create-pr:
	gh pr create -w || true

merge-pr:
	gh pr merge --auto --merge --delete-branch

pr:
	make sync-pr
	make create-pr
	make test-template
	make merge-pr