package com.annguyen.dao;

public interface SendMailDAO {
	public void sendEmail(String from, String to, String subject, String content);
}
