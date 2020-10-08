FROM python:3.9-alpine

RUN apk add --no-cache make

ENV VIRTUAL_ENV "/venv"
ENV PATH "$VIRTUAL_ENV/bin:${PATH}"

WORKDIR /app
ENV PYTHONPATH "."
