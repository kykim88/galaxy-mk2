PYTHON_NIXPKG ?= python39

.PHONY: build
build:  ## Build galaxy-mk2 Nix package
	echo "[nix][build] Build galaxy-mk2 Nix package."
	@nix-build -E 'with import <nixpkgs> { overlays = [ (import ./overlay.nix) ]; }; callPackage ./default.nix {python = pkgs.${PYTHON_NIXPKG}; poetry2nix = pkgs.poetry2nix;}'

.PHONY: install
install:  ## Install galaxy-mk2 env with Nix
	echo "[nix][install] Install galaxy-mk2 env with Nix"
	@nix-build -E 'with import <nixpkgs> { overlays = [ (import ./overlay.nix) ]; }; callPackage ./editable.nix {python = pkgs.${PYTHON_NIXPKG}; poetry2nix = pkgs.poetry2nix;}'

.PHONY: image
image:  ## Build galaxy-mk2 image with Nix
	echo "[nix][image] Build galaxy-mk2 image with Nix."
	@nix-build image.nix

.PHONY: docs
docs: install  ## Build galaxy-mk2 documentation
	echo "[docs] Build galaxy-mk2 documentation."
	result/bin/sphinx-build docs site

.PHONY: metrics
metrics: install  ## Run galaxy-mk2 metrics checks
	echo "[nix][metrics] Run galaxy-mk2 PEP 8 checks."
	result/bin/flake8 --select=E,W,I --max-line-length 80 --import-order-style pep8 --statistics --count galaxy_mk2
	echo "[nix][metrics] Run galaxy-mk2 PEP 257 checks."
	result/bin/flake8 --select=D --ignore D301 --statistics --count galaxy_mk2
	echo "[nix][metrics] Run galaxy-mk2 pyflakes checks."
	result/bin/flake8 --select=F --statistics --count galaxy_mk2
	echo "[nix][metrics] Run galaxy-mk2 code complexity checks."
	result/bin/flake8 --select=C901 --statistics --count galaxy_mk2
	echo "[nix][metrics] Run galaxy-mk2 open TODO checks."
	result/bin/flake8 --select=T --statistics --count galaxy_mk2 tests
	echo "[nix][metrics] Run galaxy-mk2 black checks."
	result/bin/black -l 80 --check galaxy_mk2

.PHONY: unit-test
unit-test: install  ## Run galaxy-mk2 unit tests
	echo "[nix][unit-test] Run galaxy-mk2 unit tests."
	result/bin/pytest tests/unit

.PHONY: integration-test
integration-test: install  ## Run galaxy-mk2 integration tests
	echo "[nix][integration-test] Run galaxy-mk2 unit tests."
	result/bin/pytest tests/integration

.PHONY: coverage
coverage: install  ## Run galaxy-mk2 tests coverage
	echo "[nix][coverage] Run galaxy-mk2 tests coverage."
	result/bin/pytest --cov-config=.coveragerc --cov=galaxy_mk2 --cov-fail-under=90 --cov-report=xml --cov-report=term-missing tests

.PHONY: test
test: unit-test integration-test  ## Run galaxy-mk2 tests

