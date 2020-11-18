package com.annguyen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.annguyen.dao.Product_detailDAO;
import com.annguyen.entity.Color;
import com.annguyen.entity.Product_detail;
import com.annguyen.entity.Size;
import com.annguyen.model.SizeDTO;
import com.annguyen.service.Product_detailsServices;


@Service
public class Product_detailsServicesImpl implements Product_detailsServices {
	
	@Autowired
	Product_detailDAO product_detailDAO;

	public List<SizeDTO> getListSize(int product_id, int color_id) {
		return product_detailDAO.getListSize(product_id, color_id);

	}
	
	public List<Color> getColor(int product_id) {
		// TODO Auto-generated method stub
		return product_detailDAO.getColor(product_id);
	}

	public List<Size> getSizeByColor(int color_id, int product_id) {
		// TODO Auto-generated method stub
		return product_detailDAO.getSizeByColor(color_id, product_id);
	}
	public List<Product_detail> getProduct_detailsByProduct_id(int product_id){
		return product_detailDAO.getProduct_detailsByProduct_id(product_id);
	}

	public Product_detail getProduct_detailByOr(String product_detail_id) {
		// TODO Auto-generated method stub
		return product_detailDAO.getProduct_detailByOr(product_detail_id);
	}

	public List<Product_detail> getListProduct_detailByOr(String product_detail_id) {
		// TODO Auto-generated method stub
		return product_detailDAO.getListProduct_detailByOr(product_detail_id);
	}

	public void update(Product_detail product_detail) {
		 product_detailDAO.update(product_detail);
		
	}
}
