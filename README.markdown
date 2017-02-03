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

For the sake of reproducible builds, the version of the tarball is specified in
the `Dockerfile`. To obtain the latest version ID and update your own
`Dockerfile`, you can use something like the following:

```sh
curl -sI https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz
```

You will want to look for `x-amz-version-id` and use that value as VERSION\_ID
in the `Dockerfile`.
