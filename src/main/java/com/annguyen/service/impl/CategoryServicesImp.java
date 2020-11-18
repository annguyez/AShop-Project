package com.annguyen.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.annguyen.dao.CategoryDAO;
import com.annguyen.dao.ProductDAO;
import com.annguyen.dao.impl.CategoryImp;
import com.annguyen.entity.Category;
import com.annguyen.entity.Product;
import com.annguyen.model.CategoryDTO;
import com.annguyen.model.ProductDTO;
import com.annguyen.service.CategoryServices;

@Service
public class CategoryServicesImp implements CategoryServices {

	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ProductDAO productDAO;

	public List<Category> getListCategory() {
		// TODO Auto-generated method stub
		return categoryDAO.getListCategory();
	}

	public Category getCategory(int category_id) {
		// TODO Auto-generated method stub
		return categoryDAO.getCategory(category_id);
	}

	public void delete(int category_id) {
		// TODO Auto-generated method stub
		categoryDAO.delete(category_id);
	}

	public void create(Category category) {
		// TODO Auto-generated method stub
		categoryDAO.create(category);
	}

	public void update(Category category) {
		// TODO Auto-generated method stub
		categoryDAO.update(category);
	}

	public int getLastest() {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<ProductDTO> searchProductByCategory(int id) {
		// TODO Auto-generated method stub
		List<Product> list= categoryDAO.searchProductByCategory(id);
		List<ProductDTO> result = new ArrayList<ProductDTO>();
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String date = sdf.format(today);
		int discount=0;
	
		for(Product pro:list) {
			ProductDTO proDTO = new ProductDTO();
			proDTO.setProduct_name(pro.getProduct_name());
			proDTO.setProduct_id(pro.getProduct_id());
			proDTO.setImage(pro.getImage());
			proDTO.setPrice(pro.getPrice());
			try {
				discount=productDAO.getMaxDiscount(proDTO.getProduct_id(), date);
			}
			catch (Exception e) {
				discount=0;
			}
			proDTO.setDiscount(discount);
			result.add(proDTO);
		}
		return result;
	}

	public boolean check(String category_name) {
		// TODO Auto-generated method stub
		boolean check = categoryDAO.check(category_name);
		
		return check;
	}
	
	




}
