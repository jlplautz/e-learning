# Pull official base Python Docker image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV POETRY_VIRTUALENVS_CREATE=false
ENV ALGORITHM=HS256

# Set work directory
WORKDIR /code

RUN pip install --upgrade pip
RUN pip install poetry

COPY poetry.lock pyproject.toml /code/

# Install dependencies
RUN poetry config installer.max-workers 10
RUN poetry install --without dev

# COPY requirements.txt /code/
# RUN pip install -r requirements.txt
# Copy the Django project

COPY . /code/
