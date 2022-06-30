package com.eeit144.drinkmaster.front.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.StoreService;
import com.eeit144.drinkmaster.back.model.UserService;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.UserBeanDTO;

@Controller
@Transactional
@RequestMapping("front/")
@SessionAttributes(names= {"canSeeUser","canSeeFirm","canSeeStore"})
public class FrontUserController {

	private UserService userService;
	
	@Autowired
	private FirmService firmService;

	@Autowired
	private StoreService storeService;
	
	@Autowired
	public FrontUserController(UserService userService) {
		super();
		this.userService = userService;
	}

	@GetMapping("userMessage")
	public String userserch() {
		return "/front/frontuser";
	}
	
	@GetMapping("logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "/front/frontlogin";
	}
	
	@GetMapping("login")
	public String login(Model m) {
		UserBeanDTO user = new UserBeanDTO();
		String userAccount = user.getUserAccount();
		String userPassword = user.getUserPassword();
		
		m.addAttribute("userAccount", userAccount);
		m.addAttribute("userPassword", userPassword);

		return "/front/frontlogin";
	}
	
	@PostMapping("loginGo")
	public String loginGo(Model m, @RequestParam("userAccount") String userAccount, 
			@RequestParam("userPassword") String userPassword) {
		
		UserBean user = new UserBean();
			
		System.out.println("PostMapping:" + userAccount + "  " + userPassword);

		user = userService.findByAccPwd(userAccount, userPassword);
		if(user != null) {
			m.addAttribute(user);
		} else {
			return "/front/login";
		}

		m.addAttribute("canSeeUser",user);
		
		
		return "/front/frontuser";
	}

}
