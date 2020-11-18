package com.annguyen.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.annguyen.entity.Category;
import com.annguyen.entity.Color;
import com.annguyen.entity.Event;
import com.annguyen.entity.Product;
import com.annguyen.entity.Product_detail;
import com.annguyen.entity.Size;
import com.annguyen.service.EventService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class EventController {
	@Autowired
	EventService eventService;

	@GetMapping("/admin/event")
	public String getEvent(ModelMap m) {
		Event event = eventService.getEvent();
		m.addAttribute("event", event);
		System.out.println(event);
		return "event";
	}
	@PostMapping("/admin/event/update")
	@ResponseBody
	public String updateEvent(Event event) {

		return "a";
	}
}
