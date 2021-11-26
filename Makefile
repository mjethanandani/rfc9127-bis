.PHONY: container push debug all

leftover=$(shell docker ps -a -q -f status=exited)
leftover-image=$(shell docker images -a -q)
username=mjethanandani
image=$(username)/ietf-bfd-yang

all: container

container:
	docker build -t $(image) .; docker run -it --name test \
	--mount type=bind,src="$(PWD)",dst=/app \
	$(image)

push:
	docker push $(image):$(VER)

debug:
	docker run -it $(image) bash

clean: 
	-docker rm $(leftover)
	-docker rmi $(leftover-image)




