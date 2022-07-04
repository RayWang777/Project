package com.eeit144.drinkmaster.front.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.back.model.OrderItemsService;
import com.eeit144.drinkmaster.back.model.OrderService;
import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.bean.UserBean;

@Controller
@SessionAttributes(names= {"canSeeUser"})
@RequestMapping("front/")
public class FrontOrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderItemsService oiService;
	
	
	
	@GetMapping("order/userOrder")
	public String userOrder(@RequestParam("orderuserid") Integer userid, Model model) {
		
		List<OrderBean> userOrder = orderService.findOrdersByUserid(userid);
		
		
		
		model.addAttribute("userOrder", userOrder);
		
		return "front/frontorderuserorder";
	}
	
	@GetMapping("orderItems/findId")
	public ModelAndView findByOrderId(ModelAndView mav, @RequestParam(name = "s", defaultValue = "1") Integer pageNumber, 
			@RequestParam(name = "id", defaultValue = "1") Integer orderId) {

		Page<OrderItems> page = oiService.findByOrderBean_orderId(orderId,pageNumber);		
		OrderItems orderItems = new OrderItems();

		mav.getModel().put("orderItems", orderItems);
		mav.getModel().put("page", page);
		mav.setViewName("/front/frontorderselfitems");
		return mav;

	}
	
	@GetMapping("order/delete")
	public String deleteOrder(@RequestParam("id") Integer id,
			@RequestParam("userId") Integer userId) {
		
		
		orderService.deleteById(id);
		return "redirect:http://localhost:8081/drinkmaster/front/order/userOrder?orderuserid=" + userId;
	}
	
}
