package com.eeit144.drinkmaster.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.model.OrderService;

@Controller
@RequestMapping("backend/")
public class OrderController {
		
		@Autowired
		private OrderService orderService;
		
//		@Autowired
//		public OrderController(OrderService orderService) {
//			super();
//			this.orderService = orderService;
//		}
		
		
		@GetMapping("order/detail")
		public String detailView(Model m) {
			OrderBean orderBean = new OrderBean();
			m.addAttribute("orderBean", orderBean);
			return "backorderdetail";
		}
			
		@GetMapping("order/insertView")
		public String addView(Model m) {
			OrderBean orderBean = new OrderBean();
			m.addAttribute("orderBean", orderBean);
			return "backorderinsert";
		}
		
		@GetMapping("order/findAll")
		public ModelAndView findView(ModelAndView mav, @RequestParam(name = "o", defaultValue = "1") Integer pageNumber) {
			Page<OrderBean> page = orderService.findByPage(pageNumber);
			OrderBean orderBean = new OrderBean();
			mav.getModel().put("orderBean", orderBean);
			mav.getModel().put("page", page);
			mav.setViewName("backorder");
			return mav;
		}
		
		@GetMapping("order/delete")
		public String deleteOrder(@RequestParam("id") Integer id) {
			orderService.deleteById(id);
			return "redirect:/backend/order/findAll";
		}
		

		
		@PostMapping("order/insert")
		public String insertOrder(@ModelAttribute("orderBean") OrderBean orderBean, Model model) {			
			orderService.insertOrder(orderBean);
			
			return "redirect:/backend/order/findAll";
			}
		
		@GetMapping("order/edit")
		public String editById(@RequestParam("id") Integer id, Model m) {
			OrderBean orderBean = orderService.findById(id);
			m.addAttribute("orderBean", orderBean);
			return "backorderupdate";
		}
		
		@PostMapping("order/update")
		public String updateOrder(@ModelAttribute("orderBean") OrderBean orderBean, Model m) {
			orderService.insertOrder(orderBean);

			return "redirect:/backend/order/findAll";
		}
		
		
		
		@GetMapping("orderapi")
		@ResponseBody
		public List<OrderBean> findBystoreId(Integer id) {
				return orderService.findBystoreId(id);
		}
		
		
		@GetMapping("order/findStatus")
		public ModelAndView findStatusView(ModelAndView mav, @RequestParam(name = "S", defaultValue = "1") Integer pageNumber, 
				@RequestParam(name = "sta", defaultValue = "待付款") String orderStatus) {
			Page<OrderBean> page = orderService.findByorderStatus(pageNumber, orderStatus);
			OrderBean orderBean = new OrderBean();
			mav.getModel().put("orderBean", orderBean);
			mav.getModel().put("page", page);
			mav.setViewName("backorder");
			return mav;
		}
		
		
}		
		

			
		
		
		//參考作法(未完成)
//		@PostMapping("order/insert")
//		public String insertOrder(@RequestParam String orderAddress, @RequestParam String orderPhone,
//				 @RequestParam String orderStatus, @RequestPart Integer totalPrice,
//				 @RequestParam Date createTime, Model model) {
//			
//			OrderBean orderBean = new OrderBean();
////			OrderDTO orderDTO = new OrderDTO();
//			
//			orderBean.setOrderAddress(orderAddress);
//			orderBean.setOrderPhone(orderPhone);
//			orderBean.setOrderStatus(orderStatus);
//			orderBean.setTotalPrice(totalPrice);
//			orderBean.setCreateTime(createTime);
//				
//			orderService.insertOrder(orderBean);
//			model.addAttribute("orderBean", orderBean);
//			
//			return "backorder";
//			}
		


		

