#!/bin/bash
FILE_NAME="${1:-jansufile}"
CERT_FILE_NAME="${2:-jansufile.cert}"
echo FILE_NAME = ${FILE_NAME}
echo CERT_FILE_NAME = ${CERT_FILE_NAME}

# client truststore
keytool -v -importcert -file ${CERT_FILE_NAME} -alias server -keystore ${FILE_NAME}_client_truststore.jks -storepass secret -noprompt

# server keystore
keytool -v -importcert -file ${CERT_FILE_NAME} -alias server -keystore ${FILE_NAME}_server_identity.jks -storepass secret -noprompt

