IMAGE_NAME=gordonstratton/dynamodb-local

.PHONY: container
container:
	docker build -t $(IMAGE_NAME):latest .
