package com.eeit144.drinkmaster.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

@Controller
public class FrontUserLogoutController {
	@GetMapping("/front/logout")
	public String logout(WebRequest request, SessionStatus status) {
		status.setComplete();
		request.removeAttribute("canSeeUser", WebRequest.SCOPE_SESSION);
		request.removeAttribute("canSeeFirm", WebRequest.SCOPE_SESSION);
		request.removeAttribute("canSeeStore", WebRequest.SCOPE_SESSION);
		return "/front/frontlogin";
	}
}
