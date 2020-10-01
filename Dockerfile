FROM python:3.8.5

RUN pip install poetry

RUN mkdir /app

WORKDIR /app

COPY poetry.lock pyproject.toml /app/

RUN poetry install --no-dev --no-root

COPY . .

CMD ["make", "run"]
