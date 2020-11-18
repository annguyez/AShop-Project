package com.annguyen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.annguyen.dao.SizeDAO;
import com.annguyen.entity.Product;
import com.annguyen.entity.Size;
import com.annguyen.service.SizeServices;

@Service
public class SizeServicesImpl implements SizeServices{

	@Autowired
	SizeDAO sizeDAO;
	public List<Size> getListSize() {
		// TODO Auto-generated method stub
		return sizeDAO.getListSize();
	}
	public Product getProductDetailById(int product_id) {
		// TODO Auto-generated method stub
		return null;
	}
	public Size getSizeById(int size_id) {
		// TODO Auto-generated method stub
		return null;
	}
	public void delete(int size_id) {
		// TODO Auto-generated method stub
		sizeDAO.delete(size_id);
	}
	public void create(Size size) {
		// TODO Auto-generated method stub
		sizeDAO.create(size);
	}
	public void update(Size size) {
		// TODO Auto-generated method stub
		sizeDAO.update(size);
	}
	public int getLastest() {
		// TODO Auto-generated method stub
		return 0;
	}
	public Size getSize(int size_id) {
		// TODO Auto-generated method stub
		return null;
	}
	public boolean check(String size_name) {
		// TODO Auto-generated method stub
		boolean check = sizeDAO.check(size_name);
		return check;
	}

}
