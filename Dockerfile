FROM python:3.9-alpine as compile

RUN apk add --no-cache \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev

RUN pip install poetry
RUN mkdir /app
RUN python -m venv "/venv"
ENV VIRTUAL_ENV "/venv"

WORKDIR /app

COPY poetry.lock pyproject.toml /app/

RUN poetry install --no-root --no-dev

COPY . /app/

FROM python:3.9-alpine as runtime

RUN apk add --no-cache make

COPY --from=compile /venv /venv
ENV VIRTUAL_ENV "/venv"
ENV PATH "$VIRTUAL_ENV/bin:${PATH}"

WORKDIR /app
ENV PYTHONPATH "."

COPY --from=compile /app /app

CMD ["make", "run"]
