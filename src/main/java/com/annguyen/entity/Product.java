package com.annguyen.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="product")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int product_id;

	@OneToOne
	@JoinColumn(name="category_id",referencedColumnName = "category_id")
	Category category;
	
	String product_name;
	String price;
	String descriptions;
	String image;
	

	@ManyToMany
	@JoinTable(name="sale_detail",
		joinColumns = @JoinColumn(name="product_id",referencedColumnName = "product_id"),
		inverseJoinColumns = @JoinColumn(name="sale_id",referencedColumnName = "sale_id")
			)
	Set<Sale> sales;
	
	
	
	public Set<Sale> getSales() {
		return sales;
	}
	public void setSales(Set<Sale> sales) {
		this.sales = sales;
	}
	
	@OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name="product_id",referencedColumnName = "product_id")
	Set<Product_detail> products_detail;
	
	public Set<Product_detail> getProducts_detail() {
		return products_detail;
	}
	public void setProducts_detail(Set<Product_detail> products_detail) {
		this.products_detail = products_detail;
	}
	public int getProduct_id() {
		return product_id;
	}
	
	public String getProduct_name() {
		return product_name;
	}
	public String getPrice() {
		return price;
	}
	public String getDescriptions() {
		return descriptions;
	}
	public String getImage() {
		return image;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}
	public void setImage(String image) {
		this.image = image;
	}

	
}
