.PHONY: container

container:
	docker build -t gordonstratton/dynamodb-local:latest .
