package com.annguyen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/admin")
public class AdminController {
	@GetMapping
	public String Admin() {
		return "admin";
	}
	@GetMapping("/track")
	public String trackUser() {
		
		return "searchUserById";
	}
	
	@GetMapping("/test")
	public String test() {
		
		return "test";
	}
	
	@GetMapping("/chart")
	public String chart() {
		
		return "pieChartProduct";
	}
	
	
	
	
}
