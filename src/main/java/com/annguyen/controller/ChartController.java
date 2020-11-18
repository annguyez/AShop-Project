package com.annguyen.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.annguyen.model.CategoryStatisticDTO;
import com.annguyen.model.ProductDTO;
import com.annguyen.model.Product_detailDTO;
import com.annguyen.service.CategoryServices;
import com.annguyen.service.ProductServices;
import com.annguyen.service.Product_detailsServices;
import com.annguyen.service.StatisticsServices;

@Controller
@RequestMapping("/admin/chart")
public class ChartController {
	
	
	public static final  int LIMIT=10;
	@Autowired
	ProductServices productServices;
	@Autowired
	Product_detailsServices product_detailsServices;
	@Autowired 
	StatisticsServices statisticsServices;
	@Autowired
	CategoryServices categoryServices;
	
	
	
	@GetMapping("/singleproduct")
	public String singleProduct() {
		return "pieChartProduct";
	}
	
	@PostMapping("/redirectSingleproduct")
	public String redirectSingleProduct(@RequestParam int product_id,@RequestParam(required = false) String month) {
		if(month==null) {
			return "redirect:/admin/chart/singleproduct/"+product_id;
		}
		return "redirect:/admin/chart/singleproduct/"+product_id+"/"+month;
	}
	
	@GetMapping("/singleproduct/{product_id}")
	public String getSingleProduct(@PathVariable int product_id,ModelMap modelMap) {
		ProductDTO notShipped = statisticsServices.getSingleProduct(product_id,"",0);
		ProductDTO shipped = statisticsServices.getSingleProduct(product_id,"",1);
		ProductDTO shipping = statisticsServices.getSingleProduct(product_id,"",3);
		ProductDTO canceled = statisticsServices.getSingleProduct(product_id,"",2);
		
		ProductDTO NULL = new ProductDTO();
		NULL.setTotal(0);
		NULL.setTotal_money(0);
		
		if(notShipped==null) {
			notShipped = NULL;
		}
		if(shipped==null) {
			shipped = NULL;
		}
		
		if(canceled==null) {
			canceled = NULL;
		}
		if(shipping==null) {
			shipping = NULL;
		}
		
		
		List<Product_detailDTO> notShippedllDetails =statisticsServices.getSingleProductDetails(product_id,"",0);
		List<Product_detailDTO> shippedDetails =statisticsServices.getSingleProductDetails(product_id,"",1);
		List<Product_detailDTO> canceledDetails =statisticsServices.getSingleProductDetails(product_id,"",2);
		List<Product_detailDTO> shippingDetails =statisticsServices.getSingleProductDetails(product_id,"",3);
		
		
		Product product = productServices.getProduct(product_id);
		modelMap.addAttribute("product", product);
		modelMap.addAttribute("notShipped", notShipped);
		modelMap.addAttribute("shipped", shipped);
		modelMap.addAttribute("shipping", shipping);
		modelMap.addAttribute("canceled", canceled);
		modelMap.addAttribute("product_id", product_id);
		
		
		modelMap.addAttribute("notShippedllDetails", notShippedllDetails);
		modelMap.addAttribute("shippedDetails", shippedDetails);
		modelMap.addAttribute("canceledDetails", canceledDetails);
		modelMap.addAttribute("shippingDetails", shippingDetails);
		
		return "pieChartProduct";
	}
	
	
}
