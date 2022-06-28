package com.eeit144.drinkmaster.back.controller;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.back.model.OrderItemsService;
import com.eeit144.drinkmaster.back.model.OrderService;
import com.eeit144.drinkmaster.back.model.ProductService;
import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;

@Controller
@RequestMapping("backend/")
public class OrderItemsController {

	@Autowired
	private OrderItemsService oiService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;
	
	
	
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
	

	@GetMapping("orderItems/findId")
	public ModelAndView findByOrderId(ModelAndView mav, @RequestParam(name = "s", defaultValue = "1") Integer pageNumber, 
			@RequestParam(name = "id", defaultValue = "1") Integer orderId) {

		Page<OrderItems> page = oiService.findByOrderBean_orderId(orderId,pageNumber);		
		OrderItems orderItems = new OrderItems();

		mav.getModel().put("orderItems", orderItems);
		mav.getModel().put("page", page);
		mav.setViewName("/backend/backorderselfitems");
		return mav;

	}
	
	@GetMapping("orderItems/delete")
	public String deleteOrder(@RequestParam("id") Integer id) {
		
	
		oiService.deleteById(id);
		return "redirect:/backend/orderItems/findAll";
	}
	
	@PostMapping("orderItems/insert")
	public String insertOrderItems(@ModelAttribute("orderItems") OrderItems orderItems, Model model){
		List<ProductBean> products = orderService.findAllProducts();

		model.addAttribute("addproducts", products);
		
		List<OrderBean> orders = orderService.findAll();

		model.addAttribute("addorders", orders);
		
		ProductBean oldProduct = productService.findById(orderItems.getProductId());
		orderItems.setProductBean(oldProduct);
		
		OrderBean oldOrder = orderService.findById(orderItems.getOrderId());
		orderItems.setOrderBean(oldOrder);
		
		oiService.insertOrderItems(orderItems);
		return "redirect:/backend/orderItems/findAll";
	}
	
	@GetMapping("orderItems/edit")
	public String editById(@RequestParam("id") Integer id, Model m) {

		
		List<ProductBean> products = orderService.findAllProducts();

		m.addAttribute("addproducts", products);
		
		List<OrderBean> orders = orderService.findAll();

		m.addAttribute("addorders", orders);
					
		
		OrderItems orderItems = oiService.findById(id);
		m.addAttribute("orderItems", orderItems);
		return "/backend/backorderitemsupdate";
	}
	
	@PostMapping("orderItems/update")
	public String updateOrder(@ModelAttribute("orderItems") OrderItems orderItems, Model m) {
		
		List<ProductBean> products = orderService.findAllProducts();

		m.addAttribute("addproducts", products);
		
		List<OrderBean> orders = orderService.findAll();

		m.addAttribute("addorders", orders);
		
		
		ProductBean oldProduct = productService.findById(orderItems.getProductId());
		orderItems.setProductBean(oldProduct);
		
		OrderBean oldOrder = orderService.findById(orderItems.getOrderId());
		orderItems.setOrderBean(oldOrder);
		
				
		oiService.insertOrderItems(orderItems);
		return "redirect:/backend/orderItems/findAll";
	}

}
