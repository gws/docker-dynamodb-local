FROM java:openjdk-8-jre

RUN mkdir /srv/dynamodb && \
  curl -sL http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_2016-03-01.tar.gz \
  | tar -xz --no-same-owner -C /srv/dynamodb

EXPOSE 8000

ENTRYPOINT [ \
  "java", \
  "-Djava.library.path=/srv/dynamodb/DynamoDBLocal_lib", \
  "-jar", "/srv/dynamodb/DynamoDBLocal.jar" \
]

CMD ["-inMemory"]
