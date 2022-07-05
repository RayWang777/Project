package com.eeit144.drinkmaster.front.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
//import java.util.Optional;
import java.util.Set;

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
import org.springframework.web.bind.support.SessionStatus;

import com.eeit144.drinkmaster.back.model.OrderItemsService;
import com.eeit144.drinkmaster.back.model.OrderService;
import com.eeit144.drinkmaster.back.model.StoreService;
import com.eeit144.drinkmaster.back.model.UserService;
//import com.eeit144.drinkmaster.back.service.ProductCategoryServiceImp;
import com.eeit144.drinkmaster.back.service.ProductServiceImp;
import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.ShopcarBean;
import com.eeit144.drinkmaster.bean.ShopcarBuy;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;

@Controller
@RequestMapping("front/")
@SessionAttributes(names= {"orderuserBean","shopcarBuy","product","canSeeUser"})
@SuppressWarnings("unchecked")
public class FrontShopCarController {

	@Autowired
	private ProductServiceImp proService;
	
//	@Autowired
//	private ProductCategoryServiceImp categoryService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderItemsService oitemService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private StoreService storeService;
	
	
	public void testUserSession(Model m){
		UserBean user = userService.findById(1).get();
		m.addAttribute("orderuserBean", user);
	}
	
		
	@GetMapping("shopcar/")
	public String carView(Model m) {
//		testUserSession(m);
		
		return "/front/frontshopcar";
	}
	
	@GetMapping("shopcar/before")
	public String carBeforeView() {
		return "/front/frontbeforeshop";
	}
	
	@GetMapping("shopcar/order")
	public String orderView(Model m) {
//		testUserSession(m);
		
		return "/front/frontorder";
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
	public String editById(@RequestParam("id") Integer id, Model m,@RequestParam("sid") Integer storeId) {
		ProductBean productBean = proService.findById(id);
		StoreBean storeBean = storeService.findById(storeId).get();
		
		
		
		m.addAttribute("productBean", productBean);
		m.addAttribute("shopcarBuy", productBean);
		
		m.addAttribute("storeBean", storeBean);
		m.addAttribute("shopcarBuy", storeBean);

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
	public String addShopcar(@SessionAttribute(name="product",required = false) OrderItems orderItems,Model m,@RequestParam("shopcarproductId") Integer productId
			,@RequestParam("sugar") String sugar,@RequestParam("coldhot") String coldhot,@RequestParam("number") Integer number,
			@RequestParam("totalprice") Integer totalprice,@RequestParam("storeName") String storeName,
			@RequestParam("storeId") Integer storeId,@ModelAttribute("productBean") ProductBean productBean) {
		
	
		UserBean userBean = (UserBean) m.getAttribute("canSeeUser");
		if(userBean == null) {
			return "redirect:/front/login";
		}
		
		
		
//		// 取出存放在session物件內的shopcarBuy物件
//		ShopcarBuy shopcarBuy = (ShopcarBuy) m.getAttribute("shopcarBuy");
//		if(shopcarBuy == null) {
//			//沒有的話建立一個
//			shopcarBuy = new ShopcarBuy();
//			m.addAttribute("shopcarBuy",shopcarBuy);
//		}
//		
		
//		Map<Integer, ShopcarBean> cart = new LinkedHashMap<>();
		
		List<ShopcarBean> cart = new ArrayList<ShopcarBean>();
		ShopcarBean shopcarBean2 = new ShopcarBean();
		shopcarBean2.setTotalPrice(totalprice);
		cart.add(shopcarBean2);
		System.out.println(cart.size());
		for(ShopcarBean shopcarBean : cart) {
			System.out.println("123");
//			ShopcarBean shopcarBean = new ShopcarBean();
			shopcarBean.setProductImage(productBean.getProductImage());
			shopcarBean.setProductId(productId);
			shopcarBean.setProductName(productBean.getProductName());
			System.out.println("999");
			System.out.println(productBean.getProductName());
			shopcarBean.setPrice(productBean.getPrice());
			shopcarBean.setColdhot(coldhot);
			shopcarBean.setQuantity(number);
			shopcarBean.setSweet(sugar);
			shopcarBean.setTotalPrice(totalprice);
			shopcarBean.setStoreName(storeName);
			shopcarBean.setStoreId(storeId);
			System.out.println("000");
			cart.add(shopcarBean);
		}
//		System.out.println(cart.size());
//		System.out.println(cart.isEmpty());
		System.out.println("456");
		m.addAttribute("shopcarBuy", cart);
		System.out.println("789");
		
		
		
//		ShopcarBean shopcarBean = new ShopcarBean();
//		shopcarBean.setProductImage(productBean.getProductImage());
//		shopcarBean.setProductId(productId);
//		shopcarBean.setProductName(productBean.getProductName());
//		shopcarBean.setPrice(productBean.getPrice());
//		shopcarBean.setColdhot(coldhot);
//		shopcarBean.setQuantity(number);
//		shopcarBean.setSweet(sugar);
//		shopcarBean.setTotalPrice(totalprice);
//		shopcarBean.setStoreName(storeName);
//		shopcarBean.setStoreId(storeId);
		
//		cart.put(productId, shopcarBean);
//		m.addAttribute("shopcarBuy", cart);


		
//		m.addAttribute("shopcarBuy", shopcarBean);
		
		

		
		return "/front/frontshopcar2";
	}
	
	
	
	@PostMapping("shopcar/writeData")
	public String orderData(Model m) {
		
//		ShopcarBean shopcarBean = new ShopcarBean();
//		m.addAttribute("shopcarBuy", shopcarBean);
		
		return "/front/frontshopcardata";
	}
	
	
	@PostMapping("shopcar/confirmOrder")
	public String confirmOrder(Model m,
			@RequestParam("shopcarphone") String shopcarphone,@RequestParam("shopcaraddress") String shopcaraddress
			,@RequestParam("shopcarname") String shopcarname
			,@RequestParam("shopcarprice") Integer shopcarprice
			,@RequestParam("shopcarquantity") Integer shopcarquantity
			,@RequestParam("shopcarsweet") String shopcarsweet
			,@RequestParam("shopcarcoldhot") String shopcarcoldhot
			,@RequestParam("shopcartotalPrice") Integer shopcartotalPrice
			,@RequestParam("userId") Integer userId
			,@RequestParam("productId") Integer productId
			,@RequestParam("storeName") String storeName
			,@RequestParam("storeId") Integer storeId) {//@RequestParam("storeId") Integer storeId
		
		ShopcarBean shopcarBean = new ShopcarBean();
		shopcarBean.setAddress(shopcaraddress);
		shopcarBean.setPhone(shopcarphone);
		shopcarBean.setProductName(shopcarname);
		shopcarBean.setPrice(shopcarprice);
		shopcarBean.setColdhot(shopcarcoldhot);
		shopcarBean.setQuantity(shopcarquantity);
		shopcarBean.setSweet(shopcarsweet);
		shopcarBean.setTotalPrice(shopcartotalPrice);
		shopcarBean.setStoreName(storeName);
		shopcarBean.setStoreId(storeId);
		
		m.addAttribute("shopcarBuy", shopcarBean);
							
		Date today = new Date();
		
		UserBean user = new UserBean();
		user.setUserId(userId);
		
		StoreBean store = new StoreBean();
		store.setStoreId(storeId);
		
		OrderBean ob = new OrderBean();
		ob.setCreateTime(today);
		ob.setOrderAddress(shopcaraddress);
		ob.setOrderPhone(shopcarphone);
		ob.setOrderStatus("待付款");
		ob.setTotalPrice(shopcartotalPrice);
		ob.setUserBean(user);
		ob.setStoreBean(store);
		
		orderService.insertOrder(ob);
		
		OrderBean ob2 = orderService.findFirstByOrderByCreateTimeDesc();
							
		ProductBean product = new ProductBean();
		product.setProductId(productId);

		OrderItems oi = new OrderItems();
		oi.setPrice(shopcartotalPrice);
		oi.setQuantity(shopcarquantity);
		oi.setSweet(shopcarsweet);
		oi.setColdhot(shopcarcoldhot);
		oi.setProductBean(product);
		oi.setOrderBean(ob2);
		
		oitemService.insertOrderItems(oi);
								
//		ShopcarBean cart = (ShopcarBean) m.getAttribute("shopcarBuy");
//		
//		Map<Integer, OrderItems> content = cart.getContent();
//		Set<OrderItems> items = new LinkedHashSet<>();
//		Set<Integer> set = content.keySet();
//		for(Integer i : set) {
//			OrderItems oib = content.get(i);
//			oib.setOrderBean(ob);
//			items.add(oib);
//		}
//		ob.setOrderItems(items);
//		
//		oitemService.insertOrderItems(items);
		
		return "redirect:/front/shopcar/deleteCar";
	}
	
	
	
	
	
	

}
