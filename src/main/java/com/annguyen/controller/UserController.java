package com.annguyen.controller;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.annguyen.entity.Color;
import com.annguyen.entity.Employees;
import com.annguyen.entity.Orders;
import com.annguyen.entity.Roles;
import com.annguyen.service.EmployeesServices;
import com.annguyen.service.RolesServices;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Transactional
@RequestMapping("/admin/employees")
public class UserController {

	@Autowired
	EmployeesServices employeesServices;
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	RolesServices rolesServices;
	@GetMapping
	public String getListEmp(ModelMap modelMap) {
		List<Employees> list = employeesServices.getListEmployees();
		Session session = sessionFactory.getCurrentSession();
		List<Roles> listRole = rolesServices.getListRoles();
		modelMap.addAttribute("list", list);
		modelMap.addAttribute("listRole", listRole);
		return "employee";
	}
	@PostMapping("/add")
	@ResponseBody
	public String addEmp(@RequestParam String employeeJson,ModelMap modelMap) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			JsonNode jsonNode = mapper.readTree(employeeJson);
			boolean check = employeesServices.check(jsonNode.get("username").asText());
			if(check) {
				System.out.println("ADD ERROR");
				String tb1="ERROR";
				return tb1;
				
			}else {
				Employees employees = new Employees();
				employees.setFullname(jsonNode.get("fullname").asText());
				employees.setAddress(jsonNode.get("address").asText());
				employees.setSex(jsonNode.get("sex").asInt());
				//emp.setSex(jsonNode.get("sex").asText());
				employees.setIdcard(jsonNode.get("idcard").asText());
				Roles role = new Roles();
				role.setRole_id(jsonNode.get("role_name").asInt());
				employees.setRoles(role);
				employees.setEmail(jsonNode.get("email").asText());
				employees.setUsername(jsonNode.get("username").asText());
				employees.setPassword(jsonNode.get("password").asText());
				employeesServices.create(employees);
				System.out.println("SUCCESSFULLY");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "employee";
	}
	
	@PostMapping("/search")
	public String search(@RequestParam int id_emp,ModelMap modelMap) {
		boolean search = employeesServices.searchEmp(id_emp);
		if(search) {
			Employees employees = employeesServices.getEmployee(id_emp);
			System.out.println(employees.getAddress());
			int id = employees.getEmployee_id();
			String fullname = employees.getFullname();
			String address = employees.getAddress();
			int gender = employees.getSex();
			String email = employees.getEmail();
			String cmnd = employees.getIdcard();
			String role = employees.getRoles().getRole_name();
			String username = employees.getUsername();
			modelMap.addAttribute("id", id);
			modelMap.addAttribute("fullname", fullname);
			modelMap.addAttribute("address", address);
			modelMap.addAttribute("gender", gender);
			modelMap.addAttribute("email", email);
			modelMap.addAttribute("cmnd", cmnd);
			modelMap.addAttribute("role", role);
			modelMap.addAttribute("username", username);
		}else {
			String error = "THERE ARE NO RESULT";
			modelMap.addAttribute("error", error);
		}
		return "resultTrackUser";
	}
	
	@PostMapping("/update")
	@ResponseBody
	public String updateEmp(@RequestParam String employeeJson) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			JsonNode jsonNode = mapper.readTree(employeeJson);
			
				Employees employees = new Employees();
				
				employees.setFullname(jsonNode.get("fullname").asText());
				employees.setAddress(jsonNode.get("address").asText());
				employees.setSex(jsonNode.get("sex").asInt());
				//emp.setSex(jsonNode.get("sex").asText());
				employees.setIdcard(jsonNode.get("idcard").asText());
				Roles role = new Roles();
				role.setRole_id(jsonNode.get("role_name").asInt());
				employees.setRoles(role);
				
				employees.setEmail(jsonNode.get("email").asText());
				employees.setUsername(jsonNode.get("username").asText());
				employees.setPassword(jsonNode.get("password").asText());
				
				employees.setEmployee_id(jsonNode.get("employee_id").asInt());
				employeesServices.update(employees);
				System.out.println("Update done");
		
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "employee";
	}
	

	
	
	@GetMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam int employee_id) {
		Employees employees = employeesServices.getEmployee(employee_id);
		String role = employees.getRoles().getRole_name();
		System.out.println(role);
		if(role.equalsIgnoreCase("admin")) {
			System.out.println("Delete fail");
		}else {
			employeesServices.delete(employee_id);
		}
		return "true";
	}
	
}
