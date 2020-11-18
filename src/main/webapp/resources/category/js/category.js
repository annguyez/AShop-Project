$("#btnadd").click(function(event){
	event.preventDefault();
	var categoryFrm = $("#frmCategory").serializeArray();
	category= {};
	$.each(frmCategory, function(i, field) {
		category[field.name] = field.value;
	});
	
	$.ajax({
		url : ' /AShop/admin/category/category',
		type : 'POST',
		data : {
			categoryJson : JSON.stringify(category), 
		},
		success : function(value){
			alert("Add successfully");
		},
		error : function(){
			alert("Add failed");
		},
	});
	console.log(JSON.stringify(category));
	
});

$("#reset").click(function() {
	
	document.getElementById("frmCategory").reset();
});



$("#delete").click(function() {

	 if (confirm("Comfirm delete?")) {
		 $("#listCategory input:checked").each(function() {
			 var id=$(this).val();
	
			var This = $(this);
		
			  $.ajax({
	                url: '/AShop/admin/category/delete',
	                type: 'get',
	                data: {
	                	category_id: id,
	                },
           		success: function(value){
           			This.closest("tr").remove();
           			alert("Delete successfully");
               		},
           		error: function(){
						
						confirm("Error");
               		}
               	
	            });
		})
	    }
	    return false;
	
});


$("#chkAll").change(function() {
	if(this.checked){
		$("#listCategory input").each(function() {
			$(this).attr("checked",true);
		})
		
	}else{
			$("#listCategory input").each(function() {
				$(this).attr("checked",false);
			})
		}
	
}
);

$(".edit").click(function(){
	var category_id =$(this).attr("value");   
	var category_name =$(this).closest("tr").find("td:eq(2)").text();
	$("#category_name").val(category_name);
	
	var image =$(this).closest("tr").find("td:eq(3)").text();
	$("#image").val(image);

});

$(".update").click(function(event){
	event.preventDefault();
	var category_id =$(this).attr("value");  
	var categoryFrm = $("#frmCategory").serializeArray();
	category = {};
	
	$.each(frmCategory, function(i, field) {
		category[field.name] = field.value;
		//size["size_id"] = size_id;
	});
	category["category_id"] = category_id;
	category["image"] = "";
		$.ajax({

				url : ' /AShop/admin/category/update', 
				type : 'POST',
				data : {
					categoryJson : JSON.stringify(category),
				},
				success : function(value) {
					alert("Successfully");
				},
				error : function() {
					alert("Failed");
				}
			});
		
	console.log(JSON.stringify(category));
	
	

});

