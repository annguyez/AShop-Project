$(window).on("load", function() {
	category_id =$("#category_id").val();
	$("#category").val(category_id);
	
	orderby=$("#orderby").val();
	$("#filter").val(orderby);
})

$("#search").click(function(){
	
	var page=$("#page").val();
	if(page==""){
		page = 1;
	}
	
	var category_id=$("#category").val();
	if(category_id==""){
		category_id =0;
	}
	
	var minPrice=$("#minPrice").val();
	if(minPrice==""||minPrice<0){
		minPrice = 0;
	}
	var maxPrice=$("#maxPrice").val();
	if(maxPrice==""||maxPrice<0){
		maxPrice = 0;
	}
	
	var orderby=$("#filter").val();
	if(orderby==""){
		orderby = 1;
	}

	var name=$("#name").val();
	if(name==""){
		name = "";
		var url = "/AShop/searchQuery/"+category_id+"/"+minPrice+"/"+maxPrice+"/"+orderby+"/"+page;
	}
	
	var url = "/AShop/searchQuery/"+category_id+"/"+minPrice+"/"+maxPrice+"/"+name+"/"+orderby+"/"+page;
	$(location).attr('href',url);
	
});



$("#filter").change(function(){
	
	var page=$("#page").val();
	if(page==""){
		page = 1;
	}
	
	var category_id=$("#category").val();
	if(category_id==""){
		category_id =0;
	}
	
	var minPrice=$("#minPrice").val();
	if(minPrice==""||minPrice<0){
		minPrice = 0;
	}
	var maxPrice=$("#maxPrice").val();
	if(maxPrice==""||maxPrice<0){
		maxPrice = 0;
	}
	
	var orderby=$("#filter").val();
	if(orderby==""){
		orderby = 1;
	}

	var name=$("#name").val();
	if(name==""){
		name = "";
		var url = "/AShop/searchQuery/"+category_id+"/"+minPrice+"/"+maxPrice+"/"+orderby+"/"+page;
	}
	
	var url = "/AShop/searchQuery/"+category_id+"/"+minPrice+"/"+maxPrice+"/"+name+"/"+orderby+"/"+page;
	$(location).attr('href',url);
	
});