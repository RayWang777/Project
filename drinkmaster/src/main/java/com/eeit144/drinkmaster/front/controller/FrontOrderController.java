package com.eeit144.drinkmaster.front.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.back.model.OrderItemsService;
import com.eeit144.drinkmaster.back.model.OrderService;
import com.eeit144.drinkmaster.back.model.UserService;
import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;

@Controller
@SessionAttributes(names= {"canSeeUser"})
@RequestMapping("front/")
public class FrontOrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderItemsService oiService;
	
	@Autowired
	private UserService userService;
	
	
	@GetMapping("order/userOrder")
	public ModelAndView userOrder(ModelAndView mav,@RequestParam(name = "o", defaultValue = "1") Integer pageNumber,@SessionAttribute("canSeeUser") UserBean user, Model model) {
		
//		List<OrderBean> userOrder = orderService.findOrdersByUserid(userid);
		Optional<UserBean> userBean = userService.findById(user.getUserId());
		UserBean userId = userBean.get();
		Page<OrderBean> userOrder = orderService.findOrdersByUseridPage(pageNumber, userId.getUserId());
				
		model.addAttribute("userOrder", userOrder);
		
//		Page<OrderBean> page = orderService.findByPage(pageNumber);
		OrderBean orderBean = new OrderBean();
		mav.getModel().put("orderBean", orderBean);
		mav.getModel().put("page", userOrder);
		mav.setViewName("/front/frontorderuserorder");
		
		return mav;
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
	
	@GetMapping("order/edit")
	public String editById(@RequestParam("id") Integer id, Model m) {


		
								
		OrderBean orderBean = orderService.findById(id);
		m.addAttribute("orderBean", orderBean);
		return "/front/frontorderupdate";
	}
	
	@PostMapping("order/update")
	public String updateOrder(@ModelAttribute("order") OrderBean orderBean, Model m) {


		
		
		List<OrderBean> orders = orderService.findAll();

		m.addAttribute("orderstatus", orders);
		
		UserBean oldUser = userService.findById(orderBean.getUserId()).get();
		
		
		
		orderBean.setUserBean(oldUser);
		
		
		orderService.insertOrder(orderBean);

		return "redirect:/front/order/userOrder";
	}
	
}
