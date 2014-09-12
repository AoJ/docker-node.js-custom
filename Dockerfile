# Docker node.js memory test
#
# VERSION 1.0

FROM aooj/base:latest

MAINTAINER AooJ "aooj@n13.cz"

WORKDIR /tmp
RUN apt-get update && apt-get upgrade -y && apt-get install -y make gcc build-essential
RUN wget -q -O node.tar.gz http://nodejs.org/dist/v0.10.31/node-v0.10.31.tar.gz
RUN tar zxf node.tar.gz
RUN cd node-* && CC="cc '-DV8_MAX_SEMISPACE_SIZE=1073741824'" ./configure && make
