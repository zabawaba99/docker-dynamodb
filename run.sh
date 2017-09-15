#!/bin/bash -ex

MAX_HEAP=${MAX_HEAP_MEMORY:-1G}
MAX_STACK=${MAX_STACK_SIZE:-512K}
MAX_METASPACE=${MAX_METASPACE_MEMORY:-256M}

if [ -z "$IN_MEMORY" ]; then
  java \
    -Xmx${MAX_HEAP} \
    -Xss${MAX_STACK} \
    -XX:MaxMetaspaceSize=${MAX_METASPACE} \
    -Djava.library.path=./DynamoDBLocal_lib \
    -jar DynamoDBLocal.jar \
    -sharedDb \
    -dbPath \
    /var/dynamodb_local \
    -port 8000
else
  java \
    -Xmx${MAX_HEAP} \
    -Xss${MAX_STACK} \
    -XX:MaxMetaspaceSize=${MAX_METASPACE} \
    -Djava.library.path=./DynamoDBLocal_lib \
    -jar DynamoDBLocal.jar \
    -inMemory \
    -sharedDb \
    -port 8000
fi