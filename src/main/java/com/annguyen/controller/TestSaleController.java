/*
 * package com.annguyen.controller;
 * 
 * import java.io.IOException; import java.util.ArrayList; import
 * java.util.HashSet; import java.util.List; import java.util.Set;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.ModelMap; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PathVariable; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.ResponseBody;
 * 
 * import com.annguyen.entity.Category; import com.annguyen.entity.Color; import
 * com.annguyen.entity.Product; import com.annguyen.entity.Product_detail;
 * import com.annguyen.entity.Sale; import com.annguyen.entity.Size; import
 * com.annguyen.model.ProductDTO; import com.annguyen.model.Product_detailDTO;
 * import com.annguyen.model.SaleDTO; import
 * com.annguyen.service.CategoryServices; import
 * com.annguyen.service.ProductServices; import
 * com.annguyen.service.SaleServices; import
 * com.fasterxml.jackson.databind.JsonNode; import
 * com.fasterxml.jackson.databind.ObjectMapper;
 * 
 * @Controller
 * 
 * @RequestMapping("/") public class TestSaleController { public static final
 * int LIMIT=10;
 * 
 * @Autowired ProductServices productServices;
 * 
 * @Autowired CategoryServices categoryServices;
 * 
 * @Autowired SaleServices saleServices;
 * 
 * @PostMapping("/getsale") public String
 * redirectShippedByMonth(@RequestParam(required = false) String
 * product_id,@RequestParam int command ) {
 * 
 * if(product_id=="") { return "redirect:/admin/sale/"+command+"/0/1"; }
 * 
 * return "redirect:/admin/sale/"+command+"/"+product_id+"/1"; }
 * 
 * @GetMapping("/") public String sale(ModelMap modelMap,@PathVariable int
 * command,@PathVariable int product_id,@PathVariable int page) { // long total
 * = saleServices.countTotalSale(); long total = saleServices.countSale(command,
 * product_id); int startPosition = (page-1)*LIMIT; int maxResult =LIMIT; //
 * List<Sale> sales = saleServices.getListSale(startPosition,maxResult);
 * List<Sale> sales; if(total>0) { sales =
 * saleServices.getListSale(command,product_id,startPosition,maxResult); } else
 * { sales = null; } List<Category> categories =
 * categoryServices.getListCategory(); modelMap.addAttribute("command",
 * command); if(product_id!=0) { modelMap.addAttribute("product_id",
 * product_id); } modelMap.addAttribute("sales", sales);
 * modelMap.addAttribute("categories", categories);
 * modelMap.addAttribute("page",page);
 * modelMap.addAttribute("totalpage",(int)Math.ceil((double)total/LIMIT));
 * return "sale"; }
 * 
 * @PostMapping("/add")
 * 
 * @ResponseBody public String addSale(@RequestParam String saleJson) {
 * 
 * 
 * 
 * ObjectMapper mapper = new ObjectMapper(); // int product_id =
 * productServices.getLastest(); int product_id = 1000; String image =""; try {
 * JsonNode jsonNode = mapper.readTree(saleJson); Sale sale = new Sale();
 * 
 * sale.setSale_name(jsonNode.get("sale_name").asText());
 * sale.setSale_start(jsonNode.get("sale_start").asText());
 * sale.setSale_end(jsonNode.get("sale_end").asText());
 * sale.setDiscount(jsonNode.get("discount").asInt());
 * sale.setDescriptions(jsonNode.get("descriptions").asText());
 * 
 * JsonNode jsonDetails = jsonNode.get("products"); Set<Product> set = new
 * HashSet<Product>(); Set<Integer> products_id = new HashSet<Integer>();
 * for(JsonNode detail:jsonDetails) {
 * products_id.add((detail.get("product_id").asInt())); } for(int
 * id:products_id) { Product product = new Product(); product.setProduct_id(id);
 * set.add(product); } sale.setProducts(set); saleServices.create(sale);
 * 
 * } catch (IOException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } return "true"; }
 * 
 * 
 * @GetMapping("/update")
 * 
 * @ResponseBody public SaleDTO getInfo(@RequestParam int sale_id ) { Sale sale
 * = saleServices.getSale(sale_id); SaleDTO saleDTO = new SaleDTO();
 * saleDTO.setSale_id(sale.getSale_id());
 * saleDTO.setSale_name(sale.getSale_name());
 * saleDTO.setSale_start(sale.getSale_start());
 * saleDTO.setSale_end(sale.getSale_end());
 * saleDTO.setDescriptions(sale.getDescriptions());
 * saleDTO.setDiscount(sale.getDiscount()); List<ProductDTO> productsDTO = new
 * ArrayList<ProductDTO>(); List<Object[]> products =
 * productServices.getProducts(sale_id); for(Object[] p:products) { ProductDTO
 * productDTO = new ProductDTO(); productDTO.setProduct_id((Integer)p[0]);
 * productDTO.setProduct_name((String)p[1]); productsDTO.add(productDTO); }
 * saleDTO.setProducts(productsDTO);
 * 
 * return saleDTO; }
 * 
 * @PostMapping("/update")
 * 
 * @ResponseBody public String updateSale(@RequestParam String saleJson) {
 * 
 * 
 * 
 * ObjectMapper mapper = new ObjectMapper(); // int product_id =
 * productServices.getLastest(); String image =""; try { JsonNode jsonNode =
 * mapper.readTree(saleJson); Sale sale = new Sale();
 * 
 * sale.setSale_id(jsonNode.get("sale_id").asInt());
 * sale.setSale_name(jsonNode.get("sale_name").asText());
 * sale.setSale_start(jsonNode.get("sale_start").asText());
 * sale.setSale_end(jsonNode.get("sale_end").asText());
 * sale.setDiscount(jsonNode.get("discount").asInt());
 * sale.setDescriptions(jsonNode.get("descriptions").asText());
 * 
 * 
 * JsonNode jsonDetails = jsonNode.get("products"); Set<Product> set = new
 * HashSet<Product>(); Set<Integer> products_id = new HashSet<Integer>();
 * for(JsonNode detail:jsonDetails) {
 * products_id.add((detail.get("product_id").asInt())); } for(int
 * id:products_id) { Product product = new Product(); product.setProduct_id(id);
 * set.add(product); } sale.setProducts(set); saleServices.update(sale);
 * 
 * } catch (IOException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } return "true"; }
 * 
 * @GetMapping("/delete")
 * 
 * @ResponseBody public String deleteSale(@RequestParam int sale_id) {
 * saleServices.delete(sale_id); return "true"; }
 * 
 * }
 */