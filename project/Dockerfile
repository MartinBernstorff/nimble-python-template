FROM python:3.11-bullseye

# Set the working directory to /app
WORKDIR /app

# Dev experience
COPY Makefile ./

COPY pyproject.toml ./
RUN make install-dev

COPY pyproject.toml ./
COPY . /app
RUN pip install .
RUN git init