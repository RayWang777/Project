package com.eeit144.drinkmaster.front.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eeit144.drinkmaster.back.service.ProductCategoryServiceImp;
import com.eeit144.drinkmaster.back.service.ProductServiceImp;
import com.eeit144.drinkmaster.bean.ProductBean;

@Controller
@RequestMapping("front/")
public class FrontShopCarController {

	@Autowired
	private ProductServiceImp proService;
	
	@Autowired
	ProductCategoryServiceImp categoryService;
	
	@GetMapping("shopcar/")
	public String carView() {
		return "/front/frontshopcar";
	}
	
	@GetMapping("shopcar/before")
	public String carBeforeView() {
		return "/front/frontbeforeshop";
	}
	
	
	@GetMapping("shopcar/before/editproduct")
	public String updateById(@RequestParam("id") Integer id, Model m) {
		ProductBean productBean = proService.findById(id);
		
//		m.addAttribute("now", "編輯商品");
//		m.addAttribute("status", "確定修改");
		
		m.addAttribute("productBean", productBean);
		m.addAttribute("insert", "updateproduct");
		return "/front/frontbeforeshop";
	}
	
	@GetMapping("shopcar/before/deleteproduct")
	public String deleteById(@RequestParam("id") Integer id) {

		proService.deleteById(id);
		return "/front/frontbeforeshop";

	}
	

}
