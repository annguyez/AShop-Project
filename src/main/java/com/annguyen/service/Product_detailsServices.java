package com.annguyen.service;

import java.util.List;

import com.annguyen.entity.Color;
import com.annguyen.entity.Product_detail;
import com.annguyen.entity.Size;
import com.annguyen.model.SizeDTO;

public interface Product_detailsServices {
	public List<Color> getColor(int product_id);
	public List<Size> getSizeByColor(int color_id, int product_id);
	public List<SizeDTO> getListSize(int product_id, int color_id);
	public List<Product_detail> getProduct_detailsByProduct_id(int product_id);
	public Product_detail getProduct_detailByOr(String product_detail_id);
	public List <Product_detail> getListProduct_detailByOr(String product_detail_id);
	public void update(Product_detail product_detail );
}
