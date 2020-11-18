package com.annguyen.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.annguyen.entity.Category;
import com.annguyen.entity.Color;
import com.annguyen.entity.Product;
import com.annguyen.entity.Product_detail;
import com.annguyen.entity.Size;
import com.annguyen.model.SizeDTO;
import com.annguyen.service.SizeServices;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/admin/size")
public class SizeController {
	@Autowired
	SizeServices sizeServices;


	@GetMapping
	public String viewSize(ModelMap modelMap) {
		List<Size> list = sizeServices.getListSize();
		modelMap.addAttribute("list",list);
		return "size";
	}

	@PostMapping("/size")
	@ResponseBody
	public String addSize(@RequestParam String sizeJson) {
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			JsonNode  jsonNode = mapper.readTree(sizeJson);
			boolean check = sizeServices.check(jsonNode.get("size").asText());
			if(check) {
				System.out.println("Add fail");
				
			}else {
				Size size1 = new Size();
				size1.setSize(jsonNode.get("size").asText());
				
				sizeServices.create(size1);
				
			}
			
	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "size";

	}
	@GetMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam int size_id) {
		sizeServices.delete(size_id);
		return "true";
	}
	
	
	@PostMapping("/update")
	@ResponseBody
	public String updateSize(@RequestParam String sizeJson) {
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			JsonNode  jsonNode = mapper.readTree(sizeJson);
			boolean check = sizeServices.check(jsonNode.get("size").asText());
			if(check) {
				System.out.println("update fail");
			}else {
				Size size1 = new Size();
				size1.setSize(jsonNode.get("size").asText());
				size1.setSize_id(jsonNode.get("size_id").asInt());
				sizeServices.update(size1);
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "size";

	}
}
