SRC_PATH = {{ cookiecutter.package_name }}

install-dev:
	pip install --upgrade -r dev-requirements.txt

install-deps:
	pip install --upgrade -r requirements.txt

install:
	make install-deps
	make install-dev
	pip install -e .

test: ## Run tests
	pytest $(SRC_PATH)

lint: ## Format code
	ruff format . 
	ruff . --fix \
		--extend-select F401 \
		--extend-select F841

type-check: ## Type-check code
	pyright $(SRC_PATH)

validate: ## Run all checks
	make lint
	make type-check
	make test

push:
	git push --set-upstream origin HEAD
	git push

create-pr:
	gh pr create --fill-first || true

enable-automerge:
	gh pr merge --auto --merge --delete-branch

merge-main:
	git fetch
	git merge origin/main

grow:
	make pr
	@echo "––– 🎉🎉🎉 All tests succeeded! Growing into a new branch 🌳 –––"
	git checkout -b $(shell cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 10)

pr: ## Run relevant tests before PR
	make merge-main
	make push
	make create-pr
	make validate
	make enable-automerge