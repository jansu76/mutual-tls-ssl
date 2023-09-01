#!/bin/bash
# create client identity, client identity keystore and server truststore
FILE_NAME="${1:-jansufile}"
DNAME="CN=${2:-jansu}"
KEY_USAGE="${3:--ext KeyUsage=digitalSignature,dataEncipherment,keyEncipherment,keyAgreement}"
EXTENDED_KEY_USAGE="${4:--ext ExtendedKeyUsage=serverAuth,clientAuth}"
EXTENSION="${5:--ext SubjectAlternativeName:c=DNS:localhost,DNS:raspberrypi.local,IP:127.0.0.1}"
echo FILE_NAME = ${FILE_NAME}
echo DNAME = ${DNAME}
echo KEY_USAGE = ${KEY_USAGE}
echo EXTENDED_KEY_USAGE = ${EXTENDED_KEY_USAGE}
echo EXTENSION = ${EXTENSION}

keytool -v -genkeypair -dname ${DNAME} -keystore ${FILE_NAME}_client_identity.jks -storepass secret -keypass secret -keyalg RSA -keysize 2048 -alias client -validity 3650 -deststoretype pkcs12 ${KEY_USAGE} ${EXTENDED_KEY_USAGE} ${EXTENSION}
keytool -v -exportcert -file ${FILE_NAME}_client_cert.pem -alias client -keystore ${FILE_NAME}_client_identity.jks -storepass secret -rfc
keytool -v -importcert -file ${FILE_NAME}_client_cert.pem -alias client -keystore ${FILE_NAME}_server_truststore.jks -storepass secret -noprompt
openssl x509 -noout -text -in ${FILE_NAME}_client_cert.pem
