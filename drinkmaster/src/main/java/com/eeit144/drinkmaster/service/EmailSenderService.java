package com.eeit144.drinkmaster.service;

public interface EmailSenderService {
	void sendEmail(String to,String subject,String message);

}
