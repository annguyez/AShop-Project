package com.annguyen.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.annguyen.entity.Category;
import com.annguyen.entity.Color;
import com.annguyen.entity.Product;
import com.annguyen.entity.Product_detail;
import com.annguyen.entity.Size;
import com.annguyen.model.ProductDTO;
import com.annguyen.model.Product_detailDTO;
import com.annguyen.model.Result;
import com.annguyen.service.CategoryServices;
import com.annguyen.service.ColorServices;
import com.annguyen.service.ProductServices;
import com.annguyen.service.Product_detailsServices;
import com.annguyen.service.SizeServices;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.istack.Interned;

@Controller
@RequestMapping("/admin/product")
public class ProductController {
	
	@Autowired
	ProductServices productServices;
	@Autowired
	CategoryServices categoryServices;
	@Autowired
	ColorServices colorServices;
	@Autowired
	SizeServices sizeServices;

	@Autowired
	Product_detailsServices product_detailsServices;
	

	@GetMapping
	public String product(ModelMap modelMap) {
		List<Product> list = productServices.getListProduct();
		List<Category> categories = categoryServices.getListCategory();
		modelMap.addAttribute("list", list);
		modelMap.addAttribute("categories", categories);
		return "product";
		
	}
	
	

	@GetMapping("/add")
	public String addProduct(ModelMap modelMap) {
		List<Category> categories = categoryServices.getListCategory();
		List<Size> sizes = sizeServices.getListSize();
		List<Color> colors = colorServices.getListColor();
		modelMap.addAttribute("categories", categories);
		modelMap.addAttribute("sizes", sizes);
		modelMap.addAttribute("colors", colors);
		return "formProduct";	
	}
	
	@PostMapping("/add")
	@ResponseBody
	public String addProduct(@RequestParam String productJson) {
		ObjectMapper mapper = new ObjectMapper();
		int product_id = 100;
		// int product_id = productServices.getLastest();
		
		String image ="";
		try {
			JsonNode  jsonNode = mapper.readTree(productJson);
			Product product = new Product();

			product.setProduct_name(jsonNode.get("product_name").asText());
			Category category = new Category();
			category.setCategory_id(jsonNode.get("category_id").asInt());
			product.setCategory(category);
			product.setPrice(jsonNode.get("price").asText());
			if(jsonNode.get("image").asText()!="") {
				image = image.concat(Integer.toString(product_id)+"."+jsonNode.get("image").asText());
				product.setImage("resources/image/products/"+image);
			}
			product.setDescriptions(jsonNode.get("descriptions").asText());

			JsonNode  jsonDetails = jsonNode.get("product_detail");
			Set<Product_detail> set = new HashSet<Product_detail>();
			int color_id;
			int size_id;
			for(JsonNode detail:jsonDetails) {
				Color color = new Color();
				color.setColor_id(detail.get("color_id").asInt());
				Size size = new Size();
				size.setSize_id(detail.get("size_id").asInt());
				Product_detail product_detail = new Product_detail();
				product_detail.setProduct_detail_id(product_id+"-"+color.getColor_id()+"-"+size.getSize_id());
				product_detail.setColor(color);
				product_detail.setSize(size);
				product_detail.setQuantity(detail.get("quantity").asInt());
				set.add(product_detail);
			}
			
			product.setProducts_detail(set);
			if(!productServices.create(product)) {
				image="-1";
			}
			
	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return image;
	}
	
	
	@GetMapping("/update")
	@ResponseBody
	public ProductDTO getInfo(@RequestParam int product_id ) {
		ProductDTO productDTO = new ProductDTO();
		Product product = productServices.getProduct(product_id);
		productDTO.setProduct_id(product_id);
		System.out.println(product.getProduct_name());
		productDTO.setProduct_name(product.getProduct_name());
		productDTO.setCategory_id(product.getCategory().getCategory_id());
		productDTO.setImage(product.getImage());
		productDTO.setDescriptions(product.getDescriptions());
		productDTO.setPrice(product.getPrice());
		List<Product_detailDTO> products_detail = new ArrayList();
		List<Product_detail> product_details = product_detailsServices.getProduct_detailsByProduct_id(product_id);
		for(Product_detail detail:product_details) {
			Product_detailDTO productdetail= new Product_detailDTO();
			productdetail.setProduct_detail_id(detail.getProduct_detail_id());
			productdetail.setProduct_id(product_id);
			productdetail.setColor_id(detail.getColor().getColor_id());
			productdetail.setSize_id(detail.getSize().getSize_id());
			productdetail.setQuantity(detail.getQuantity());	
			products_detail.add(productdetail);	
		}
		productDTO.setProducts_detail(products_detail);
		return productDTO;	
	}
	
	
	@PostMapping("/update")
	@ResponseBody
	public String updateProduct(@RequestParam String productJson) {
		
	
		ObjectMapper mapper = new ObjectMapper();
		
		String image ="";
		try {
			JsonNode  jsonNode = mapper.readTree(productJson);
			Product product = new Product();
			int product_id = jsonNode.get("product_id").asInt();
			product.setProduct_id(product_id);
			product.setProduct_name(jsonNode.get("product_name").asText());
			Category category = new Category();
			category.setCategory_id(jsonNode.get("category_id").asInt());
			product.setCategory(category);
			product.setPrice(jsonNode.get("price").asText());
			if(jsonNode.get("image").asText()!="") {
				image = image.concat(Integer.toString(product_id)+"."+jsonNode.get("image").asText());
				product.setImage("resources/image/products/"+image);
			}
			product.setDescriptions(jsonNode.get("descriptions").asText());
			
			
			JsonNode  jsonDetails = jsonNode.get("product_detail");
			Set<Product_detail> set = new HashSet<Product_detail>();
			int color_id;
			int size_id;
			
			for(JsonNode detail:jsonDetails) {
				
				Color color = new Color();
				color.setColor_id(detail.get("color_id").asInt());
				Size size = new Size();
				size.setSize_id(detail.get("size_id").asInt());
				
				Product_detail product_detail = new Product_detail();
				product_detail.setProduct_detail_id(product_id+"-"+color.getColor_id()+"-"+size.getSize_id());
				product_detail.setColor(color);
				product_detail.setSize(size);
				product_detail.setQuantity(detail.get("quantity").asInt());
				set.add(product_detail);
			}
			
			product.setProducts_detail(set);
			if(!productServices.update(product)) {
				image="-1";
			}
	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return image;
	}
	
	@GetMapping("/delete")
	public void deleteProduct(@RequestParam int product_id) {
		productServices.delete(product_id);
	}
	
	@GetMapping("/getproducts")
	@ResponseBody
	public Result getProducts(@RequestParam int category_id,@RequestParam int page,@RequestParam int limit) {
		Result result = new Result();
		Long total =(long) 0;
		List<Product> list = new ArrayList();
		if(category_id==0) {
			list = productServices.getListProduct((page-1)*limit,limit);
			total = productServices.getCountProduct();
		}
		else {
			list = productServices.getListProduct(category_id,(page-1)*limit,limit);
			total = productServices.getCountProduct(category_id);
		}
		String html="";
		for(Product pr:list) {			
			html+=  "						<div class='row-bottom product'>\r\n" + 
					"						<div class='c1'><input class='chkProduct' name='product_id' type='checkbox' value='"+pr.getProduct_id()+"'></div>\r\n" + 
					"						<div class='c2 product_id'>"+pr.getProduct_id()+"</div>\r\n" + 
					"						<div class='c4 '>"+pr.getProduct_name()+"</div>\r\n" + 
					"						<div class='c2 money'>"+pr.getPrice()+"$</div>\r\n" + 
					"						<div class='c3'>"+"<button class='btn btn-primary view'>VIEW</button>"+ 
					"						<button type='button' class='btn btn-danger' id='delete'>DELETE</button>"+"</div>\r\n" + 
					"						<div class='clr'></div>\r\n" + 
					"						</div>";
		}
		result.setHtml(html);
		result.setTotal(Math.ceil((double)total/limit));
		return result;
	}
	
	
	@GetMapping("/getproductssale")
	@ResponseBody
	public Result getProductsSale(@RequestParam int category_id,@RequestParam int page,@RequestParam int limit) {
		Result result = new Result();
		Long total =(long) 0;
		List<Product> list = new ArrayList();
		if(category_id==0) {
			list = productServices.getListProduct((page-1)*limit,limit);
			total = productServices.getCountProduct();
		}
		else {
			list = productServices.getListProduct(category_id,(page-1)*limit,limit);
			total = productServices.getCountProduct(category_id);
		}
		String html="";
		for(Product pr:list) {			
			html+="<tr class=\"product\">\r\n" + 
					"														<td>"+pr.getProduct_id()+"</td>" + 
					"														<td class='td-custom'>"+pr.getProduct_name()+"</td>" + 
					" <td><img src=../../../../"+pr.getImage()+"></td>" + 
					"														<td class='money'>"+pr.getPrice()+"$</td>" + 
					"														<td><button type='button' class='btnAddTo btn btn-success'>+</button></td>" + 
					"													<tr>";
		}
		result.setHtml(html);
		result.setTotal(Math.ceil((double)total/limit));
		return result;
	}

}
