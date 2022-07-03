package com.eeit144.drinkmaster.websocket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebSocketController {

	@GetMapping("front/chatroom")
	public String stompws5() {
		return "front/frontWebSocketChatroom";
	}
}
