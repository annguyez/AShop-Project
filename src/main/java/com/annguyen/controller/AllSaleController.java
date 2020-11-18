package com.annguyen.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.annguyen.entity.Category;
import com.annguyen.entity.Product;
import com.annguyen.entity.Sale;
import com.annguyen.model.ProductDTO;
import com.annguyen.model.SaleDTO;
import com.annguyen.service.CategoryServices;
import com.annguyen.service.ProductServices;
import com.annguyen.service.SaleServices;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
@Controller
@RequestMapping("/admin/allsale")
public class AllSaleController {
	public static final  int LIMIT=100;
	
	@Autowired
	ProductServices productServices;
	@Autowired
	CategoryServices categoryServices;
	@Autowired
	SaleServices saleServices;
	
	
	@GetMapping("/cmd={command}/product-id={product_id}")
	public String sale(ModelMap modelMap,@PathVariable int command,@PathVariable int product_id) {
//		long total = saleServices.countTotalSale();
		long total = saleServices.countSale(command, product_id);
		int startPosition = 0;
		int maxResult =LIMIT;
		List<Sale> sales;
		if(total>0) {
			 sales = saleServices.getListSale(command,product_id,startPosition,maxResult);
		}
		else {
			 sales = null;
		}
		List<Category> categories = categoryServices.getListCategory();
		modelMap.addAttribute("command", command);
		if(product_id!=0) {
			modelMap.addAttribute("product_id", product_id);
		}
		modelMap.addAttribute("sales", sales);
		modelMap.addAttribute("categories", categories);
		return "allSale";
	}
	@GetMapping("/update")
	@ResponseBody
	public SaleDTO getInfo(@RequestParam int sale_id ) {
		Sale sale = saleServices.getSale(sale_id);
		SaleDTO saleDTO = new SaleDTO();
		saleDTO.setSale_id(sale.getSale_id());
		saleDTO.setSale_name(sale.getSale_name());
		saleDTO.setSale_start(sale.getSale_start());
		saleDTO.setSale_end(sale.getSale_end());
		saleDTO.setDescriptions(sale.getDescriptions());
		saleDTO.setDiscount(sale.getDiscount());
		return saleDTO;	
	}
	@PostMapping("/update")
	@ResponseBody
	public String updateSale(@RequestParam String saleJson) {
		
	
		ObjectMapper mapper = new ObjectMapper();
		// int product_id = productServices.getLastest();
		String image ="";
		try {
			JsonNode  jsonNode = mapper.readTree(saleJson);
			Sale sale = new Sale();
			sale.setSale_id(jsonNode.get("sale_id").asInt());
			sale.setSale_name(jsonNode.get("sale_name").asText());
			sale.setSale_start(jsonNode.get("sale_start").asText());
			sale.setSale_end(jsonNode.get("sale_end").asText());
			sale.setDiscount(jsonNode.get("discount").asInt());
			sale.setDescriptions(jsonNode.get("descriptions").asText());
			saleServices.update(sale);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "true";
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public String deleteSale(@RequestParam int sale_id) {
		saleServices.delete(sale_id);
		return "true";
	}
	
	
}
