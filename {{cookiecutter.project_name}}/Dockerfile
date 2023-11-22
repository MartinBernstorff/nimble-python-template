FROM python:3.11-bullseye

# Set the working directory to /app
WORKDIR /app

# Dev experience
COPY Makefile ./
RUN pyright .

COPY dev-requirements.txt ./
RUN --mount=type=cache,target=/root/.cache/pip make install-dev 

COPY requirements.txt ./
RUN --mount=type=cache,target=/root/.cache/pip make install-deps

COPY pyproject.toml ./
COPY . /app
RUN pip install .