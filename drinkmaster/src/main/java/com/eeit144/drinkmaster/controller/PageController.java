package com.eeit144.drinkmaster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.bean.ServiceBean;
import com.eeit144.drinkmaster.model.ServiceService;

@Controller
@RequestMapping("/backend")
public class PageController {

	@Autowired
	private ServiceService sService;
	
	@GetMapping("/")
	public String welcomePage() {
		return "backindex";
	}

	@GetMapping("/user")
	String userPage() {
		return "backuser";
	}
	

	@GetMapping("/firm")
	public String firmPage() {
		return "backfirm";
	}

	@GetMapping("/store")
	public String storePage() {
		return "backstore";
	}

	@GetMapping("/product")
	public String productPage() {
		return "backproduct";
	}

	@GetMapping("/shoppingcar")
	public String shoppingcarPage() {
		return "backshoppingcar";
	}

	@GetMapping("/order")
	public String orderPage() {
		return "backorder";
	}

	@GetMapping("/comment")
	public String commentPage() {
		return "backcomment";
	}

	@GetMapping("/service")
	public String servicePage() {
		return "backservice";
	}

	@GetMapping("/backend/serviceadd")
	public String addMessagePage(Model model) {
		
		ServiceBean workMessages = new ServiceBean();
		
		ServiceBean lastestMsg = sService.getLatest();
		
		model.addAttribute("workMessages", workMessages);
		model.addAttribute("lastestMsg", lastestMsg);
		
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
