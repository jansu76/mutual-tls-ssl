package com.jansu76.mtlsdemoclient.config;

import nl.altindag.ssl.hostnameverifier.FenixHostnameVerifier;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;

public class CustomHostnameVerifier implements HostnameVerifier {
    @Override
    public boolean verify(String host, SSLSession sslSession) {
        if (host.equals("babar.com")) {
            return true;
        }
        return FenixHostnameVerifier.getInstance().verify(host, sslSession);
    }
}
