DYNAMODB_VERSION=2016-05-17
IMAGE_NAME=gordonstratton/dynamodb-local

.PHONY: container

container:
	docker build -t $(IMAGE_NAME):latest .
	docker tag $(IMAGE_NAME):latest $(IMAGE_NAME):$(DYNAMODB_VERSION)
