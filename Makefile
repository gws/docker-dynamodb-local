IMAGE_NAME=gordonstratton/dynamodb-local

.PHONY: container
container:
	docker build --pull -t $(IMAGE_NAME):latest .
