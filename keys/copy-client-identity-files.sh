#!/bin/bash
FILE_NAME="${1:-jansufile}"
echo FILE_NAME = ${FILE_NAME}

# server truststore
cp ${FILE_NAME}_server_truststore.jks ../mtls-demo-server/src/main/resources/
# client identity
cp ${FILE_NAME}_client_identity.jks ../mtls-demo-client/src/main/resources/

