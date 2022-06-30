package com.eeit144.drinkmaster.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("front")
public class FrontPageController {

	@GetMapping("/")
	public String welcomeFront() {
		return "/front/frontview";
	}

	@GetMapping("test")
	public String firmserch() {
		return "/front/frontfirmtest";
	}
	@GetMapping("test1")
	public String menu() {
		return "/front/productmenu";
	}
	
}
