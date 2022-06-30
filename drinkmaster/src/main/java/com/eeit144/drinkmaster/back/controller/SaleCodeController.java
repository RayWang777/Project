package com.eeit144.drinkmaster.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eeit144.drinkmaster.back.model.SaleCodeService;

@Controller
@RequestMapping("backend/salecode/")
public class SaleCodeController {
	
	private SaleCodeService saleCodeService;
	


	@Autowired
	public SaleCodeController(SaleCodeService saleCodeService) {
		super();
		this.saleCodeService = saleCodeService;
	}

	@GetMapping("/")
	public String allSaleCodePage() {
		return "/backend/salecode";		
	}

}
