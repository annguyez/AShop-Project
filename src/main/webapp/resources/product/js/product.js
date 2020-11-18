$(window).on('load', function() {
	$.ajax({
		url : '/AShop/admin/product/add',
		success : function(data) {
			$("#manage").html(data);
			convertMoney();
		}
	});

	current = 1;
	$.ajax({
		url : '/AShop/admin/product/getproducts',
		type : 'get',
		data : {
			category_id : 0,
			page : 1,
			limit : 100,
		},
		success : function(data) {
			$("#listProduct").html(data.html);
			page(current, data.total);
		},

	});
});

$("#chkAll").change(function() {
	if (this.checked) {
		$("#listProduct input").each(function() {
			$(this).attr("checked", true);
		})

	} else {
		$("#listProduct input").each(function() {
			$(this).attr("checked", false);
		})
	}

});

$("#delete").click(function() {
	if (confirm("COMFIRM DELETE")) {
		$("#listProduct input:checked").each(function() {
		var id = $(this).val();
		var This = $(this)
		$.ajax({
			url : '/AShop/admin/product/delete',
			type : 'get',
			data : {
				product_id : id,
			},
			success : function(value) {
				This.closest(".product").remove();
				// This.closest("tr").remove;
			},
			error : function() {
				/*alert("Sản phẩm có mã "
						+ id
						+ " đã được đặt hàng,\n cần xóa các đơn hàng của sản phẩm này trước");
				confirm("COMFIRM DELETE");*/
				// alert("ERROR");
			}
		});
	})
	}
});

$(document).on(
		"click",
		".view",
		function() {
			var product_id = $(this).closest("div").closest(".product").find(
					'.product_id').text();
			$("#product_id").val(product_id);
			getInfor(product_id);
		});

function getInfor(product_id) {
	$("#image").val("");
	$.ajax({
		url : '/AShop/admin/product/update',
		type : 'get',
		data : {
			product_id : product_id
		},
		success : function(product) {
			$("#command").val("update");
			$("#btnupdate").removeAttr("hidden");
			$("#back").removeAttr("hidden");

			$("#btnadd").attr("hidden", "true");
			$("#reset").attr("hidden", "true");
			$("#product_name").val(product.product_name);
			$("#category_id").val(product.category_id);
			$("#price").val(product.price);
			$("#descriptions").val(product.descriptions);
			$("#oldimg").val(product.image);
			$("#url").attr("href",
					'http://localhost:8080/AShop/' + product.image)
			$("#img-url").attr("src",
					'http://localhost:8080/AShop/' + product.image)
			$("#url").removeAttr("hidden");
			$("#detail_container").empty();
			var details = product.products_detail;
			for (i = 0; i < details.length; i++) {
				var clone = $("#product_detail").clone(true, true).removeAttr(
						"id");
				clone.find("#color_id").val(details[i].color_id);
				clone.find("#size_id").val(details[i].size_id);
				clone.find("#quantity").val(details[i].quantity);
				$("#detail_container").append(clone);
			}
		},
		error : function() {
			alert("ERROR");
		}

	});

}

$(document).on("click", ".page-item", function() {
	current = $(this).find('a').text();
	current = parseInt(current);
	category_id = $("#slcategory_id").val();
	$.ajax({
		url : '/AShop/admin/product/getproducts',
		type : 'get',
		data : {
			category_id : category_id,
			page : current,
			limit : 15,
		},
		success : function(data) {
			$("#listProduct").html(data.html);
			page(current, data.total);
		},

	});

});

$("#slcategory_id").change(function() {
	category_id = $("#slcategory_id").val();
	current = 1;
	$.ajax({
		url : '/AShop/admin/product/getproducts',
		type : 'get',
		data : {
			category_id : category_id,
			page : 1,
			limit : 15,
		},
		success : function(data) {
			$("#listProduct").html(data.html);
			page(current, data.total);
		},

	});
});

function page(current, total) {

	var i = current - 3;
	if (i < 1)
		i = 1;
	var j = current + 3;
	if (j > total)
		j = total;
	var pagination = "";
	$(".pagination").empty();
	for (; i <= j; i++) {
		if (i == current)
			pagination += ' <li class="page-item active"><a class="page-link" href="#">'
					+ i + '</a></li>';
		else
			pagination += ' <li class="page-item"><a class="page-link" href="#">'
					+ i + '</a></li>';
	}
	$(".pagination").append(pagination);
}

function formatNumber(num) {
	return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
}

function getMoneyValue(formattedMoney) {
	return parseFloat(formattedMoney.replace(/[,]+/g, ""));
}

function convertMoney() {

	$(".money").each(function() {
		$(this).html(formatNumber($(this).text()));
	})

}

$(document).on("change", "#listProduct", function() {
	convertMoney()
});


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
