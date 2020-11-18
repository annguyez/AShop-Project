package com.annguyen.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.annguyen.entity.Category;
import com.annguyen.entity.Product_detail;
import com.annguyen.entity.RecentProduct;
import com.annguyen.service.ProductServices;
import com.annguyen.service.Product_detailsServices;
import com.annguyen.service.impl.CategoryServicesImp;
import com.annguyen.service.impl.OrderServiceImpl;
import com.annguyen.service.impl.Orders_detailServiceImpl;

@Controller
@SessionAttributes("recent")
public class RecentProductController {
	@Autowired
	Product_detailsServices product_detailsServices;
	
	@Autowired
	ProductServices productServices;
	
	@Autowired
	OrderServiceImpl orderService;
	
	@Autowired
	Orders_detailServiceImpl order_detailService;
	@Autowired
	CategoryServicesImp categoryService;
	@GetMapping(value = "/recent")
	public String viewRecentProduct(Model m,HttpSession session) {
		List<Category> listCategory = categoryService.getListCategory();
		m.addAttribute("category", listCategory);
		
		if(null != session.getAttribute("recent")) {
			List<RecentProduct> list = (List<RecentProduct>) session.getAttribute("recent");
			m.addAttribute("recent", list);
			m.addAttribute("count",list.size());
		}
		
		return "recentProduct";
	}
	
	@GetMapping("addRecentProduct")
	@ResponseBody
	public String addRecentProduct(String product_detail_id, HttpSession session) {
		
		Product_detail detail= product_detailsServices.getProduct_detailByOr(product_detail_id);
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String date = sdf.format(today);
		int discount=0;
		try {
			discount=productServices.getMaxDiscount(detail.getProduct().getProduct_id(), date);
		}
		catch (Exception e) {
			discount=0;
		}
		if(null == session.getAttribute("recent")){
			List<RecentProduct> list = new ArrayList<RecentProduct>();
			RecentProduct recent = new RecentProduct();
			recent.setProduct_name(detail.getProduct().getProduct_name());
			recent.setProduct_id(detail.getProduct().getProduct_id());
			recent.setProduct_detail_id(product_detail_id);
			String price = Double.toString((long)Long.parseLong(detail.getProduct().getPrice())*(100.0-discount)/100);
			recent.setPrice(price);
			recent.setImage(detail.getProduct().getImage());
			list.add(recent);
			session.setAttribute("recent", list);
		}else {
			List<RecentProduct> list = (List<RecentProduct>) session.getAttribute("recent");
			int check = checkDuplicateRecentProduct(list, detail.getProduct().getProduct_id(), session);
			if(check==-1) {
				RecentProduct recent = new RecentProduct();
				recent.setProduct_name(detail.getProduct().getProduct_name());
				recent.setProduct_id(detail.getProduct().getProduct_id());
				recent.setProduct_detail_id(product_detail_id);
				String price = Double.toString((long)Long.parseLong(detail.getProduct().getPrice())*(100.0-discount)/100);
				recent.setPrice(price);
				recent.setImage(detail.getProduct().getImage());
				list.add(recent);
				session.setAttribute("recent", list);
				
			}
			
		}
		
		return "recent";
	}

	private int checkDuplicateRecentProduct(List<RecentProduct> list, int product_id, HttpSession session) {
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getProduct_id() == product_id) {
				return i;
			}
		}
		return -1;
	}

}
