FROM ubuntu:latest
LABEL Description="Build environment"

ENV HOME /root

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    git \
    cmake \
    python3-pip \
    binutils-dev \
    libssl-dev \
    uuid-dev \
    ca-certificates

RUN git clone https://github.com/rcallan/CppTrader.git

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash

RUN apt-get -y --no-install-recommends install git-lfs

RUN cd CppTrader && git lfs pull

RUN pip3 install gil

RUN cd CppTrader && gil update && cd build && ./unix.sh