package com.annguyen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommentFacebookController {
	@GetMapping("/comment")
	public String commentFacebook() {
		return "commentFacebook";
	}
}
