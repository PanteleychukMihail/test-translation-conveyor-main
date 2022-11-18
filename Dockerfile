# Use an official Python runtime based on Debian 10 "buster" as a parent image.
FROM python:3.10


# Install system packages required Django.
RUN apt-get update --yes --quiet && apt-get install --yes --quiet --no-install-recommends \
    build-essential \
    libpq-dev \
    libjpeg62-turbo-dev \
    zlib1g-dev \
    libwebp-dev \
 && rm -rf /var/lib/apt/lists/*

# Install the project requirements.
COPY requirements.txt /
RUN pip install -r /requirements.txt

# Use /translation_conveyor folder as a directory where the source code is stored.
WORKDIR /translation_conveyor
