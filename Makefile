export PYTHONPATH=src

BINDIR=$(VIRTUAL_ENV)/bin

default: run

.PHONY: init
init:
	poetry install -E devtools --no-root
	$(BINDIR)/pre-commit install
	$(BINDIR)/pre-commit install-hooks
	make format check test

.PHONY: clean
clean:
	find . | grep -E "(__pycache__|\.pyc|\.pyo$$)" | xargs rm -rf

.PHONY: run
run:
	$(BINDIR)/python src/main.py

.PHONY: test
test:
	$(BINDIR)/pytest

.PHONY: cov
cov:
	$(BINDIR)/pytest --cov

.PHONY: cov-html
cov-html:
	$(BINDIR)/pytest --cov --cov-report=html

.PHONY: flake8
flake8:
	$(BINDIR)/flake8

.PHONY: mypy
mypy:
	$(BINDIR)/mypy src

.PHONY: check
check: flake8 mypy

.PHONY: format
format:
	$(BINDIR)/pre-commit run -a
