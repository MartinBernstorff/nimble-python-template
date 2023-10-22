install-dev:
	pip install -r dev-requirements.txt

install-deps:
	pip install -r requirements.txt

install:
	make install-deps
	pip install -e .

test: ## Run tests
	pytest src

lint: ## Format code
	ruff check {{cookiecutter.package_name}} --fix
	ruff format {{cookiecutter.package_name}}

type-check: ## Type-check code
	pyright {{cookiecutter.package_name}}

validate: ## Run all checks
	make lint
	make type-check
	make test

pr: ## Run relevant tests before PR
	make validate
	gh pr create -w