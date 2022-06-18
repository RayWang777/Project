package com.eeit144.drinkmaster.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eeit144.drinkmaster.dto.FirmDTO;

@Controller
@RequestMapping("/backend")
public class PageController {
	
	@GetMapping("/")
	public String welcomePage() {
		return "backindex";
	}

	@GetMapping("/user")
	String userPage() {
		return "backuser";
	}
	
	@GetMapping("/firm")
	public String firmPage() {
		return "backfirm";
	}

	@GetMapping("/firm/add")
	public String firmAddPage(Model m) {
		FirmDTO firm = new FirmDTO();
		m.addAttribute("firm", firm);
		m.addAttribute("save", "新增廠商");
		return "backfirmadd";
	}
	
	@GetMapping("/store")
	public String storePage() {
		return "backstore";
	}

	@GetMapping("/product")
	public String productPage() {
		return "backproductinsert";
	}
	

	@GetMapping("/shoppingcar")
	public String shoppingcarPage() {
		return "backshoppingcar";
	}

	@GetMapping("/order")
	public String orderPage() {
		return "backorder";
	}

	@GetMapping("/comment")
	public String commentPage() {
		return "backcomment";
	}

	@GetMapping("/service")
	public String servicePage() {
		return "backservice";
	}

}
