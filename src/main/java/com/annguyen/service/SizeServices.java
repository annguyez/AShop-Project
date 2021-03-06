package com.annguyen.service;

import java.util.List;

import com.annguyen.entity.Product;
import com.annguyen.entity.Size;

public interface SizeServices {
	public List<Size> getListSize();
	
	public Product getProductDetailById(int product_id);
	
	public Size getSizeById(int size_id);
	public void delete(int size_id);
	public void create(Size size);
	public void update(Size size);
	public int getLastest();
	public Size getSize(int size_id);
	public boolean check(String size_name);
}
