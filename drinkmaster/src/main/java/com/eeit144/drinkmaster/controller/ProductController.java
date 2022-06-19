package com.eeit144.drinkmaster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.dto.ProductBeanDTO;
import com.eeit144.drinkmaster.model.ProductService;

@Controller
@Transactional

public class ProductController {
	@Autowired
  private ProductService proService; 
  
	@PostMapping("/product/insert")
	public String insertProduct(@RequestBody ProductBeanDTO pro,Model m) {
		
		Integer storeId = pro.getStoreId();
		
		System.out.println(storeId);
		
		ProductBean productBean = new ProductBean();
		
		productBean.setProductName(pro.getProductName());
		productBean.setPrice(pro.getPrice());
		
		StoreBean store = new StoreBean();
		store.setStoreId(storeId);
		
		productBean.setStoreBean(store);
		
		
		proService.insertProduct(productBean);
		
		return null;
	}
  
}
