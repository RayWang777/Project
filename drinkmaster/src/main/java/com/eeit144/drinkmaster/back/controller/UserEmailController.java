package com.eeit144.drinkmaster.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.eeit144.drinkmaster.back.model.EmailSenderService;
import com.eeit144.drinkmaster.back.model.UserService;
import com.eeit144.drinkmaster.bean.EmailMessage;
import com.eeit144.drinkmaster.bean.UserBean;

@Controller
@Transactional
@RequestMapping("front/")
public class UserEmailController {

	private final EmailSenderService emailSenderService;
	
	@Autowired
	private UserService userService;
	
	public UserEmailController(EmailSenderService emailSenderService) {
		this.emailSenderService = emailSenderService;
	}
	
	@PostMapping("send-register-email")
	public String sendRegisterEmail(@ModelAttribute("user") UserBean user, 
			BindingResult result, @RequestParam("reallogo") MultipartFile photo,Model m) {

		System.out.println(user);
		EmailMessage emailMessage = new EmailMessage();
		emailMessage.setTo(user.getUserAccount());
		this.emailSenderService.registerEmail(emailMessage.getTo());
		return "/front/frontlogin";
	}
	
}
