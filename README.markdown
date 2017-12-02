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

In order to support reproducible builds as much as possible, the ETag of the
tarball is specified in the `Dockerfile`. To obtain the latest ETag and update
your own `Dockerfile`, you can do something like the following:

```sh
curl -sI https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz
```

You will want to look for `ETag` and use that value as the `ETAG` build argument
in the `Dockerfile`. Remember that the quotes around `ETag` values are part of
the value, and should be escaped.

## Building

```sh
docker build --pull -t gordonstratton/dynamodb-local:latest .
```

Then, tag the image with the date of the release and push it.
