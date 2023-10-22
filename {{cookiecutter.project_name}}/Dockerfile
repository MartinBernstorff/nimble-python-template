FROM python:3.11-bullseye

# Set the working directory to /app
WORKDIR /app

# Dev experience
COPY makefile ./
COPY requirements.txt ./
RUN make install

# Install the app
COPY . /app
RUN pip install .