package com.eeit144.drinkmaster.back.controller;

import java.io.ByteArrayOutputStream;
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
//import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

//import java.util.Optional;
//import java.util.Random;
//
//import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.OrderItemsService;
import com.eeit144.drinkmaster.back.model.OrderService;
//import com.eeit144.drinkmaster.back.model.ProductService;
import com.eeit144.drinkmaster.back.model.StoreService;
import com.eeit144.drinkmaster.back.model.UserService;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.OrderBeanxslx;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;

@Controller
@RequestMapping("backend/")
public class OrderController<E> {
		
		@Autowired
		private OrderService orderService;
		@Autowired
		private StoreService storeService;
		@Autowired
		private UserService userService;
		@Autowired
		private OrderItemsService oiService;
		@Autowired
		private FirmService firmService;
		
		
		//		@Autowired
//		private ProductService productService;
		
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
			}else if(user.getRole().equals("store")) {
				Optional<StoreBean> storeByUserId = storeService.findStoreByUserId(user.getUserId());
				StoreBean store = storeByUserId.get();
				Page<OrderBean> page = orderService.findBystoreBean_storeId(pageNumber, store.getStoreId());
				mav.getModel().put("page", page);
			}else if(user.getRole().equals("admin")) {
				Page<OrderBean> page = orderService.findByPage(pageNumber);
				mav.getModel().put("page", page);
			}else if(user.getRole().equals("firm")) {
				List<FirmBean> firmByUserId = firmService.findFirmByUserId(user.getUserId());
				FirmBean firm = firmByUserId.get(0);
				Page<OrderBean> page = orderService.findBystoreBean_firmBean_firmId(pageNumber, firm.getFirmId());
				mav.getModel().put("page", page);
			}
			
			
			
			List<UserBean> users = userService.findAllUsers();

			m.addAttribute("orderaddusers", users);
			
			List<StoreBean> stores = storeService.findAllList();

			m.addAttribute("orderaddstores", stores);
			
			
//			Page<OrderBean> page = orderService.findByPage(pageNumber);
			OrderBean orderBean = new OrderBean();
			mav.getModel().put("orderBean", orderBean);
//			mav.getModel().put("page", page);
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
			
			orderBean.setUserBean(oldUser);
			orderBean.setStoreBean(oldStore);

			
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
			if((user.getRole().equals("user"))) {//從前台傳進來的資料需要重新選select才能編輯
				return "redirect:/backend/login";			
			}
			
			List<UserBean> users = userService.findAllUsers();

			m.addAttribute("orderaddusers", users);
			
			List<StoreBean> stores = storeService.findAllList();

			m.addAttribute("orderaddstores", stores);
			
			
			List<OrderBean> orders = orderService.findAll();

			m.addAttribute("orderstatus", orders);
			
			StoreBean oldStore = storeService.findById(orderBean.getStoreId()).get();
			UserBean oldUser = userService.findById(orderBean.getUserId()).get();
			
			
			
			orderBean.setUserBean(oldUser);
			orderBean.setStoreBean(oldStore);
			
			System.out.println("stroeid:"+oldStore.getStoreId());
			System.out.println("userid:"+oldUser.getUserId());
			
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
				@RequestParam(name = "sta", defaultValue = "待付款") String orderStatus,@SessionAttribute("userBean") UserBean user) {
			
			if((user.getRole().equals("user"))) {
				return mav;			
			}else if(user.getRole().equals("store")) {
				Optional<StoreBean> storeByUserId = storeService.findStoreByUserId(user.getUserId());
				StoreBean store = storeByUserId.get();
				if(orderStatus.equals("待付款") || orderStatus.equals("待出貨")){
				Page<OrderBean> page = orderService.findByorderStatusAndStoreBean_storeId(pageNumber, orderStatus, store.getStoreId());
				mav.getModel().put("page", page);
				}
				else {
					Page<OrderBean> page = orderService.findByorderStatusAndStoreBean_storeId(pageNumber, orderStatus, store.getStoreId());
					mav.getModel().put("page", page);
					}
				}
			
			 else if(user.getRole().equals("admin")) {
				Page<OrderBean> page = orderService.findByorderStatus(pageNumber, orderStatus);
				mav.getModel().put("page", page);
			}
			 else if(user.getRole().equals("firm")) {
				List<FirmBean> firmByUserId = firmService.findFirmByUserId(user.getUserId());
				FirmBean firm = firmByUserId.get(0);
				if(orderStatus.equals("待付款") || orderStatus.equals("待出貨")) {
				Page<OrderBean> page = orderService.findByorderStatusAndStoreBean_FirmBean_firmId(pageNumber, orderStatus, firm.getFirmId());
				mav.getModel().put("page", page);
				}
				else {
					Page<OrderBean> page = orderService.findByorderStatusAndStoreBean_FirmBean_firmId(pageNumber, orderStatus, firm.getFirmId());
					mav.getModel().put("page", page);}
				}
			
			OrderBean orderBean = new OrderBean();
			mav.getModel().put("orderBean", orderBean);
		
//			Page<OrderBean> page = orderService.findByorderStatus(pageNumber, orderStatus);
			
			
			
//			mav.getModel().put("page", page);
			
//			if(orderStatus.equals("待付款") || orderStatus.equals("待出貨")) {
//				Page<OrderBean> page = orderService.findByorderStatus(pageNumber, orderStatus);
//				mav.getModel().put("page", page);
//			}else {
//				Page<OrderBean> page = orderService.findByorderStatus(pageNumber, orderStatus);
//				mav.getModel().put("page", page);			
//			}
//			
			
			mav.setViewName("/backend/backorder");
			return mav;
		
		
		
		}


			
			
			
			

		
		
		
		@GetMapping("order/select")
		public ModelAndView selectView(ModelAndView mav, @RequestParam(name = "o", defaultValue = "1") Integer pageNumber,
				@RequestParam(name = "oid", defaultValue = "oid") Integer orderId) {
			Page<OrderBean> page = orderService.selectById(pageNumber, orderId);
			OrderBean orderBean = new OrderBean();
			mav.getModel().put("orderBean", orderBean);
			mav.getModel().put("page", page);
			mav.setViewName("/backend/backorder");
			return mav;
		}
		
		
		
		@GetMapping("order/export")
		public ResponseEntity<byte[]> directExportExcelByObject(HttpServletResponse response) throws IOException {
			
//			List<OrderBean> list = orderService.findAll();
			
			
			List<OrderItems> list = oiService.findOrderOrderitems();
			
			//讓orderBeanxslx可以重複利用
			OrderBeanxslx orderBeanxslx = null;
			
			List<OrderBeanxslx> list2 = new ArrayList<OrderBeanxslx>();
			
			//將找到list的所有資料放到list2裡面
			
			for(OrderItems oi:  list) {
				orderBeanxslx = new OrderBeanxslx();
				orderBeanxslx.setOrderId(oi.getOrderBean().getOrderId());
				orderBeanxslx.setUserName(oi.getOrderBean().getUserBean().getUserName());				
				orderBeanxslx.setStoreName(oi.getOrderBean().getStoreBean().getStoreName());
				orderBeanxslx.setOrderAddress(oi.getOrderBean().getOrderAddress());
				orderBeanxslx.setOrderPhone(oi.getOrderBean().getOrderPhone());
				orderBeanxslx.setOrderStatus(oi.getOrderBean().getOrderStatus());
				orderBeanxslx.setTotalPrice(oi.getOrderBean().getTotalPrice());
				orderBeanxslx.setCreateTime(oi.getOrderBean().getCreateTime());
				orderBeanxslx.setColdhot(oi.getColdhot());
				orderBeanxslx.setQuantity(oi.getQuantity());
				orderBeanxslx.setSweet(oi.getSweet());
				orderBeanxslx.setProductName(oi.getProductBean().getProductName());
				
				list2.add(orderBeanxslx);
			}
			
			
			
			
			
			ExportParams exportParams = new ExportParams();
			exportParams.setSheetName("訂單列表");
			
			Workbook workbook = ExcelExportUtil.exportExcel(exportParams,OrderBeanxslx.class,list2);
			
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			try {
			    workbook.write(bos);
			} finally {
			    bos.close();
			}
			byte[] bytes = bos.toByteArray();
			
						
			HttpHeaders headers = new HttpHeaders();
			headers.add("content-disposition", "attachment;fileName="+URLEncoder.encode("訂單列表.xls","UTF-8"));
			

			return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.OK);
		}
		


		
}		
		

			
		
		
		
		


		

