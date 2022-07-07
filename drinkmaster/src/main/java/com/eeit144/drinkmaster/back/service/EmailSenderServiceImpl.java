package com.eeit144.drinkmaster.back.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.eeit144.drinkmaster.back.model.EmailSenderService;

@Service
public class EmailSenderServiceImpl implements EmailSenderService {

	@Autowired
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
	
	@Override
	public void registerEmail(String to) {
		
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setFrom("cdwewe456@gmail.com");
		simpleMailMessage.setTo(to);
		simpleMailMessage.setSubject("飲君子註冊驗證信件");
		simpleMailMessage.setText("Hi, \n感謝您的註冊，請點擊以下連結\nhttp://localhost:8081/drinkmaster/front/login \n"
				+ "========================\n此為自動回覆，請勿直接回覆此mail");
		
		this.mailSender.send(simpleMailMessage);
		
	}
	
	@Override
	public void registerBackEmail(String to) {
		
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setFrom("cdwewe456@gmail.com");
		simpleMailMessage.setTo(to);
		simpleMailMessage.setSubject("飲君子註冊驗證信件");
		simpleMailMessage.setText("Hi, \n感謝您的註冊，請點擊以下連結\nhttp://localhost:8081/drinkmaster/backend/login \n"
				+ "========================\n此為自動回覆，請勿直接回覆此mail");
		
		this.mailSender.send(simpleMailMessage);
		
	}
}
