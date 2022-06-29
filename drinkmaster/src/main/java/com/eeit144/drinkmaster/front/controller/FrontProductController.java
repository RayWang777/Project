package com.eeit144.drinkmaster.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eeit144.drinkmaster.back.model.ProductService;

@Controller
@RequestMapping("front/")
public class FrontProductController {
private ProductService productService;
	@Autowired
	public FrontProductController(ProductService productService) {
		super();
		this.productService = productService;
	}
	
	
}
