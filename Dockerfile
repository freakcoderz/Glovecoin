# ===============================================================================
# Dockerfile
#   Builds Glovecoin and the executable binary, "Glovecoind"
#
#
# It is based on Ubuntu 16.04 LTS
# ===============================================================================

# Set the base image to Ubuntu
FROM ubuntu:16.04

# File Author / Maintainer
MAINTAINER glove

# ===============================================================================
# Env. Setup
#

# Update repository
RUN apt-get update && apt-get -y upgrade

# ----------------------------------------------------------
# Dependencies
# ----------------------------------------------------------

# Basic Dependencies
#
RUN apt-get install -y git \
            ntp \
            unzip \
            build-essential \
            libssl-dev \
            libdb-dev \
            libdb++-dev \
            libboost-all-dev \
            libqrencode-dev \
            libminiupnpc-dev \
            miniupnpc

# ===============================================================================
# Set working directory
#
WORKDIR /work

# ===============================================================================
# Install configuration
#

RUN mkdir -p /root/.Glovecoin/
COPY docker/config/Glovecoin.conf /root/.Glovecoin/
RUN chmod u+r-wx,g-rwx,o-rwx /root/.Glovecoin/Glovecoin.conf

# ===============================================================================
# System Initialization
#

## Copy folders
COPY share /work/share
COPY src /work/src
RUN cd /work/src/leveldb && chmod +x build_detect_platform && make clean
RUN cd /work/src && \
    /usr/bin/make -f makefile.unix

# Set default CMD
CMD /work/src/Glovecoind && tail -f -n 10 /root/.Glovecoin/debug.log

EXPOSE 55681 45681 55680 45680
