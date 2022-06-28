package com.eeit144.drinkmaster.back.service;

public interface EmailSenderService {
	void sendEmail(String to,String subject,String message);

}
