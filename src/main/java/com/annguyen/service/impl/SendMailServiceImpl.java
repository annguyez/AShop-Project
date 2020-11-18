package com.annguyen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.annguyen.dao.SendMailDAO;
import com.annguyen.service.SendMailService;

@Service
public class SendMailServiceImpl implements SendMailService{

	@Autowired
	SendMailDAO sendMailDao;
	
	public void sendEmail(String from, String to, String subject, String content) {
		sendMailDao.sendEmail(from, to, subject, content);
	}
	
}
