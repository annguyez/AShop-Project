
$("#addmore").click(function() {
	var clone = $("#product_detail").clone(true, true).removeAttr("id");
	$("#detail_container").append(clone);
});


$(".delete").click(function() {

	$(this).closest("div").remove();
});


function add() {

	var productFrm = $("#frmProduct").serializeArray();
	product = {};
	var product_detail = [];

	$.each(productFrm, function(i, field) {
		product[field.name] = field.value;
	});
	product["image"] = $("#image").val().split('\\').pop().split('.').pop();
	$("#detail_container>.product_detail").each(
			function() {

				detail = {};

				color_id = $(this).find(
						'select[name="color_id"]').val();
				size_id = $(this)
						.find('select[name="size_id"]').val();
				quantity = $(this).find(
						'input[name="quantity"]').val();
				quantity = $(this).find(
						'input[name="quantity"]').val();
				

				detail["color_id"] = color_id;
				detail["size_id"] = size_id;
				detail["quantity"] = quantity;
	

				product_detail.push(detail);

			});

	product["product_detail"] = product_detail;
	if(validate(product,false)){
	$
			.ajax({

				url : '/AShop/admin/product/add',
				type : 'post',
				data : {
					productJson : JSON.stringify(product),
				},
				success : function(image) {
					
					if(image=="-1"){
						alert("DUPLICATE PRODUCT")
					}else{
						alert("SUCCESSFULLY");
						upload(image);
					}
					

				},
				error : function() {
					alert("FAILED");
				}
			});
	console.log(JSON.stringify(product));
	}
};

function upload(image){
	if (image != "") {
			files = $("#image")[0].files;
			forms = new FormData();
			forms.append("file", files[0], image);
			$.ajax({
						url : '/AShop/upload/productImg',
						type : 'post',
						contentType : false,
						data : forms,
						enctype : 'multipart/form-data',
						processData : false,
		
						success : function() {
							alert("UPLOADED IMAGE");
						},
						error : function() {
							alert("UPLOAD ERROR");
						}
						
					});
		

	} else
		alert("ERROR");
}



$("#getinfo").click(function(){
	var product_id =$("#product_id").val();
	$("#image").val("");
	$.ajax({
		url : '/AShop/admin/product/update',
		type : 'get',
		contentType : false,
		data :{
			product_id :product_id
		},
		success : function(product) {
			$("#command").val();
			$("#command").val("update");
			
			$("#btnupdate").removeAttr("hidden");
			$("#back").removeAttr("hidden");
			
			$("#btnadd").attr("hidden","true");
			$("#reset").attr("hidden","true");
			
			$("#product_name").val( product.product_name);
			$("#category_id").val(product.category_id);
			$("#price").val(product.price);
			$("#descriptions").val(product.descriptions);	
			$("#oldimg").val(product.image);
			$("#url").attr("href", 'http://localhost:8080/AShop/'+product.image)
			$("#img-url").attr("src", 'http://localhost:8080/AShop/'+product.image)
			$("#url").removeAttr("hidden");
			$("#detail_container").empty();
			var details = product.products_detail;
			for(i=0;i<details.length;i++){
				var clone = $("#product_detail").clone(true, true).removeAttr("id");
				clone.find("#color_id").val(details[i].color_id);
				clone.find("#size_id").val	(details[i].size_id);
				clone.find("#quantity").val(details[i].quantity);
				$("#detail_container").append(clone);
			}
		},
		error : function() {
			alert("ERROR");
		}

	});
	
});


function update() {
	var productFrm = $("#frmProduct").serializeArray();
	product = {};
	var product_detail = [];

	$.each(productFrm, function(i, field) {
		product[field.name] = field.value;
	});
	product["product_id"] = $("#product_id").val();
	
	var newimg = $("#image").val().split('\\').pop().split('.').pop();
	if(newimg!=""){
		product["image"] = newimg;
	}
	else{
		product["image"] = $("#oldimg").val().split('.').pop();
	}
	$("#detail_container>.product_detail").each(
			function() {

				detail = {};

				color_id = $(this).find(
						'select[name="color_id"]').val();
				size_id = $(this)
						.find('select[name="size_id"]').val();
				quantity = $(this).find(
						'input[name="quantity"]').val();
				quantity = $(this).find(
						'input[name="quantity"]').val();

				detail["color_id"] = color_id;
				detail["size_id"] = size_id;
				detail["quantity"] = quantity;

				product_detail.push(detail);

			});

	product["product_detail"] = product_detail;
	if(validate(product,true)){
	$
			.ajax({

				url : '/AShop/admin/product/update',
				type : 'post',
				data : {
					productJson : JSON.stringify(product),
				},
				success : function(image) {
					if(image=="-1"){
						alert("DUPLICATE PRODUCT")
					}else{
						alert("UPDATED");
						upload(image);
					}
					
				},
				error : function() {
					alert("ERROR");
				}
			});
	console.log(JSON.stringify(product));
	}

}

function validate(product,update){
	
	if(product.product_name=="") return false;
	if(product.category_id=="") return false;
	if(product.price=="") return false;
	if(!update){
		if(product.image=="") {
			alert("NOT ENOUGH DATA")
			return false;
		}
	}
	var details = product.product_detail;
	for(i=0;i<details.length;i++){
		if(details[i].quantity<0) {			
			return false;
		}
		
	}
	
	
	
	return true;
	
}

$("#frmProduct").submit(function(){
	command = $("#command").val();
	if(command=="add")
	{	
		add();
	}else
	{
		if(command=="update") update();
	}
	return false;
})

$("#reset").click(function() {
	$.ajax({
		 url: '/AShop/admin/product/add',
		 success:function(data){
			 $("#manage").html(data)
		 }
	});
});

$("#back").click(function() {
	$.ajax({
		 url: '/AShop/admin/product/add',
		 success:function(data){
			 $("#manage").html(data)
		 }
	});
});	 
