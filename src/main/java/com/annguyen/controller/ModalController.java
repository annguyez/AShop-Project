package com.annguyen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.annguyen.entity.Event;
import com.annguyen.service.EventService;
@Controller
@RequestMapping("/admin/modal")
public class ModalController {
	@Autowired
	EventService eventService;
	@GetMapping
	public String modal(ModelMap m) {
		Event event = eventService.getEvent();
		m.addAttribute("event", event);
		return "modal";
	}
}
