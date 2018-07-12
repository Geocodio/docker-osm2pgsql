# DOCKER-VERSION 1.5.0
# VERSION 0.2

FROM debian:stretch
MAINTAINER James Badger <james@jamesbadger.ca>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    git make cmake g++ libboost-dev libboost-system-dev \
    libboost-filesystem-dev libexpat1-dev zlib1g-dev \
    libbz2-dev libpq-dev libproj-dev lua5.2 liblua5.2-dev && \
    rm -rf /var/lib/apt/lists/*

ENV HOME /root
ARG OSM2PGSQL_VERSION=0.96.0

RUN mkdir src && \
    cd src && \
    git clone --depth 1 --branch $OSM2PGSQL_VERSION https://github.com/openstreetmap/osm2pgsql.git && \
    cd osm2pgsql && \
    mkdir build && cd build && \
    cmake .. && \
    make && \
    make install && \
    cd /root && \
    rm -rf src

ENTRYPOINT ["/bin/bash"]
