package com.annguyen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.annguyen.dao.DailyBlogDAO;
import com.annguyen.entity.News;
import com.annguyen.service.DailyBlogService;
@Service
public class DailyBlogServiceImpl implements DailyBlogService{

	@Autowired
	DailyBlogDAO dailyBlogDAO;
	public List<News> getListNews() {
		// TODO Auto-generated method stub
		
		return dailyBlogDAO.getListNews();
	}
	public News getNewsDetailById(int news_id) {
		// TODO Auto-generated method stub
		return dailyBlogDAO.getNewsDetailById(news_id);
	}
	public void create(News news) {
		// TODO Auto-generated method stub
		dailyBlogDAO.create(news);
	}
	public void delete(int news_id) {
		// TODO Auto-generated method stub
		dailyBlogDAO.delete(news_id);
	}
	public News getNews(int news_id) {
		// TODO Auto-generated method stub
		return dailyBlogDAO.getNews(news_id);
	}
	
}
