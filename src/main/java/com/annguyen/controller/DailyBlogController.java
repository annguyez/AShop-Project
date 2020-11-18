package com.annguyen.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.annguyen.entity.Cart;
import com.annguyen.entity.Category;
import com.annguyen.entity.Color;
import com.annguyen.entity.News;
import com.annguyen.entity.Product;
import com.annguyen.model.ProductDTO;
import com.annguyen.service.CategoryServices;
import com.annguyen.service.DailyBlogService;
import com.annguyen.service.impl.DailyBlogServiceImpl;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
@Controller
public class DailyBlogController {
	
	@Autowired
	DailyBlogService dailyBlogService;
	
	@Autowired
	CategoryServices categoryServices;
	
	@GetMapping(value = "/blog")
	public String dailyBlog(ModelMap m) {
		List<News> list = dailyBlogService.getListNews();
		m.addAttribute("list", list);
		List<Category> categories = categoryServices.getListCategory();
		m.addAttribute("category", categories);
		System.out.println(list);
		return "dailyBlog";
	}
	@GetMapping("/admin/daily-blog")
	public String viewDailyBlog(ModelMap modelMap) {
			List<News> list = dailyBlogService.getListNews();
			modelMap.addAttribute("list",list);
			return "managerDailyBlog";
	}
	
	@GetMapping(value = "/blog/{news_id}")
	public String readDailyBlog(@PathVariable int news_id,Model m) {
		News news = dailyBlogService.getNewsDetailById(news_id);
		m.addAttribute("news", news);
		List<Category> categories = categoryServices.getListCategory();
		m.addAttribute("category", categories);
		
		return "readDailyBlog";
	}
	@PostMapping("/admin/daily-blog/add")
	@ResponseBody
	public String addDailyBlog(@RequestParam String newJson) {
		ObjectMapper mapper = new ObjectMapper();
		String image ="";
		try {
			JsonNode jsonNode = mapper.readTree(newJson);
			
			News news = new News();
			news.setHeading(jsonNode.get("heading").asText());
			news.setCreated_date(jsonNode.get("created_date").asText());
			news.setImage("resources/news/images/default.jpg");
			// news.setImage(jsonNode.get("image").asText());
//			if(jsonNode.get("image").asText()!="") {
//				image = image.concat(jsonNode.get("image").asText());
//				news.setImage("resources/news/images/"+image);
//			}
			news.setContent(jsonNode.get("content").asText());
			news.setContent_img("resources/news/images/default.jpg");
			dailyBlogService.create(news);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "managerDailyBlog";
	}
	
	@GetMapping("/admin/daily-blog/delete")
	@ResponseBody
	public String delete(@RequestParam int news_id) {
		dailyBlogService.delete(news_id);
		return "delete";
		
	}
}
