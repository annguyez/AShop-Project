package com.annguyen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.annguyen.entity.Category;
import com.annguyen.model.ProductDTO;
import com.annguyen.service.CategoryServices;
import com.annguyen.service.ProductServices;
import com.annguyen.service.Product_detailsServices;
import com.annguyen.service.StatisticsServices;


@Controller
@RequestMapping("/admin/chart")
public class ProductRevenueChartController {
	public static final  int LIMIT=10;
	@Autowired
	ProductServices productServices;
	@Autowired
	Product_detailsServices product_detailsServices;
	@Autowired 
	StatisticsServices statisticsServices;
	@Autowired
	CategoryServices categoryServices;
	
	
	@GetMapping("/all-product/{category_id}/{orderby}/{page}")
	public String getProductByMonth(@PathVariable int category_id,@PathVariable int orderby,@PathVariable int page,ModelMap modelMap) {	
		long total = statisticsServices.countTotalProduct( category_id);
		int startPosition = (page-1)*LIMIT;
		int maxResult =LIMIT;
		List<Category> categories = categoryServices.getListCategory();
		List<ProductDTO> products = statisticsServices.getProducts(category_id, orderby, startPosition, maxResult);

		
		modelMap.addAttribute("totalpage",(int)Math.ceil((double)total/LIMIT));
		modelMap.addAttribute("categories",categories);
		modelMap.addAttribute("products",products);
		
		modelMap.addAttribute("page",page);
		modelMap.addAttribute("url", "/admin/statistics/all/"+category_id+"/"+orderby);
		return "productRevenueChart";
	}
}
