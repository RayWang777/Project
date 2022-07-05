package com.eeit144.drinkmaster.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.back.model.ServiceService;
import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.ServiceBean;

@SessionAttributes(names={"userBean"})
@Controller
public class ServiceController {

	@Autowired
	private ServiceService sService;

//	private Integer userId = 1;  //測試用

	@GetMapping("/backend/service/reply")
	public ModelAndView deleteMessagePage(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<ServiceBean> page = sService.findByPage(pageNumber);

		mav.getModel().put("page", page);
		mav.setViewName("/backend/backservicereply");
		return mav;
	}

	@GetMapping("/backend/service/viewall")
	public ModelAndView viewMessages(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<ServiceBean> page = sService.findByPage(pageNumber);

		mav.getModel().put("page", page);
		mav.setViewName("/backend/backserviceviewall");
		return mav;
	}

	@GetMapping("/backend/service/add")
	public String addMessagePage(Model model) {

//		UserBean ub = new UserBean();
//		ub.setUserId(userId);	

		ServiceBean workMessages = new ServiceBean();
		ServiceBean latestMsg = sService.getLatest();
//		workMessages.setUserBean(ub);
	
		model.addAttribute("workMessages", workMessages);
		model.addAttribute("latestMsg", latestMsg);

		return "/backend/backserviceadd";
	}
	
	@GetMapping("service/FAQ")
	public String showFAQPage(Model model) {

	

		return "/backend/serviceFAQ";
	}

	//上半部轉頁
	// -------------------------------------------------------------------------------

	
	@GetMapping("backend/service/postreply")
	public String editReply(@RequestParam("serviceId") Integer serviceId, Model model) {
		
		ServiceBean msg = sService.findById(serviceId);
							
		
		model.addAttribute("msg", msg);
		
		return "/backend/backservicereplied";
	}
	
	
	@PostMapping("backend/service/postreply")
	public String postEditReply(@ModelAttribute(name = "msg") ServiceBean msg) {
		
		sService.insertService(msg);
		return "redirect:/backend/service/reply";

	}
	
	
	
	@GetMapping("backend/service/edit")
	public String editMessage(@RequestParam("serviceId") Integer serviceId, Model model) {
		ServiceBean msg = sService.findById(serviceId);
		model.addAttribute("msg", msg);
		return "/backend/backserviceedit";
	}

	@PostMapping("backend/service/edit")
	public String postEditMessage(@ModelAttribute(name = "msg") ServiceBean msg) {
		sService.insertService(msg);
		return "redirect:/backend/service/viewall";

	}

	@GetMapping("backend/service/delete")
	public String deleteMessage(@RequestParam("serviceId") Integer serviceId) {
		sService.deleteById(serviceId);
		return "redirect:/backend/service/viewall";
	}


	@PostMapping("backend/service/post")
	public String ServiceAdd(@ModelAttribute("workMessages") ServiceBean msg, Model model) {
		sService.insertService(msg);

		ServiceBean newMsg = new ServiceBean();
		ServiceBean latestMsg = sService.getLatest();

		model.addAttribute("workMessages", newMsg);
		model.addAttribute("latestMsg", latestMsg);

		return "/backend/backserviceadd";
	}
	
	
//	@GetMapping("backend/service/findStatus")
//	public ModelAndView findStatusView(ModelAndView mav, @RequestParam(name = "S", defaultValue = "1") Integer pageNumber, 
//			@RequestParam(name = "sta", defaultValue = "待付款") String orderStatus) {
//		Page<OrderBean> page = sService.findByserviceStatus(pageNumber, orderStatus);
//		OrderBean orderBean = new OrderBean();
//		mav.getModel().put("orderBean", orderBean);
//		mav.getModel().put("page", page);
//		
//		mav.setViewName("/backend/backorder");
//		return mav;
//	}

}
