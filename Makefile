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

push:
	git push --set-upstream origin HEAD
	git push

create-pr:
	gh pr create --title "$(git log -1 --pretty=%B)" --body "Auto-created" || true

enable-automerge:
	gh pr merge --auto --squash --delete-branch .

merge-main:
	git fetch
	git merge --no-edit origin/main

squash-from-parent:
	git fetch
	git reset $$(git merge-base origin/main $$(git rev-parse --abbrev-ref HEAD)) ; git add -A ; git commit -m "Squash changes from parent branch"


create-random-branch:
	@git checkout -b "$$(date +'%d_%H_%M')_$(shell cat /dev/urandom | env LC_ALL=C tr -dc 'a-z' | fold -w 5 | head -n 1)"

pr: ## Run relevant tests before PR
	make merge-main
	make push
	make create-pr
	make validate
	make enable-automerge
	@echo "––– 🎉🎉🎉 All tests succeeded! 🎉🎉🎉 –––"
	@gh pr view | cat | grep "title|url" 

grow:
	make pr
	@echo "––– Growing into a new branch 🌳 –––"
	make create-random-branch
	make squash-from-parent

