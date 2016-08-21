# AWS DynamoDB Local

## Overview

http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html

Images with tags other than `latest` can be found on
[Docker Hub](https://hub.docker.com/r/gordonstratton/dynamodb-local/).

## Quickstart

```sh
docker-compose up
```

This will run a DynamoDB Local instance exposing port 8000. Check out `docker-compose.yml` for more details.

## Updating

For the sake of reproducible builds, the versioned tarball pointed to by the
"latest" URL is specified in the `Dockerfile`. To obtain the latest link and
update your own `Dockerfile`, you can use something like the following:

```sh
curl -sI http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz | grep ^Location: | cut -c11-
```
