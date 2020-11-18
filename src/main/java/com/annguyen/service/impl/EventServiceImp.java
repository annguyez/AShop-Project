package com.annguyen.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.annguyen.dao.EventDAO;
import com.annguyen.entity.Event;
import com.annguyen.entity.Product;
import com.annguyen.entity.Product_detail;
import com.annguyen.service.EventService;

@Service
public class EventServiceImp implements EventService{
	@Autowired
	EventDAO eventDAO;

	public Event getEvent() {
		// TODO Auto-generated method stub
		return eventDAO.getEvent();
	}

	public boolean update(Event event) {
	 return eventDAO.update(event);
	}
	
}
