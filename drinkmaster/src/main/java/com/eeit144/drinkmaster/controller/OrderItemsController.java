package com.eeit144.drinkmaster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;


import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.model.OrderItemsService;

@Controller
@RequestMapping("backend/")
public class OrderItemsController {

	@Autowired
	private OrderItemsService oiService;
	
	
	@GetMapping("orderItems/findAll")
	public ModelAndView findView(ModelAndView mav, @RequestParam(name = "o", defaultValue = "1") Integer pageNumber,@SessionAttribute("userBean") UserBean user,Model m) {
		
		if((user.getRole().equals("user"))) {
			return mav;			
		}
		
		Page<OrderItems> page = oiService.findByPage(pageNumber);
		OrderItems orderItems = new OrderItems();
		mav.getModel().put("orderItems", orderItems);
		mav.getModel().put("page", page);
		mav.setViewName("/backend/backorderitems");
		return mav;
		
	}
}
