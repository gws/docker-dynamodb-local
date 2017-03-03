FROM openjdk:8u121-jre

ARG ETAG="\"a513a2218eca571f079202945cea6a55-3\""

RUN mkdir /srv/dynamodb \
  && curl -H "If-Match: ${ETAG}" -sL https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz \
    | tar -xz -C /srv/dynamodb \
  && chown -R nobody:nogroup /srv/dynamodb

WORKDIR /srv/dynamodb

USER nobody:nogroup

EXPOSE 8000

ENTRYPOINT [ \
  "java", \
  "-Djava.library.path=./DynamoDBLocal_lib", \
  "-jar", "./DynamoDBLocal.jar" \
]

CMD ["-inMemory"]
