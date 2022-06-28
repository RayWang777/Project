package com.eeit144.drinkmaster.front.controller;

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

import com.eeit144.drinkmaster.back.model.ServiceService;
import com.eeit144.drinkmaster.bean.ServiceBean;
import com.eeit144.drinkmaster.bean.UserBean;

@SessionAttributes(names={"userBean"})
@Controller
@RequestMapping("front/")
public class FrontServiceController {

	@Autowired
	private ServiceService sService;

//	private Integer userId = 1;  //測試用

	@GetMapping("service/reply")
	public ModelAndView deleteMessagePage(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<ServiceBean> page = sService.findByPage(pageNumber);

		mav.getModel().put("page", page);
		mav.setViewName("/backend/backservicereply");
		return mav;
	}

	@GetMapping("service/viewall")
	public ModelAndView viewMessages(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<ServiceBean> page = sService.findByPage(pageNumber);

		mav.getModel().put("page", page);
		mav.setViewName("/backend/backserviceviewall");
		return mav;
	}

	@GetMapping("service/add") //新增sessionattribute
	public String addMessagePage(@SessionAttribute("userBean") UserBean user,Model model) {

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

	// -------------------------------------------------------------------------------

	
	@GetMapping("service/postreply")
	public String editReply(@RequestParam("serviceId") Integer serviceId, Model model) {
		
		ServiceBean msg = sService.findById(serviceId);
							
		
		model.addAttribute("msg", msg);
		
		return "/backend/backservicereplied";
	}
	
	
	@PostMapping("service/postreply")
	public String postEditReply(@ModelAttribute(name = "msg") ServiceBean msg) {
		
		sService.insertService(msg);
		return "redirect:/backend/service/reply";

	}
	
	
	
	@GetMapping("service/edit")
	public String editMessage(@RequestParam("serviceId") Integer serviceId, Model model) {
		ServiceBean msg = sService.findById(serviceId);
		model.addAttribute("msg", msg);
		return "/backend/backserviceedit";
	}

	@PostMapping("service/edit")
	public String postEditMessage(@ModelAttribute(name = "msg") ServiceBean msg) {
		sService.insertService(msg);
		return "redirect:/backend/service/viewall";

	}

	@GetMapping("service/delete")
	public String deleteMessage(@RequestParam("serviceId") Integer serviceId) {
		sService.deleteById(serviceId);
		return "redirect:/backend/service/viewall";
	}


	@PostMapping("service/post")
	public String ServiceAdd(@ModelAttribute("workMessages") ServiceBean msg, Model model) {
		sService.insertService(msg);

		ServiceBean newMsg = new ServiceBean();
		ServiceBean latestMsg = sService.getLatest();

		model.addAttribute("workMessages", newMsg);
		model.addAttribute("latestMsg", latestMsg);

		return "/backend/backserviceadd";
	}


}
