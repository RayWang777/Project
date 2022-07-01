package com.eeit144.drinkmaster.front.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eeit144.drinkmaster.back.model.FirmService;



@Controller
@RequestMapping("front")
public class FrontPageController {
	
	private FirmService firmService;
	
	@Autowired
	public FrontPageController(FirmService firmService) {
		super();
		this.firmService = firmService;
	}

	@GetMapping("/")
	public String welcomeFront(Model m){
		
		List<Integer> findAllIds = firmService.findAllIds();
		m.addAttribute("swiperPic", findAllIds);
		
		
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
