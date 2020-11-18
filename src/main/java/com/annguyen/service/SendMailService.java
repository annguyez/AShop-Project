package com.annguyen.service;

public interface SendMailService {
	public void sendEmail(String from, String to, String subject, String content);
}
