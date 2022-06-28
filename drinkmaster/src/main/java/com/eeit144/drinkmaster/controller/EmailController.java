package com.eeit144.drinkmaster.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.eeit144.drinkmaster.bean.EmailMessage;
import com.eeit144.drinkmaster.service.EmailSenderService;

@RestController
public class EmailController {

	private final EmailSenderService emailSenderService;
	
	public EmailController(EmailSenderService emailSenderService) {
		this.emailSenderService = emailSenderService;
	}
	
	@PostMapping("/send-email")
	public ResponseEntity sendEmail(@RequestBody EmailMessage emailMessage) {
		this.emailSenderService.sendEmail(emailMessage.getTo(), emailMessage.getSubject(), emailMessage.getMessage());
	return ResponseEntity.ok("Success");
	}
	
}
