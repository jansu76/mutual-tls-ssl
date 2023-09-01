#!/bin/bash
FILE_NAME="${1:-jansufile}"
echo FILE_NAME = ${FILE_NAME}

# client truststore
cp ${FILE_NAME}_client_truststore.jks ../mtls-demo-client/src/main/resources/
# server identity
cp ${FILE_NAME}_server_identity.jks ../mtls-demo-server/src/main/resources/

