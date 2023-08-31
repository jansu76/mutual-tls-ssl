package com.jansu76.mtlsdemoclient.config;

import nl.altindag.ssl.SSLFactory;
import nl.altindag.ssl.apache4.util.Apache4SslUtils;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.impl.client.HttpClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class ClientConfig {

    @Bean
    public RestTemplate restTemplate(org.apache.http.impl.client.CloseableHttpClient httpClient) {
        return new RestTemplate(new HttpComponentsClientHttpRequestFactory(httpClient));
    }

    @Bean
    @Scope("prototype")
    public org.apache.http.impl.client.CloseableHttpClient apacheHttpClient(SSLFactory sslFactory) {
        LayeredConnectionSocketFactory socketFactory = Apache4SslUtils.toSocketFactory(sslFactory);
        return HttpClients.custom()
                .setSSLSocketFactory(socketFactory)
                .build();
    }

}
