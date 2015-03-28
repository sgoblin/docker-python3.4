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
    mercurial \
    pkg-config \
    python3.4 \
    python3.4-dev \
    python3-pip \
    ssh \
    busybox \
    && apt-get autoremove \
    && apt-get clean
    
WORKDIR /tmp
RUN busybox wget http://cdn.rawgit.com/pypa/pip/b9f2d5d5bb4c9dba8dbba3cc09a24fefb12fb38e/contrib/get-pip.py && python3 get-pip.py && rm get-pip.py

RUN pip3 install -U "setuptools==14.3.1"
RUN pip3 install -U "pip==6.0.8"
RUN pip3 install -U "virtualenv==12.0.7"

CMD []
ENTRYPOINT ["/usr/bin/python3"]
