export PYTHONPATH=src

RUN=pipenv run

default: run

.PHONY: init
init:
	pipenv install --dev
	$(RUN) pre-commit install-hooks
	$(RUN) make format check test

.PHONY: clean
clean:
	find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf

.PHONY: run
run:
	$(RUN) python src/main.py

.PHONY: shell
shell:
	pipenv shell

.PHONY: test
test:
	$(RUN) pytest

.PHONY: cov
cov:
	$(RUN) pytest --cov

.PHONY: cov-html
cov-html:
	$(RUN) pytest --cov --cov-report=html

.PHONY: check
check:
	$(RUN) flake8

.PHONY: format
format:
	$(RUN) pre-commit run -a
