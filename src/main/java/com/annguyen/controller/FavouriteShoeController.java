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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.annguyen.entity.Cart;
import com.annguyen.entity.Category;
import com.annguyen.entity.Favourite;
import com.annguyen.entity.Product_detail;
import com.annguyen.service.ProductServices;
import com.annguyen.service.Product_detailsServices;
import com.annguyen.service.impl.CategoryServicesImp;
import com.annguyen.service.impl.OrderServiceImpl;
import com.annguyen.service.impl.Orders_detailServiceImpl;

@Controller
@SessionAttributes("favourite")
public class FavouriteShoeController {
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
	@GetMapping(value = "/favourite")
	public String viewCart(Model m,HttpSession session) {
		List<Category> listCategory = categoryService.getListCategory();
		m.addAttribute("category", listCategory);
		
		if(null != session.getAttribute("favourite")) {
			List<Favourite> list = (List<Favourite>) session.getAttribute("favourite");
			m.addAttribute("favourite", list);
			m.addAttribute("count",list.size());
		}else {
			m.addAttribute("count",0);
		}
		
		return "favouriteShoe";
	}
	
	@GetMapping("addFavourite")
	@ResponseBody
	public Boolean addFavourite(String product_detail_id, HttpSession session) {
		
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
		boolean on = false;
	
		if(null == session.getAttribute("favourite")){
			List<Favourite> list = new ArrayList<Favourite>();
			Favourite favourite = new Favourite();
			favourite.setProduct_name(detail.getProduct().getProduct_name());
			favourite.setProduct_id(detail.getProduct().getProduct_id());
			favourite.setProduct_detail_id(product_detail_id);
			String price = Double.toString((long)Long.parseLong(detail.getProduct().getPrice())*(100.0-discount)/100);
			favourite.setPrice(price);
			favourite.setImage(detail.getProduct().getImage());
			list.add(favourite);
			session.setAttribute("favourite", list);
			on = true;
		}else {
			List<Favourite> list = (List<Favourite>) session.getAttribute("favourite");
			int check = checkDuplicateFavourite(list, detail.getProduct().getProduct_id(), session);
			if(check==-1) {
				Favourite favourite = new Favourite();
				favourite.setProduct_name(detail.getProduct().getProduct_name());
				favourite.setProduct_id(detail.getProduct().getProduct_id());
				favourite.setProduct_detail_id(product_detail_id);
				String price = Double.toString((long)Long.parseLong(detail.getProduct().getPrice())*(100.0-discount)/100);
				favourite.setPrice(price);
				favourite.setImage(detail.getProduct().getImage());
				list.add(favourite);
				session.setAttribute("favourite", list);
				on = true;
			}else {
				on = false;
				list.remove(check);
				
			}
			
		}
		
		return on;
	}

	private int checkDuplicateFavourite(List<Favourite> list, int product_id, HttpSession session) {
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getProduct_id() == product_id) {
				return i;
			}
		}
		return -1;
	}

	@GetMapping("/deleteFavourite")
	@ResponseBody
	public void deleteFavourite(@RequestParam int product_id,HttpSession session) {
		if(null!=session.getAttribute("favourite")) {
			List<Favourite> list = (List<Favourite>) session.getAttribute("favourite");
			int check = checkDuplicateFavourite(list, product_id, session);
			list.remove(check);
		}
	}
//	@GetMapping("/countFavourite")
//	@ResponseBody
//	public int countCart(HttpSession session) {
//		int count =0;
//		if(null == session.getAttribute("cart"))
//			return count;
//		List<Cart> list = (List<Cart>) session.getAttribute("cart");
//		
//		for(Cart cart:list) {
//			count += cart.getQuantity();
//		}
//		return count;
//	}

}
