package com.annguyen.service;

import com.annguyen.entity.Event;
import com.annguyen.entity.Product;

public interface EventService {
	public Event getEvent();
	public boolean update(Event event);
}
