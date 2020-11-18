package com.annguyen.controller;

import java.io.IOException;
import java.util.List;

import javax.mail.Message;
import javax.mail.MessageContext;
import javax.swing.JOptionPane;

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
import com.annguyen.entity.Product_detail;
import com.annguyen.service.ColorServices;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/admin/color")
public class ColorController {

	@Autowired
	ColorServices colorServices;

	@GetMapping
	public String viewColor(ModelMap modelMap) {
		List<Color> list = colorServices.getListColor();
		modelMap.addAttribute("list",list);
		return "color";
	}

	@PostMapping("/update")
	@ResponseBody
	public String updateColor(@RequestParam String colorJson) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			JsonNode jsonNode = mapper.readTree(colorJson);
			boolean check = colorServices.checkColor(jsonNode.get("color_name").asText());
			if(check) {
				System.out.println("Update fail");
			}else {
				Color color = new Color();
				
				color.setColor_name(jsonNode.get("color_name").asText());
				color.setColor_id(jsonNode.get("color_id").asInt());
				
				colorServices.update(color);
				System.out.println("update done");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "color";
	}
	@PostMapping("/color")
	@ResponseBody
	public String addColor(@RequestParam String colorJson) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			JsonNode jsonNode = mapper.readTree(colorJson);
			String a = jsonNode.get("color_name").asText();
			
			boolean check = colorServices.checkColor(a);
			if(check) {
				System.out.println("Duplicate Color");
			}else {
				Color color = new Color();
				color.setColor_name(jsonNode.get("color_name").asText());
				colorServices.create(color);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "color";
	}

	@GetMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam int color_id) {
		colorServices.delete(color_id);
		return "true";
		
	}
	
}
