package com.eeit144.drinkmaster.back.model;

public interface EmailSenderService {
	void sendEmail(String to,String subject,String message);

	void registerEmail(String to);

}
