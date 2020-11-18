package com.annguyen.dao;

import java.util.List;

import com.annguyen.entity.News;

public interface DailyBlogDAO {
	public List<News> getListNews();
	public News getNewsDetailById(int news_id);
	public void create(News news);
	public void delete(int news_id);
	public News getNews(int news_id);
}
