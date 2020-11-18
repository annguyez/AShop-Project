package com.annguyen.dao.impl;

import java.util.List;

import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.annguyen.dao.DailyBlogDAO;
import com.annguyen.entity.News;
@Repository
@Transactional
public class DailyBlogImp implements DailyBlogDAO{
	
	@Autowired
	SessionFactory sessionFactory;

	public List<News> getListNews() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql ="from News";
		Query query = session.createQuery(hql);
		List<News> list = query.getResultList();
		return list;
	}
	public News getNewsDetailById(int news_id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql  = "from News where news_id="+news_id;
		News news = (News) session.createQuery(hql).getSingleResult();
		return news;
	}
	public void create(News news) {
		Session session = sessionFactory.getCurrentSession();
		session.save(news);
	}
	public void delete(int news_id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(this.getNews(news_id));
	}
	public News getNews(int news_id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(News.class, news_id);
	}
	
}
