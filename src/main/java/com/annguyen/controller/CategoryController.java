package com.annguyen.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.annguyen.entity.Category;
import com.annguyen.entity.Product_detail;
import com.annguyen.service.CategoryServices;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {

	@Autowired
	CategoryServices CategoryServices;
	
	
	@GetMapping
	public String viewCategory(ModelMap modelMap) {
		List<Category> list = CategoryServices.getListCategory();
		modelMap.addAttribute("list",list);
		return "category";
	}

	
	@PostMapping("/update")
	@ResponseBody
	public String updateCategory(@RequestParam String categoryJson) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			JsonNode jsonNode = mapper.readTree(categoryJson);
			boolean check = CategoryServices.check(jsonNode.get("category_name").asText());
			if(check) {
				System.out.println("Duplicate Nanme");
			}else {
				Category category = new Category();
				
				category.setCategory_name(jsonNode.get("category_name").asText());
				
				category.setImage("");
				category.setCategory_id(jsonNode.get("category_id").asInt());
				CategoryServices.update(category);
				System.out.println("Successfully");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "category";
	}
	
	@PostMapping("/category")
	@ResponseBody
	public String addCategory(@RequestParam String categoryJson) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			JsonNode jsonNode = mapper.readTree(categoryJson);
			boolean check = CategoryServices.check(jsonNode.get("category_name").asText());
			if(check) {
				System.out.println("Added failed");
			}else {
				Category Category = new Category();
				Category.setCategory_name(jsonNode.get("category_name").asText());
				CategoryServices.create(Category);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "category";
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam int category_id) {
		CategoryServices.delete(category_id);
		return "true";
		
	}
	
	
}
