package com.eeit144.drinkmaster.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.ShopCarBean;
import com.eeit144.drinkmaster.model.ShopCarService;

@Controller
@RequestMapping("backend/")
public class ShopCarController {

	@Autowired
	private ShopCarService shopCarService;
	

	@GetMapping("shopCar/insertView")
	public String addView(Model m) {
		ShopCarBean shopCarBean = new ShopCarBean();
		System.out.println(shopCarBean.getStatus());
			
		m.addAttribute("shopCarBean", shopCarBean);
		return "backshopcarinsert";
	}
	
	@GetMapping("shopCar/findAll")
	public ModelAndView findView(ModelAndView mav, @RequestParam(name = "s", defaultValue = "1") Integer pageNumber) {
		Page<ShopCarBean> page = shopCarService.findByPage(pageNumber);

		mav.getModel().put("page", page);
		mav.setViewName("backshopcar");
		return mav;
	}
	
	@GetMapping("shopCar/delete")
	public String deleteShopCar(@RequestParam("id") Integer id) {
		shopCarService.deleteById(id);
		return "redirect:/backend/shopCar/findAll";
	}
	
	@PostMapping("shopCar/insert")
	public String insertShopCar(@ModelAttribute("shopCarBean") ShopCarBean shopCarBean, Model model) {			
		shopCarService.insertShopCar(shopCarBean);
		
		return "redirect:/backend/shopCar/findAll";
		}
	
	@GetMapping("shopCar/edit")
	public String editById(@RequestParam("id") Integer id, Model m) {
		ShopCarBean shopCarBean = shopCarService.findById(id);
		m.addAttribute("shopCarBean", shopCarBean);
		return "backshopcarupdate";
	}
	
	@PostMapping("shopCar/update")
	public String updateShopCar(@ModelAttribute("shopCarBean") ShopCarBean shopCarBean, Model m) {
		shopCarService.insertShopCar(shopCarBean);

		return "redirect:/backend/shopCar/findAll";
	}
	
}
