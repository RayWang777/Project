package com.eeit144.drinkmaster.bean;

public class EmailMessage {

	private String to;
	private String Subject;
	private String message;
	private Integer msgId;
	
	public EmailMessage() {
		
	}

	public EmailMessage(String to, String subject, String message) {
		super();
		this.to = to;
		Subject = subject;
		this.message = message;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSubject() {
		return Subject;
	}

	public void setSubject(String subject) {
		Subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getMsgId() {
		return msgId;
	}

	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}


	
}
