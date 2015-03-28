# Base python 3.4 build, inspired by
# https://github.com/crosbymichael/python-docker/blob/master/Dockerfile
FROM ubuntu:14.04
MAINTAINER Michael Twomey <mick@twomeylee.name>

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    build-essential \
    ca-certificates \
    gcc \
    git \
    libpq-dev \
    make \
    pkg-config \
    python3.4 \
    python3.4-dev \
    && apt-get autoremove \
    && apt-get clean
    
ADD https://bootstrap.pypa.io/get-pip.py /tmp/
RUN python3 /tmp/get-pip.py && rm /tmp/get-pip.py

RUN pip3 install -U "virtualenv==12.0.7"

CMD []
ENTRYPOINT ["/usr/bin/python3"]
