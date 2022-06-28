package com.eeit144.drinkmaster.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.eeit144.drinkmaster.back.model.EmailSenderService;
import com.eeit144.drinkmaster.back.model.ServiceService;
import com.eeit144.drinkmaster.bean.EmailMessage;
import com.eeit144.drinkmaster.bean.ServiceBean;

@RestController
public class EmailController {

	private final EmailSenderService emailSenderService;
	
	@Autowired
	private ServiceService sService;
	
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
