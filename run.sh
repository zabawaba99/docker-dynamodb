#!/bin/bash -ex

MAX_MEM=${MAX_MEMORY:-1G}

java \
  -Xms${MAX_MEM} \
  -Djava.library.path=./DynamoDBLocal_lib \
  -jar DynamoDBLocal.jar \
  -sharedDb \
  -dbPath \
  /var/dynamodb_local \
  -port 8000