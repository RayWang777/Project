package com.eeit144.drinkmaster.front.controller;


import java.util.LinkedList;
import java.util.List;
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
import org.springframework.web.bind.annotation.SessionAttribute;
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
@SessionAttributes(names= {"orderuserBean","shopcarBuy","product"})
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
		m.addAttribute("orderuserBean", user);
	}
	
		
	@GetMapping("shopcar/")
	public String carView(Model m) {
		testUserSession(m);
		
		return "/front/frontshopcar";
//		return "/front/shoptest";
	}
	
	@GetMapping("shopcar/before")
	public String carBeforeView() {
		return "/front/frontbeforeshop";
	}
	
	
//	@GetMapping("shopcar/before/editproduct")
//	public String updateById(@RequestParam("id") Integer id, Model m) {
//		ProductBean productBean = proService.findById(id);
//		
//		
//		m.addAttribute("productBean", productBean);
//		m.addAttribute("insert", "updateproduct");
//		return "/front/frontbeforeshop";
//	}
	
	
	@GetMapping("shopcar/before/editproduct")
	public String editById(@SessionAttribute(name="product",required = false) OrderItems orderItems,@RequestParam("id") Integer id, Model m) {
		ProductBean productBean = proService.findById(id);
		
		
		
		m.addAttribute("productBean", productBean);
		m.addAttribute("product", productBean);
		return "/front/frontbeforeshop";
	}
	
	
	
	
	@GetMapping("shopcar/before/deleteproduct")
	public String deleteById(@RequestParam("id") Integer id) {

		proService.deleteById(id);
		return "/front/frontbeforeshop";

	}
	
	
//	@PostMapping("shopcar/buy")
//	public String addShopcar(Model m,
//			@RequestParam("productId") Integer productId,@RequestParam("number") Integer number) {
//		
////		ProductBean productBean = proService.findById(productId);		
//		
//		UserBean userBean = (UserBean) m.getAttribute("canSeeUser");
//		if(userBean == null) {
//			return "redirect:/front/";
//		}
//		
//		// 取出存放在session物件內的shopcarBuy物件
//		ShopcarBuy shopcarBuy = (ShopcarBuy) m.getAttribute("shopcarBuy");
//		if(shopcarBuy == null) {
//			//沒有的話建立一個
//			shopcarBuy = new ShopcarBuy();
//			m.addAttribute("shopcarBuy",shopcarBuy);
//		}
//		
//		
//		Map<Integer, ProductBean> productMap = (Map<Integer, ProductBean>) m.getAttribute("product");
//		ProductBean productBean = productMap.get(productId);
//		
//				
//		
//		OrderItems oi = new OrderItems(null,productId,productBean.getPrice(),number,productBean.getColdHot());
//		shopcarBuy.addToCart(productId, oi);
//		
//		return "/front/frontshopcar";
//	}
	
	
	@PostMapping("shopcar/buy")
	public String addShopcar(@SessionAttribute(name="product",required = false) OrderItems orderItems,Model m,@RequestParam("productId") Integer productId) {
		
		OrderItems product = (OrderItems) m.getAttribute("product");
		System.out.println(product.getProductId());
		
//		ProductBean productBean = proService.findById(productId);		
		
		UserBean userBean = (UserBean) m.getAttribute("orderuserBean");
		if(userBean == null) {
			return "redirect:/front/";
		}
		System.out.println(userBean.getUserName());
		
		
		
		// 取出存放在session物件內的shopcarBuy物件
		ShopcarBuy shopcarBuy = (ShopcarBuy) m.getAttribute("shopcarBuy");
		if(shopcarBuy == null) {
			//沒有的話建立一個
			shopcarBuy = new ShopcarBuy();
			m.addAttribute("shopcarBuy",shopcarBuy);
		}
		
		
		
		
		return "/front/frontshopcar";
	}
	
	@PostMapping("shopcar/test")
	public String addShopcartest(Model m,@RequestParam("id") Integer id) {
//		ProductBean productBean = proService.findById(id);
		
		m.getAttribute("userBean");
		ShopcarBean shop = new ShopcarBean();
		m.addAttribute("userBean", shop);
		
		return "/front/frontshopcar";
	}
	

}
