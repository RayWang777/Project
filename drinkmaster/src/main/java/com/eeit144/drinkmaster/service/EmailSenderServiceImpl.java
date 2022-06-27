package com.eeit144.drinkmaster.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderServiceImpl implements EmailSenderService {

	private final JavaMailSender mailSender;
	
	public EmailSenderServiceImpl(JavaMailSender mailSender) {
		this.mailSender =mailSender;
	}
	
	@Override
	public void sendEmail(String to, String subject, String message) {
		
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setFrom("cdwewe456@gmail.com");
		simpleMailMessage.setTo(to);
		simpleMailMessage.setSubject("飲君子意見回饋回覆信件");
		simpleMailMessage.setText(message);
		
		this.mailSender.send(simpleMailMessage);
		
	}
	

}
