package com.eeit144.drinkmaster.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@RequestMapping("front/")
@SessionAttributes("shopcarBuy")
public class FrontRemoveShopcar {

	@GetMapping("shopcar/deleteCar")
	public String deleteShopcar(Model m,SessionStatus session) {
		session.setComplete();
		return "/front/frontorder";
	}
}
