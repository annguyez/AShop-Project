package com.annguyen.service;

import java.util.List;

import com.annguyen.entity.Color;
import com.annguyen.entity.Product;

public interface ColorServices {
	public List<Color> getListColor();
	public void delete(int color_id);
	public void create(Color color_id );
	public void update(Color color_id );
	public int getLastest();
	public Color getColor(int color_id);
	
	public boolean checkColor(String color_name);
	
}
