package com.corhuila.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
public class BackendApplication {

	public static void main(String[] args) {
		SpringApplication app = new SpringApplication(BackendApplication.class);

		// Configurar el puerto dinámicamente desde la variable de entorno PORT
		Map<String, Object> props = new HashMap<>();
		String port = System.getenv("PORT");
		if (port != null) {
			props.put("server.port", port);
		}

		app.setDefaultProperties(props);
		app.run(args);
	}

}
