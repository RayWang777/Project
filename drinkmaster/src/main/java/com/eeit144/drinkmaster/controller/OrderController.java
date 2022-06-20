package com.eeit144.drinkmaster.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.jaxb.SpringDataJaxb.OrderDto;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.FirmColumn;
import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.dto.FirmDTO;
import com.eeit144.drinkmaster.dto.OrderDTO;
import com.eeit144.drinkmaster.model.FirmService;
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
		
			
		@GetMapping("order/insertview")
		public String addView(Model m) {
			OrderBean orderBean = new OrderBean();
			m.addAttribute("orderBean", orderBean);
			return "backorderinsert";
		}
		
		@GetMapping("order/findAll")
		public ModelAndView findView(ModelAndView mav, @RequestParam(name = "o", defaultValue = "1") Integer pageNumber) {
			Page<OrderBean> page = orderService.findByPage(pageNumber);

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
		
}		
		
//		@GetMapping("order/update/{id}")
//		public String updateOrder(@PathVariable("id") Integer id,Model m) {
//			
//			OrderBean findOrderById = orderService.findById(id).get();
//			OrderDTO orderDTO = new OrderDTO();			
//			
//			orderDTO.setOrderId(findOrderById.getOrderId());
//			orderDTO.setOrderAddress(findOrderById.getOrderAddress());
//			orderDTO.setOrderPhone(findOrderById.getOrderPhone());
//			orderDTO.setOrderStatus(findOrderById.getOrderStatus());
//			orderDTO.setTotalPrice(findOrderById.getTotalPrice());
//			orderDTO.setCreateTime(findOrderById.getCreateTime());
//			
//			m.addAttribute("order", orderDTO);
//		
//			return "backorder";
//		}	
		
		
	
	
		
		
//		@PostMapping("order/findAll")
//		@ResponseBody
//		public List<OrderBean> postMessageApi(@RequestBody OrderDTO orderDTO) {
//			Integer id = orderDTO.getOrderId();
//			String address = orderDTO.getOrderAddress();
//			
//			OrderBean orderBean = new OrderBean();
//			orderBean.setOrderStatus(address);
//			orderService.insertOrder(orderBean);
//			
//			
//			Page<OrderBean> page = orderService.findByPage(1);
//			List<OrderBean> content = page.getContent();
//			
//			return content;
//		}
		
		
		
		
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
		
//@GetMapping("order/{id}")
//public ResponseEntity<OrderDTO> findOrderById(@PathVariable Integer id) {
//	Optional<OrderBean> orderBean = orderService.findById(id);
//
//	if (orderBean.isEmpty()) {
//		return new ResponseEntity<OrderDTO>(HttpStatus.NO_CONTENT);
//	}
//	
//	OrderDTO orderDTO = new OrderDTO();
//	orderDTO.setOrderId(orderBean.get().getOrderId());
//	orderDTO.setShopCarId(orderBean.get().getShopCarId());
//	orderDTO.setStoreId(orderBean.get().getStoreId());
//	orderDTO.setTotalPrice(orderBean.get().getTotalPrice());
//	orderDTO.setOrderStatus(orderBean.get().getOrderStatus());
//	orderDTO.setOrderPhone(orderBean.get().getOrderPhone());
//	orderDTO.setOrderAddress(orderBean.get().getOrderAddress());
//	orderDTO.setCreateTime(orderBean.get().getCreateTime());
//	
//	
//	return new ResponseEntity<OrderDTO>(orderDTO, HttpStatus.OK);
//}

		

