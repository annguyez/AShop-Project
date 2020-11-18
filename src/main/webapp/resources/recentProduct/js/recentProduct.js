function recentProduct()
{
	var color_id =$("#productColor").val();
	var size_id = $("#productSize").val();
	var product_id = $(".product_id").attr("data-product_id");
	var product_detail_id = product_id+"-"+color_id+"-"+size_id;
	$.ajax({
		url:"/AShop/addRecentProduct",
		type: "GET",
		data: {
			product_detail_id:product_detail_id
		},	
		success:function(){
//			if(on = true){
//				document.getElementById("p1").innerHTML = '<div class="sufee-alert alert with-close alert-success alert-dismissible fade show"><span class="badge badge-pill badge-success">Success</span>Added product to favourite successfully.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
//			}
//			else{
//				document.getElementById("p1").innerHTML = '<div class="sufee-alert alert with-close alert-danger alert-dismissible fade show"><span class="badge badge-pill badge-danger">Failed</span>Added product to favourite failed.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
//			}

			
		},
		error: function(){
			// document.getElementById("p1").innerHTML = '<div class="sufee-alert alert with-close alert-danger alert-dismissible fade show"><span class="badge badge-pill badge-danger">Failed</span> System error.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
		
		}
	});
};
window.onload = function()
{
	recentProduct();
};
 





