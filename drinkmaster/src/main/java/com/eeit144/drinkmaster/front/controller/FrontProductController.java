package com.eeit144.drinkmaster.front.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit144.drinkmaster.back.model.OrderItemsService;
import com.eeit144.drinkmaster.back.model.ProductCategoryService;
import com.eeit144.drinkmaster.back.model.ProductService;
import com.eeit144.drinkmaster.back.model.StoreService;
import com.eeit144.drinkmaster.bean.FirmVo;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.ProductCategoryBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.ProductTop;

@Controller
@RequestMapping("front/")
public class FrontProductController {
	@Autowired
	private ProductCategoryService categoryService;
	@Autowired
private ProductService productService;
@Autowired
private StoreService storeService;
@Autowired
private OrderItemsService itemsService;

	@Autowired
	public FrontProductController(ProductService productService) {
		super();
		this.productService = productService;
	}
	@GetMapping ("productmenu")
	public String productMenu(@RequestParam("id") Integer id, Model m) {
		Optional<StoreBean> storeBean= storeService.findById(id);
		StoreBean  store=storeBean.get();
		 List<ProductCategoryBean> category=categoryService.findByStoreBean(store);
		 m.addAttribute("category",category);
		return "front/productmenu";
	}
	@GetMapping( "top3")
	@ResponseBody
	public List<ProductTop> findTop3(){
		List<Integer> count = itemsService.countByProductBean();
		
		
		List<ProductBean> allProduct=  productService.findAll(count);
		List<ProductTop> topList =new ArrayList<ProductTop>();
		
		for(ProductBean product:allProduct) {
	
			ProductTop top =new ProductTop();
			
			System.out.println();
			Integer firmId = product.getProductCategoryBean().getStoreBean().getFirmBean().getFirmId();
			StoreBean storeBean = product.getProductCategoryBean().getStoreBean();
			storeBean.setFirmId(firmId);
			top.setStoreBean(storeBean);
			top.setProductId(product.getProductId());
//			top.setProductImage(product.getProductImage());
//			top.setProductImage(null);
//			System.out.println(product.getProductImage());
			top.setProductName(product.getProductName());
			topList.add(top);
		}
		
//		topList.sort(Comparator.comparing(ProductTop::getCount));
		
		return topList;
	}
	
}
