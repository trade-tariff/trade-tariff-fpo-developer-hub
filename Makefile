.PHONY: default build run clean

IMAGE_NAME := trade-tariff-fpo-developer-hub

default: build run

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run \
		--network=host \
		--rm \
		--name $(IMAGE_NAME) \
		-e PORT=5001 \
		-it \
		$(IMAGE_NAME) \

clean:
	docker rmi $(IMAGE_NAME)

shell:
	docker run \
		--rm \
		--name $(IMAGE_NAME)-shell \
		--no-healthcheck \
		-it $(IMAGE_NAME) /bin/sh
