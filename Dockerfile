FROM openjdk:8-jre-alpine

# expose default port
EXPOSE 8000

# setup dynamo
RUN apk update && \
	apk add curl tar && \
	mkdir -p dynamodb && \
	cd dynamodb && \
	curl -LO http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz && \
	tar -xzf dynamodb_local_latest.tar.gz && \
	rm dynamodb_local_latest.tar.gz && \
	apk del curl tar

WORKDIR	dynamodb

ENTRYPOINT ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb"]
CMD ["-port", "8000"]
