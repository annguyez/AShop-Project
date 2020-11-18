package com.annguyen.service;

import java.util.List;

import com.annguyen.entity.Orders_detail;
import com.annguyen.entity.Product_detail;

public interface Orders_detailService {
	boolean AddOrderDetail(Orders_detail orders_detail);
	public int total(int order_id);
	public List<Orders_detail> getListOrders_detailbyId(String product_detail_id);
	public Orders_detail getOrders_detail(String product_detail_id);
	public void delete(String product_detail_id);
}
