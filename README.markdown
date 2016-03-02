# AWS DynamoDB Local

## Overview

http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html

## Quickstart

`docker run -it -p 127.0.0.1:8000:8000 gordonstratton/dynamodb-local:latest`

`tools/run-dev` is available if you want to daemonize the container for
development.

Other tags can be found on [Docker Hub](https://hub.docker.com/r/gordonstratton/dynamodb-local/).

## Updating

For the sake of reproducible builds, the versioned tarball pointed to by the
"latest" URL is specified in the `Dockerfile`. To obtain the latest link and
update your own `Dockerfile`, you can use something like the following:

```sh
curl -sI http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz | grep ^Location: | cut -c11-
```
