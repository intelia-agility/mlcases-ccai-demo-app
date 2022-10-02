# syntax=docker/dockerfile:1

FROM python:3.9-slim-buster

ENV POETRY_VERSION=1.2\
    PORT=8080 

# Install poetry
RUN pip install "poetry==$POETRY_VERSION"

# Copy only requirements to cache them in docker layer
WORKDIR /code
COPY pyproject.toml /code/

# Project initialization:
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi --no-root

# Copy our Flask app to the Docker image
COPY app.py /code/

CMD gunicorn app:app -w 2 --threads 2 -b 0.0.0.0:${PORT}
