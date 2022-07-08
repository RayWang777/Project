package com.eeit144.drinkmaster.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.eeit144.drinkmaster.bean.ShopcarBean;

@Controller
@RequestMapping("front/")
@SessionAttributes(names={"shopcarBuy","price"})
public class FrontRemoveShopcar {

	@GetMapping("shopcar/deleteCar")
	public String deleteShopcar(Model m,SessionStatus session) {
		ShopcarBean shopcarBean2 = new ShopcarBean();
		shopcarBean2.setTotalPrice(0);
		session.setComplete();
		m.addAttribute("price", shopcarBean2);
		return "/front/frontorder";
	}
}
