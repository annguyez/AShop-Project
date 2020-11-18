package com.annguyen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.annguyen.entity.Category;
import com.annguyen.entity.Orders;
import com.annguyen.service.CategoryServices;
import com.annguyen.service.OrderService;

@Controller
public class TrackOrderController {
	
	@Autowired
	OrderService orderService;
	@Autowired
	CategoryServices categoryServices;
	
	@GetMapping("/track-order")
	public String trackOrderStatus(ModelMap m) {
		List<Category> categories = categoryServices.getListCategory();
		m.addAttribute("category", categories);
		return "trackOrderStatus";
	}
	
	@PostMapping("/track-order/result-search")
	public String searchOrder(@RequestParam String name,ModelMap modelMap) {
		boolean search = orderService.searchOrderByName(name);
		if(search) {
			Orders order = orderService.getOrderByName(name);
			int id = order.getOrders_id();
			String customer_name = order.getCustomer_name();
			String address = order.getAddress();
			String phone = order.getPhone();
			int status = order.getOrders_status();
			String date = order.getOrders_date();
			String note = order.getNote();
			
			modelMap.addAttribute("id", id);
			modelMap.addAttribute("name", customer_name);
			modelMap.addAttribute("address", address);
			modelMap.addAttribute("phone", phone);
			modelMap.addAttribute("status", status);
			modelMap.addAttribute("date", date);
			modelMap.addAttribute("note", note);
		}else {
			System.out.println("Err");
			String mess = "No result";
			modelMap.addAttribute("mess", mess);
		}
		
		return "resultTrackOrder";
	}
}
