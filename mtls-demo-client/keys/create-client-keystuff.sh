#!/bin/bash
DNAME="CN=jansu"
FILE_NAME="client"
keytool -v -genkeypair -dname ${DNAME} -keystore ${FILE_NAME}_identity.jks -storepass secret -keypass secret -keyalg RSA -keysize 2048 -alias client -validity 3650 -deststoretype pkcs12 -ext KeyUsage=digitalSignature,dataEncipherment,keyEncipherment,keyAgreement -ext ExtendedKeyUsage=serverAuth,clientAuth
keytool -v -exportcert -file ${FILE_NAME}_cert.pem -alias client -keystore ${FILE_NAME}_identity.jks -storepass secret -rfc
