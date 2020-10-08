FROM python:3.9-alpine

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
