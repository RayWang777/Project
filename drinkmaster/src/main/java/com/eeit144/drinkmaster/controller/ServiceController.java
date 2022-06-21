package com.eeit144.drinkmaster.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.bean.ServiceBean;
import com.eeit144.drinkmaster.model.ServiceService;



@Controller
public class ServiceController {

	@Autowired
	private ServiceService sService;
	
	@PostMapping("backend/serviceadd")
	public String ServiceAdd(@ModelAttribute("workMessages") ServiceBean msg,Model model) {
		sService.insertService(msg);
		
		ServiceBean newMsg = new ServiceBean();
		ServiceBean latestMsg = sService.getLatest();
	    
	    model.addAttribute("workMessages", newMsg);
	    model.addAttribute("latestMsg",latestMsg);
	    
		return "backserviceadd";
	}
	
	@GetMapping("backend/serviceedit")
	public String editMessage(@RequestParam("id") Integer id,Model model) {
		ServiceBean msg = sService.findById(id);
		model.addAttribute("msg", msg);
		return "backserviceedit";
	}

	@PostMapping("backend/serviceedit")
	public String postEditMessage(@ModelAttribute(name="msg") ServiceBean msg) {
		sService.insertService(msg);		
		return "redirect:/backend/serviceall";
		      
	}
	@GetMapping("backend/servicedelete")
	public String deleteMessage(@RequestParam("id") Integer id) {
		sService.deleteById(id);
		return "redirect:/backend/serviceall";
	}
	@GetMapping("/backend/serviceadd")
	public String addMessagePage(Model model) {
		
		ServiceBean workMessages = new ServiceBean();
		
		ServiceBean latestMsg = sService.getLatest();
		
		model.addAttribute("workMessages", workMessages);
		model.addAttribute("latestMsg", latestMsg);
		
		return "backserviceadd";
	}
	@GetMapping("/backend/serviceall")
	public ModelAndView viewMessages(ModelAndView mav, 
			@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		Page<ServiceBean> page = sService.findByPage(pageNumber);
		
		mav.getModel().put("page", page);
		mav.setViewName("backserviceview");
		return mav;
	}

	
}
