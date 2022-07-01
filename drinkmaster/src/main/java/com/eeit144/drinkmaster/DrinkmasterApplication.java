package com.eeit144.drinkmaster;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.eeit144.drinkmaster.websocket.InitialListener;





@SpringBootApplication
public class DrinkmasterApplication {

	public static void main(String[] args) {
		SpringApplication.run(DrinkmasterApplication.class, args);
	}
	@Bean
	public InitialListener initialListener() {
	   return new InitialListener();
	}
}
