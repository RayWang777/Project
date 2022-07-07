package com.eeit144.drinkmaster.back.controller;

import java.io.IOException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.eeit144.drinkmaster.back.model.EmailSenderService;
import com.eeit144.drinkmaster.back.model.ServiceService;
import com.eeit144.drinkmaster.back.model.UserService;
import com.eeit144.drinkmaster.back.util.Util;
import com.eeit144.drinkmaster.bean.EmailMessage;
import com.eeit144.drinkmaster.bean.ServiceBean;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.UserBeanDTO;

@RestController
public class EmailController {

	private final EmailSenderService emailSenderService;
	
	@Autowired
	private ServiceService sService;
	
	@Autowired
	private UserService userService;
	
	public EmailController(EmailSenderService emailSenderService) {
		this.emailSenderService = emailSenderService;
	}
	
	@PostMapping("/send-email")
	public ResponseEntity sendEmail(@RequestBody EmailMessage emailMessage) {
		this.emailSenderService.sendEmail(emailMessage.getTo(), emailMessage.getSubject(), emailMessage.getMessage());
		ServiceBean bean = sService.findById(emailMessage.getMsgId());
		bean.setStatus("ok");
		sService.insertService(bean);
		return ResponseEntity.ok("Success");
	}
}
