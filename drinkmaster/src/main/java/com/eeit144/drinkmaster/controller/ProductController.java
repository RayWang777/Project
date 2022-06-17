package com.eeit144.drinkmaster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.model.ProductService;
import com.eeit144.drinkmaster.service.ProductServiceImp;

@Controller
@Transactional

public class ProductController {
	@Autowired
  private ProductService proService; 
  
	@PostMapping("/product/insert")
	public String insertProduct(@ModelAttribute("product") ProductBean pro,Model m) {
		proService.insertProduct(pro);
		
		return null;
	}
  
}
