install-dev:
	pip install -r requirements-dev.txt

install-deps:
	pip install -r requirements.txt

install:
	make install-deps
	pip install -e .

test: ## Run tests
	pytest src

lint: ## Format code
	ruff check . --fix
	ruff format .

type-check: ## Type-check code
	pyright src

validate: ## Run all checks
	make lint
	make type-check
	make test

pr: ## Run relevant tests before PR
	make validate
	gh pr create -w