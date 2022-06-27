package com.eeit144.drinkmaster.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.model.OrderService;
import com.eeit144.drinkmaster.model.ProductService;
import com.eeit144.drinkmaster.model.StoreService;
import com.eeit144.drinkmaster.model.UserService;

@Controller
@RequestMapping("backend/")
public class OrderController {
		
		@Autowired
		private OrderService orderService;
		@Autowired
		private StoreService storeService;
		@Autowired
		private UserService userService;
		@Autowired
		private ProductService productService;
		
//		@Autowired
//		public OrderController(OrderService orderService) {
//			super();
//			this.orderService = orderService;
//		}
		
		@GetMapping("order/test")
		public String testView(Model m) {

			return "/backend/test";
		}
		
		@GetMapping("order/test2")
		public String test2View(Model m) {

			return "/backend/test2";
		}
		
		@GetMapping("order/detail")
		public String detailView(Model m) {
			OrderBean orderBean = new OrderBean();
			m.addAttribute("orderBean", orderBean);
			return "/backend/backorderdetail";
		}
			
		@GetMapping("order/insertView")
		public String addView(Model m) {
			OrderBean orderBean = new OrderBean();
			m.addAttribute("orderBean", orderBean);
			return "/backend/backorderinsert";
		}
		
		@GetMapping("order/findAll")
		public ModelAndView findView(ModelAndView mav, @RequestParam(name = "o", defaultValue = "1") Integer pageNumber,@SessionAttribute("userBean") UserBean user,Model m) {
			
			if((user.getRole().equals("user"))) {
				return mav;			
			}
			List<UserBean> users = userService.findAllUsers();

			m.addAttribute("orderaddusers", users);
			
			List<StoreBean> stores = storeService.findAllList();

			m.addAttribute("orderaddstores", stores);
			
			Page<OrderBean> page = orderService.findByPage(pageNumber);
			OrderBean orderBean = new OrderBean();
			mav.getModel().put("orderBean", orderBean);
			mav.getModel().put("page", page);
			mav.setViewName("/backend/backorder");
			return mav;
		}
		
		@GetMapping("order/delete")
		public String deleteOrder(@RequestParam("id") Integer id,@SessionAttribute("userBean") UserBean user) {
			
			if((user.getRole().equals("user"))) {
				return "redirect:/backend/login";			
			}
			orderService.deleteById(id);
			return "redirect:/backend/order/findAll";
		}
		

		
		
		@PostMapping("order/insert")
		public String insertOrder(@ModelAttribute("orderBean") OrderBean orderBean, Model model,@SessionAttribute("userBean") UserBean user) {
//			
//			@ModelAttribute("userBean key") UserBean variableName;
//			 orderBean.setUserbean(variableName);
			
			if((user.getRole().equals("user"))) {
				return "redirect:/backend/login";			
			}
			
			List<UserBean> users = userService.findAllUsers();

			model.addAttribute("orderaddusers", users);
			
			List<StoreBean> stores = storeService.findAllList();

			model.addAttribute("orderaddstores", stores);
			
			Date createTime = new Date();
			orderBean.setCreateTime(createTime);
			
			//要先找到 store user product 的ID 把資料放到前端
			StoreBean oldStore = storeService.findById(orderBean.getStoreId()).get();
			UserBean oldUser = userService.findById(orderBean.getUserId()).get();
			ProductBean oldProduct = productService.findById(orderBean.getProductId());
			
			orderBean.setUserBean(oldUser);
			orderBean.setStoreBean(oldStore);
			orderBean.setProductBean(oldProduct);
			
			orderService.insertOrder(orderBean);
			
			return "redirect:/backend/order/findAll";
			}
		
		@GetMapping("order/edit")
		public String editById(@RequestParam("id") Integer id, Model m,@SessionAttribute("userBean") UserBean user) {
			if((user.getRole().equals("user"))) {
				return "redirect:/backend/login";			
			}
			
			List<UserBean> users = userService.findAllUsers();

			m.addAttribute("orderaddusers", users);
			
			List<StoreBean> stores = storeService.findAllList();

			m.addAttribute("orderaddstores", stores);
			
			
			OrderBean orderBean = orderService.findById(id);
			m.addAttribute("orderBean", orderBean);
			return "/backend/backorderupdate";
		}
		
		@PostMapping("order/update")
		public String updateOrder(@ModelAttribute("orderBean") OrderBean orderBean, Model m,@SessionAttribute("userBean") UserBean user) {
			if((user.getRole().equals("user"))) {
				return "redirect:/backend/login";			
			}
			
			List<UserBean> users = userService.findAllUsers();

			m.addAttribute("orderaddusers", users);
			
			List<StoreBean> stores = storeService.findAllList();

			m.addAttribute("orderaddstores", stores);
			
			StoreBean oldStore = storeService.findById(orderBean.getStoreId()).get();
			UserBean oldUser = userService.findById(orderBean.getUserId()).get();
			ProductBean oldProduct = productService.findById(orderBean.getProductId());
			
			orderBean.setUserBean(oldUser);
			orderBean.setStoreBean(oldStore);
			orderBean.setProductBean(oldProduct);
			
			
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
		
		
		@GetMapping("order/select")
		public ModelAndView selectView(ModelAndView mav, @RequestParam(name = "o", defaultValue = "1") Integer pageNumber,
				@RequestParam(name = "oid", defaultValue = "oid") Integer orderId) {
			Page<OrderBean> page = orderService.selectById(pageNumber, orderId);
			OrderBean orderBean = new OrderBean();
			mav.getModel().put("orderBean", orderBean);
			mav.getModel().put("page", page);
			mav.setViewName("backorder");
			return mav;
		}
}		
		

			
		
		
		
		


		

