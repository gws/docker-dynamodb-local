FROM openjdk:8-jre-slim

ARG ETAG="\"f513a2218eca571f079202945cea6a55-3\""

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
  && tar -xz -C /srv/dynamodb -f /tmp/dynamodb_local_latest.tar.gz \
  && chown -R nobody:nogroup /srv/dynamodb \
  && rm -f /tmp/dynamodb_local_latest* \
  && apt-get -y purge \
     curl \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/dynamodb

USER nobody:nogroup

EXPOSE 8000

ENTRYPOINT [ \
  "java", \
  "-Djava.library.path=./DynamoDBLocal_lib", \
  "-jar", "./DynamoDBLocal.jar" \
]

CMD ["-inMemory"]
