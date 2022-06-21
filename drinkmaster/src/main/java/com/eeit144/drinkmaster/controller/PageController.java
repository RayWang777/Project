package com.eeit144.drinkmaster.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

<<<<<<< HEAD
import org.springframework.web.servlet.ModelAndView;
=======
import com.eeit144.drinkmaster.dto.FirmDTO;
import com.eeit144.drinkmaster.dto.StoreDTO;
>>>>>>> 0b195dc3a0a811761411a77a60a08749cabbf814



@Controller
@RequestMapping("/backend")
public class PageController {
	
<<<<<<< HEAD
=======
	
>>>>>>> 0b195dc3a0a811761411a77a60a08749cabbf814
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
	
	@GetMapping("/store/add")
	public String storeAddPage(Model m) {
		StoreDTO store = new StoreDTO();
		m.addAttribute("store", store);
		m.addAttribute("save", "新增店家");
		return "backstoreadd";
	}

	@GetMapping("/product")
	public String productPage() {
		return "backproduct";
	}
	

	@GetMapping("/shoppingcar")
	public String shoppingcarPage() {
		return "backshoppingcar";
	}

	@GetMapping("/order")
	public String orderPage() {
		return "backorder";
	}

	
	
	@GetMapping("/service")
	public String servicePage() {
		return "backservice";
	}

	
}
