package com.annguyen.dao.impl;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.annguyen.dao.EventDAO;
import com.annguyen.entity.Event;
import com.annguyen.entity.Product;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class EventImp implements EventDAO{


	@Autowired
	SessionFactory sessionFactory;
	
	public Event getEvent() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql ="from Event";
		Query query = session.createQuery(hql);
		Event event = (Event) query.getSingleResult();
		return event;
	}

	public boolean update(Event event) {
		Session session = sessionFactory.getCurrentSession();
		session.update(event);
		return true;
	}

}
