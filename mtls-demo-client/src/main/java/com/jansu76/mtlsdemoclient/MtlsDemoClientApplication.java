package com.jansu76.mtlsdemoclient;

import com.jansu76.mtlsdemoclient.model.ClientResponse;
import com.jansu76.mtlsdemoclient.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MtlsDemoClientApplication {


	public static void main(String[] args) {

		SpringApplication.run(MtlsDemoClientApplication.class, args);
		System.out.println("running the app");
	}

	@Component
	public class CommandLineAppStartupRunner implements CommandLineRunner {
		@Autowired
		private ClientService clientService;

		@Override
		public void run(String...args) throws Exception {
			System.out.println("command line runner running the app");
			ClientResponse response = clientService.executeRequest("https://localhost:8443/api/hello");
			System.out.println("Response: " + response.getResponseBody());
			System.out.println("Status code: " + response.getStatusCode());
		}
	}
}
