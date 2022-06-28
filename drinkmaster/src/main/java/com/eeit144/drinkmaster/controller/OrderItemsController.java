package com.eeit144.drinkmaster.controller;

import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.StoreBean;
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
	
//	@PostMapping("order/insert")
//	public String insertOrder(@ModelAttribute("orderBean") OrderBean orderBean, Model model,@SessionAttribute("userBean") UserBean user) {
////		
////		@ModelAttribute("userBean key") UserBean variableName;
////		 orderBean.setUserbean(variableName);
//		
//		if((user.getRole().equals("user"))) {
//			return "redirect:/backend/login";			
//		}
//		
//		List<UserBean> users = userService.findAllUsers();
//
//		model.addAttribute("orderaddusers", users);
//		
//		List<StoreBean> stores = storeService.findAllList();
//
//		model.addAttribute("orderaddstores", stores);
//		
//		List<ProductBean> products = orderService.findAllProducts();
//
//		model.addAttribute("orderaddproducts", products);
//		
//		Date createTime = new Date();
//		orderBean.setCreateTime(createTime);
//		
//		//要先找到 store user product 的ID 把資料放到前端
//		StoreBean oldStore = storeService.findById(orderBean.getStoreId()).get();
//		UserBean oldUser = userService.findById(orderBean.getUserId()).get();
//		ProductBean oldProduct = productService.findById(orderBean.getProductId());
//		
//		orderBean.setUserBean(oldUser);
//		orderBean.setStoreBean(oldStore);
//		orderBean.setProductBean(oldProduct);
//		
//		orderService.insertOrder(orderBean);
//		
//		return "redirect:/backend/order/findAll";
//		}
//	
//	@GetMapping("order/edit")
//	public String editById(@RequestParam("id") Integer id, Model m,@SessionAttribute("userBean") UserBean user) {
//		if((user.getRole().equals("user"))) {
//			return "redirect:/backend/login";			
//		}
//		
//		List<UserBean> users = userService.findAllUsers();
//
//		m.addAttribute("orderaddusers", users);
//		
//		List<StoreBean> stores = storeService.findAllList();
//
//		m.addAttribute("orderaddstores", stores);
//		
//		List<ProductBean> products = orderService.findAllProducts();
//
//		m.addAttribute("orderaddproducts", products);
//					
//		
//		OrderBean orderBean = orderService.findById(id);
//		m.addAttribute("orderBean", orderBean);
//		return "/backend/backorderupdate";
//	}
//	
//	@PostMapping("order/update")
//	public String updateOrder(@ModelAttribute("orderBean") OrderBean orderBean, Model m,@SessionAttribute("userBean") UserBean user) {
//		if((user.getRole().equals("user"))) {
//			return "redirect:/backend/login";			
//		}
//		
//		List<UserBean> users = userService.findAllUsers();
//
//		m.addAttribute("orderaddusers", users);
//		
//		List<StoreBean> stores = storeService.findAllList();
//
//		m.addAttribute("orderaddstores", stores);
//		
//		List<ProductBean> products = orderService.findAllProducts();
//
//		m.addAttribute("orderaddproducts", products);
//		
//		List<OrderBean> orders = orderService.findAll();
//
//		m.addAttribute("orderstatus", orders);
//		
//		StoreBean oldStore = storeService.findById(orderBean.getStoreId()).get();
//		UserBean oldUser = userService.findById(orderBean.getUserId()).get();
//		ProductBean oldProduct = productService.findById(orderBean.getProductId());
//		
//		orderBean.setUserBean(oldUser);
//		orderBean.setStoreBean(oldStore);
//		orderBean.setProductBean(oldProduct);
//		
//		
//		orderService.insertOrder(orderBean);
//
//		return "redirect:/backend/order/findAll";
//	}
//	
//	
//	
//	@GetMapping("orderapi")
//	@ResponseBody
//	public List<OrderBean> findBystoreId(Integer id) {
//			return orderService.findBystoreId(id);
//	}
}
