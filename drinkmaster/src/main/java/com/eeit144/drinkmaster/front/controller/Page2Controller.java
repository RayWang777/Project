package com.eeit144.drinkmaster.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Page2Controller {
@GetMapping("/")
public String returnPage() {
	return "redirect:front/";
}
}
