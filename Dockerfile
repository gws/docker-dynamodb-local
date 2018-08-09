FROM debian:stable-slim as build

ARG ETAG="\"f232b3933442e68c3856b5ddba8e5c7b-3\""

RUN apt-get update && apt-get install -y \
  curl \
  && mkdir /srv/dynamodb \
  && curl -H"If-Match: ${ETAG}" \
          -sL -o /tmp/dynamodb_local_latest.tar.gz \
          https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz \
  && curl -sL -o /tmp/dynamodb_local_latest.tar.gz.sha256 \
          https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz.sha256 \
  && cd /tmp \
  && sha256sum -c dynamodb_local_latest.tar.gz.sha256 \
  && cd / \
  && tar -xz -C /srv/dynamodb -f /tmp/dynamodb_local_latest.tar.gz

FROM openjdk:jre-slim

WORKDIR /srv/dynamodb

COPY --from=build /srv/dynamodb /srv/dynamodb

RUN chown -R nobody:nogroup /srv/dynamodb

USER nobody:nogroup

EXPOSE 8000

ENTRYPOINT [ \
  "java", \
  "-Djava.library.path=./DynamoDBLocal_lib", \
  "-jar", "DynamoDBLocal.jar" \
]

CMD ["-inMemory"]
