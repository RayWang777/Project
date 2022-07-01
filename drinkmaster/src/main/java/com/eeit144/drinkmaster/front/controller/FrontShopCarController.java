package com.eeit144.drinkmaster.front.controller;


import java.util.Map;
//import java.util.Optional;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.eeit144.drinkmaster.back.model.UserService;
//import com.eeit144.drinkmaster.back.service.ProductCategoryServiceImp;
import com.eeit144.drinkmaster.back.service.ProductServiceImp;
import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.ShopcarBean;
import com.eeit144.drinkmaster.bean.ShopcarBuy;
import com.eeit144.drinkmaster.bean.UserBean;

@Controller
@RequestMapping("front/")
@SessionAttributes(names= {"userBean","buy"})
@SuppressWarnings("unchecked")
public class FrontShopCarController {

	@Autowired
	private ProductServiceImp proService;
	
//	@Autowired
//	private ProductCategoryServiceImp categoryService;
	
	@Autowired
	private UserService userService;
	
	public void testUserSession(Model m){
		UserBean user = userService.findById(1).get();
		m.addAttribute("userBean", user);
	}
	
		
	@GetMapping("shopcar/")
	public String carView(Model m) {
		testUserSession(m);
		
		
		return "/front/frontshopcar";
	}
	
	@GetMapping("shopcar/before")
	public String carBeforeView() {
		return "/front/frontbeforeshop";
	}
	
	
	@GetMapping("shopcar/before/editproduct")
	public String updateById(@RequestParam("id") Integer id, Model m) {
		ProductBean productBean = proService.findById(id);
		
		
		m.addAttribute("productBean", productBean);
		m.addAttribute("insert", "updateproduct");
		return "/front/frontbeforeshop";
	}
	
	@GetMapping("shopcar/before/deleteproduct")
	public String deleteById(@RequestParam("id") Integer id) {

		proService.deleteById(id);
		return "/front/frontbeforeshop";

	}
	
	
	@PostMapping("shopcar/buy")
	public String addShopcar(Model m,
			@RequestParam("productId") Integer productId,@RequestParam("number") Integer qty) {
		
		UserBean userBean = (UserBean) m.getAttribute("userBean");
		if(userBean == null) {
			return "redirect:/front/";
		}
		
		ShopcarBuy shopcarBuy = (ShopcarBuy) m.getAttribute("buy");
		if(shopcarBuy == null) {
			shopcarBuy = new ShopcarBuy();
			m.addAttribute("shopcarBuy",shopcarBuy);
		}
		
		
		Map<Integer, ProductBean> productMap = (Map<Integer, ProductBean>) m.getAttribute("userBean");
		ProductBean productBean = productMap.get(productId);
		
		OrderItems oi = new OrderItems(null,productId,productBean.getPrice(),qty,productBean.getColdHot());
		shopcarBuy.addToCart(productId, oi);
		
		return "/front/frontshopcar";
	}
	
	@PostMapping("shopcar/test")
	public String addShopcar(Model m) {
		
		ShopcarBean shop = new ShopcarBean();
		m.addAttribute("userBean", shop);
		
		return "/front/frontshopcar";
	}
	

}
