package com.annguyen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.annguyen.entity.Employees;
import com.annguyen.entity.Roles;
import com.annguyen.service.EmployeesServices;

@Controller
@RequestMapping("/signup")
public class SignUpController {
	
	@Autowired
	EmployeesServices empService;
	@GetMapping
	public String view() {
		return "signup";
	}
	@PostMapping
	public String Register(@RequestParam String fullname, @RequestParam String username, @RequestParam String password,
			@RequestParam String repassword,ModelMap modelMap) {
		String mess = "";
		if(password.equals(repassword)) {
			
			Employees emp = new Employees();
			Roles r = new Roles();
			emp.setFullname(fullname);
			emp.setUsername(username);
			emp.setPassword(password);
			empService.create(emp);
			mess = "Create account successfully, please login to website now...";
			
		}else {
			mess = "Password does not match.";
		}
		modelMap.addAttribute("mess",mess);
		return "signup";
	}
	
}
