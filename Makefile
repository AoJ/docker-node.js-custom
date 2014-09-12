# Project: docker node.js test
# Author: AooJ <aooj@n13.cz>
# Date: 2014
# usage:
#	make build	- build new image from Dockerfile
#	make run	- debug run already created image by tag
#	make debug	- build and run bash in docker, dont run /run/start.sh


NAME=aooj/test
VERSION=1.0

build:
	docker build -t $(NAME):$(VERSION) .

debug: build
	docker run --rm -t -i $(NAME):$(VERSION) /bin/bash	

.PHONY: build debug
