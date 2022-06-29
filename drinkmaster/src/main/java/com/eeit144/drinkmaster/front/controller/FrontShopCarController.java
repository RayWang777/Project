package com.eeit144.drinkmaster.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("front/")
public class FrontShopCarController {

	
	
	@GetMapping("shopcar/test")
	public String carView() {
		return "/front/frontshopcartest";
	}
	

}
