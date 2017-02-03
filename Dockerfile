FROM openjdk:8u111-jre

ARG VERSION_ID=wRzlbckhjnZIm0CVgcmTkkgmHBAB9l_U

RUN mkdir /srv/dynamodb \
  && curl -sL https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz?versionId=${VERSION_ID} \
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
