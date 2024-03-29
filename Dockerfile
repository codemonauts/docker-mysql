# codemonauts/mysql
FROM mysql:5.7
LABEL MAINTAINER felix@codemonauts.com

RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
    ca-certificates \
    unzip \
    mycli \
    wget \
    zstd &&\
    rm -rf /var/lib/apt/lists/*

# Install sqlstrip
RUN  cd /tmp &&\
    wget https://github.com/codemonauts/sqlstrip/releases/download/v1.0/sqlstrip_1.0_Linux_x86_64.tar.gz -O sqlstrip.tar.gz &&\
    tar xvf sqlstrip.tar.gz &&\
    mv sqlstrip /usr/local/bin

# Copy two handy scripts for handling database dumps
COPY import /usr/local/bin
COPY dump /usr/local/bin

# Copy our custom config file
COPY codemonauts.cnf  /etc/mysql/mysql.conf.d/
