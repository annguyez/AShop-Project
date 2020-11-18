package com.annguyen.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.annguyen.dao.CategoryDAO;
import com.annguyen.dao.ProductDAO;
import com.annguyen.dao.Product_detailDAO;
import com.annguyen.dao.StatisticsDAO;
import com.annguyen.entity.Category;
import com.annguyen.entity.Product;
import com.annguyen.entity.Product_detail;
import com.annguyen.model.CategoryDTO;
import com.annguyen.model.CategoryStatisticDTO;
import com.annguyen.model.ProductDTO;
import com.annguyen.model.Product_detailDTO;
import com.annguyen.service.StatisticsServices;
@Service
public class StatisticsServicesImp implements StatisticsServices {

	@Autowired
	StatisticsDAO statisticsDAO;
	@Autowired
	ProductDAO productDAO;
	@Autowired 
	Product_detailDAO product_detailDAO;
	@Autowired
	CategoryDAO categoryDAO;
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	public long countTotalProduct(int category_id) {
		return statisticsDAO.countTotalProduct(category_id);
	}
	
	
	public long countTotalProductShipped(int category_id) {
		return statisticsDAO.countTotalProductShipped(category_id);
	}

	
	
	
	public long countTotalProductShippedByMonth(String month,int category_id) {
		return statisticsDAO.countTotalProductShippedByMonth(month,category_id);
	}

	
	
	
	public long countTotalProductByMonth(String month,int category_id) {
		return statisticsDAO.countTotalProductByMonth(month,category_id);
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////
	public List<ProductDTO> getProducts(int category_id,int orderby,int startPosition,int maxResult){
		
		switch(orderby) {
			case 1:return statisticsDAO.getProducts(category_id,"total_quantity desc,",startPosition,maxResult);
			case 2:return statisticsDAO.getProducts(category_id,"total_money desc,",startPosition,maxResult);
			default :return statisticsDAO.getProducts(category_id,"",startPosition,maxResult);
		}
	}

	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	public List<ProductDTO> getProductsShipped(int category_id,int orderby,int startPosition, int maxResult) {
		switch(orderby) {
			case 1:return statisticsDAO.getProductsShipped(category_id,"total_quantity desc,",startPosition,maxResult);
			case 2:return statisticsDAO.getProductsShipped(category_id,"total_money desc,",startPosition,maxResult);
			default :return statisticsDAO.getProductsShipped(category_id,"",startPosition,maxResult);
		}	
	}


	public List<ProductDTO> getProductsByMonth(String month, int category_id,int orderby,int startPosition,int maxResult) {
		switch(orderby) {
			case 1:return statisticsDAO.getProductsByMonth(month,category_id,"total_quantity desc,",startPosition,maxResult);
			case 2:return statisticsDAO.getProductsByMonth(month,category_id,"total_money desc,",startPosition,maxResult);
			default :return statisticsDAO.getProductsByMonth(month,category_id,"",startPosition,maxResult);
		}	
	}

	
	

	public List<ProductDTO> getProductsShippedByMonth(String month, int category_id,int orderby,int startPosition, int maxResult) {
		switch(orderby) {
			case 1:return statisticsDAO.getProductsShippedByMonth(month,category_id,"total_quantity desc,",startPosition,maxResult);
			case 2:return statisticsDAO.getProductsShippedByMonth(month,category_id,"total_money desc,",startPosition,maxResult);
			default :return statisticsDAO.getProductsShippedByMonth(month,category_id,"",startPosition,maxResult);
		}	
	}
	
	public ProductDTO getSingleProduct(int product_id,String month,int status) {
		return statisticsDAO.getSingleProduct(product_id, month, status);
	}
	
	public List<Product_detailDTO> getSingleProductDetails(int product_id,String month,int status){
		List<Product_detailDTO> listDetails = new ArrayList<Product_detailDTO>();
		try {
			Product product = productDAO.getProduct(product_id);
			List<Product_detail> details = product_detailDAO.getProduct_detailsByProduct_id(product_id);
			
			for(Product_detail detail:details ) {
				Product_detailDTO detailDTO = statisticsDAO.getSingleProductDetail(detail.getProduct_detail_id(), month, status);
				listDetails.add(detailDTO);
			}
		}
		catch (Exception e) {
			return null;
		}
		return listDetails;
	}
	public List<CategoryStatisticDTO> getStatisticsleCategory(String month){
		List<CategoryStatisticDTO> list = new ArrayList<CategoryStatisticDTO>();
		List<Category> categories = categoryDAO.getListCategory();
		long[] total = new long[2];
		for(Category category:categories) {
			CategoryStatisticDTO cat = new CategoryStatisticDTO();
			cat.setCategory_id(category.getCategory_id());
			cat.setCategory_name(category.getCategory_name());
			total = statisticsDAO.getStatisticsleCategory(category.getCategory_id(), month, 0);
			cat.setTotalNotshipped(total[0]);
			cat.setTotalNotshippedMoney(total[1]);
			total = statisticsDAO.getStatisticsleCategory(category.getCategory_id(), month, 1 );
			cat.setTotalShipped(total[0]);
			cat.setTotalShippedMoney(total[1]);
			total = statisticsDAO.getStatisticsleCategory(category.getCategory_id(), month, 2);
			cat.setTotalCanceled(total[0]);
			cat.setTotalCanceledMoney(total[1]);
			list.add(cat);
		}
		return list;
	}


}
