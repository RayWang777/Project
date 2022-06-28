package com.eeit144.drinkmaster.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eeit144.drinkmaster.dto.StoreDTO;




@Controller
@RequestMapping("/backend")
public class PageController {
	

	@GetMapping("/")
	public String welcomePage() {
		return "/backend/backindex";
	}

	@GetMapping("/user")
	String userPage() {
		return "/backend/backuser";
	}
	
	@GetMapping("/firm")
	public String firmPage() {
		return "/backend/backfirm";
	}

	@GetMapping("/store")
	public String storePage() {
		return "/backend/backstore";
	}


	@GetMapping("/product")
	public String productPage() {
		return "/backend/backproduct";
	}
	

	@GetMapping("/shoppingcar")
	public String shoppingcarPage() {
		return "/backend/backshoppingcar";
	}

	@GetMapping("/order")
	public String orderPage() {
		return "/backend/backorder";
	}

	
	
	@GetMapping("/service")
	public String servicePage() {
		return "/backend/backservice";
	}

	
}
