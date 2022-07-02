package com.eeit144.drinkmaster.front.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.OrderItemsService;
import com.eeit144.drinkmaster.back.model.ProductService;
import com.eeit144.drinkmaster.bean.ProductBean;



@Controller
@RequestMapping("front")
public class FrontPageController {
	
	private FirmService firmService;
	
	private ProductService productService; 
	
	private OrderItemsService orderItemsService; 
	
	@Autowired
	public FrontPageController(FirmService firmService,ProductService productService, OrderItemsService orderItemsService) {
		super();
		this.firmService = firmService;
		this.productService = productService;
		this.orderItemsService = orderItemsService;
	}

	@GetMapping("/")
	public String welcomeFront(Model m){
		
		List<Integer> findAllIds = firmService.findAllIds();
		m.addAttribute("swiperPic", findAllIds);
		List<Integer> list = orderItemsService.countByProductBean();
		List<ProductBean> productList = productService.findAll(list);
		m.addAttribute("top3", productList);
		
		System.out.println(list);
		
			
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
