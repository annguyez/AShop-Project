package com.annguyen.dao;

import com.annguyen.entity.Event;

public interface EventDAO {
	public Event getEvent();
	
	public boolean update(Event event);
}
