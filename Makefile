template_default_dir = nimble-python

test-template:
	# Install cruft if not already installed
	pip install cruft || true
	cruft create . -y --overwrite-if-exists --extra-context '{"release_to_pypi": "yes"}'
	
	# Test the template
	# Create the config file if it does not exist
	mkdir -p ~/.config/gh
	touch ~/.config/gh/hosts.yml
	docker rm -f $(template_default_dir) || true
	cd $(template_default_dir) && docker build . -t $(template_default_dir)
	cd $(template_default_dir) && docker run $(template_default_dir) make validate
	@echo "✅✅✅ Template tests succeeded ✅✅✅"

#################
# PR management #
#################
merge-main:
	@echo "––– Merging main –––"
	@git fetch
	@git merge --no-edit origin/main

push:
	@echo "––– Pushing to origin/main –––"
	@git push --set-upstream origin HEAD
	@git push

create-pr:
	@echo "––– Creating PR –––"
	@gh pr create --title "$$(git rev-parse --abbrev-ref HEAD | tr -d '[:digit:]' | tr '-' ' ')" --body "Auto-created" || true

enable-automerge:
	gh pr merge --auto --merge --delete-branch

pr-status:
	@gh pr view | cat | grep "title" 
	@gh pr view | cat | grep "url" 
	@echo "✅✅✅ PR created ✅✅✅"

################
# Compositions #
################
setup-pr: ## Update everything and setup the PR
	@make merge-main
	@make push
	@make create-pr

finalise-pr:
	@make enable-automerge
	@make pr-status

pr: ## Run relevant tests before PR
	@make setup-pr
	@make test-template
	@make finalise-pr