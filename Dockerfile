FROM java:openjdk-8u91-jre

RUN mkdir /srv/dynamodb \
  && curl -sL http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_2016-05-17.tar.gz \
    | tar -xz -C /srv/dynamodb \
  && chown -R nobody:nogroup /srv/dynamodb

USER nobody:nogroup

EXPOSE 8000

ENTRYPOINT [ \
  "java", \
  "-Djava.library.path=/srv/dynamodb/DynamoDBLocal_lib", \
  "-jar", "/srv/dynamodb/DynamoDBLocal.jar" \
]

CMD ["-inMemory"]
