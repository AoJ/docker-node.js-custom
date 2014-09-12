# Docker node.js memory test
#
# VERSION 1.0

FROM aooj/base:latest

MAINTAINER AooJ "aooj@n13.cz"

WORKDIR /tmp
RUN apt-get update && apt-get upgrade -y && apt-get install -y make gcc build-essential

RUN mkdir sandbox
WORKDIR /tmp/sandbox
RUN wget https://gist.githubusercontent.com/AoJ/79046572cbc028daab65/raw/4be557ed63be643afaf898197f7dcbabb37630f1/words
RUN wget https://gist.githubusercontent.com/AoJ/987c0aa8a51463ee67e0/raw/3c0a35ed42f1f5c5f794dd2344b245a9443b3928/%22unexpected%22%20memory%20management.js
WORKDIR /tmp
RUN wget -q -O node.tar.gz http://nodejs.org/dist/v0.10.31/node-v0.10.31.tar.gz
RUN tar zxf node.tar.gz
RUN cd node-* && CC="cc '-DV8_MAX_SEMISPACE_SIZE=1073741824'" ./configure && make && make install
