FROM python:3.7

RUN pip install pipenv

RUN mkdir /app

WORKDIR /app

COPY Pipfile .
COPY Pipfile.lock .

RUN pipenv install --deploy --system

COPY . .

WORKDIR /app/src

CMD ["make", "run"]
