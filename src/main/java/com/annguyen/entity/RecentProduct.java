package com.annguyen.entity;

public class RecentProduct {
	String product_detail_id;
	String product_name;
	int product_id;
	String price;
	String image;
	
	public String getProduct_detail_id() {
		return product_detail_id;
	}
	public void setProduct_detail_id(String product_detail_id) {
		this.product_detail_id = product_detail_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
