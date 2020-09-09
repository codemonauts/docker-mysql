# codemonauts/mysql
FROM mysql:5.7
LABEL MAINTAINER felix@codemonauts.com

RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
    unzip \
    zstd &&\
    rm -rf /var/lib/apt/lists/*

COPY import /usr/local/bin
COPY dump /usr/local/bin

