DYNAMODB_VERSION=2016-05-17
IMAGE_NAME=gordonstratton/dynamodb-local

.PHONY: container

container:
	docker build -t $(IMAGE_NAME):$(DYNAMODB_VERSION) .
	docker tag -f $(IMAGE_NAME):$(DYNAMODB_VERSION) $(IMAGE_NAME):latest
