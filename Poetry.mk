POETRY_HOME ?= ${HOME}/.local/share/pypoetry
POETRY_BINARY ?= ${POETRY_HOME}/venv/bin/poetry
POETRY_VERSION ?= 1.2.0

.PHONY: build
build: ## Build galaxy-mk2 package
	echo "[build] Build galaxy-mk2 package."
	${POETRY_BINARY} build

.PHONY: install
install:  ## Install galaxy-mk2 with poetry
	@build/install.sh

.PHONY: image
image:  ## Build galaxy-mk2 image
	@build/image.sh

.PHONY: metrics
metrics: install ## Run galaxy-mk2 metrics checks
	echo "[metrics] Run galaxy-mk2 PEP 8 checks."
	${POETRY_BINARY} run flake8 --select=E,W,I --max-line-length 80 --import-order-style pep8 --statistics --count galaxy_mk2
	echo "[metrics] Run galaxy-mk2 PEP 257 checks."
	${POETRY_BINARY} run flake8 --select=D --ignore D301 --statistics --count galaxy_mk2
	echo "[metrics] Run galaxy-mk2 pyflakes checks."
	${POETRY_BINARY} run flake8 --select=F --statistics --count galaxy_mk2
	echo "[metrics] Run galaxy-mk2 code complexity checks."
	${POETRY_BINARY} run flake8 --select=C901 --statistics --count galaxy_mk2
	echo "[metrics] Run galaxy-mk2 open TODO checks."
	${POETRY_BINARY} run flake8 --select=T --statistics --count galaxy_mk2 tests
	echo "[metrics] Run galaxy-mk2 black checks."
	${POETRY_BINARY} run black -l 80 --check galaxy_mk2

.PHONY: unit-test
unit-test: install ## Run galaxy-mk2 unit tests
	echo "[unit-test] Run galaxy-mk2 unit tests."
	${POETRY_BINARY} run pytest tests/unit

.PHONY: integration-test
integration-test: install ## Run galaxy-mk2 integration tests
	echo "[unit-test] Run galaxy-mk2 integration tests."
	${POETRY_BINARY} run pytest tests/integration

.PHONY: coverage
coverage: install  ## Run galaxy-mk2 tests coverage
	echo "[coverage] Run galaxy-mk2 tests coverage."
	${POETRY_BINARY} run pytest --cov-config=.coveragerc --cov=galaxy_mk2 --cov-fail-under=90 --cov-report=xml --cov-report=term-missing tests

.PHONY: test
test: unit-test integration-test  ## Run galaxy-mk2 tests

.PHONY: docs
docs: install ## Build galaxy-mk2 documentation
	echo "[docs] Build galaxy-mk2 documentation."
	${POETRY_BINARY} run sphinx-build docs site

.PHONY: dev-env
dev-env: image ## Start a local Kubernetes cluster using minikube and deploy application
	@build/dev-env.sh

.PHONY: clean
clean: ## Remove .cache directory and cached minikube
	minikube delete && rm -rf ~/.cache ~/.minikube

