package com.annguyen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.annguyen.entity.Category;
import com.annguyen.entity.Event;
import com.annguyen.entity.Product;
import com.annguyen.model.ProductDTO;
import com.annguyen.service.impl.CategoryServicesImp;
import com.annguyen.service.impl.EventServiceImp;
import com.annguyen.service.impl.ProductServicesImpl;

@Controller
@RequestMapping(value = {"home","/"})
public class HomeController {
	@Autowired
	ProductServicesImpl productService;
	
	@Autowired
	CategoryServicesImp categoryService;
	
	@Autowired
	EventServiceImp eventService;
	
	@GetMapping
	public String getListProduct(Model m) {
		List<Category> listCategory = categoryService.getListCategory();
		m.addAttribute("category", listCategory);
		List<Product> list = productService.getListProduct();
		List<ProductDTO> newest = productService.getListNewest(0,0,16);
		Event event = eventService.getEvent();
		
		List<ProductDTO> bestseller = productService.getBestSeller(0, 0, 5);
		
		m.addAttribute("event", event);
		m.addAttribute("newest", newest);
		m.addAttribute("bestseller", bestseller);
		m.addAttribute("pr", list);
		return "single";
		
	}
	
}
