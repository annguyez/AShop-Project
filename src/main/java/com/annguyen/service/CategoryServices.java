package com.annguyen.service;

import java.util.List;

import com.annguyen.entity.Category;
import com.annguyen.entity.Product;
import com.annguyen.model.CategoryDTO;
import com.annguyen.model.ProductDTO;

public interface CategoryServices {
	public List<Category> getListCategory();
	public List<ProductDTO> searchProductByCategory(int id);
	public Category getCategory(int category_id);
	
	public void delete(int category_id);
	public void create(Category category );
	public void update(Category category );
	public int getLastest();
	public boolean check(String category_name);
	
}
