// https://learn.vonage.com/blog/2018/10/08/create-websocket-server-spring-boot-dr/

// https://www.dariawan.com/tutorials/spring/spring-boot-websocket-basic-example/

// https://stackoverflow.com/questions/60378337/how-to-send-message-to-websocket-client-from-spring-websocket-server-using-stomp

package com.eeit144.drinkmaster.websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration("WebSocketStompConfig3")
@EnableWebSocketMessageBroker
public class WebSocketStompConfig implements  WebSocketMessageBrokerConfigurer {
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/macropolo").withSockJS();
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.enableSimpleBroker("/queue", "/topic");
		registry.setApplicationDestinationPrefixes("/app");
	}

}
