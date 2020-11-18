
$("#reset").click(function() {
	
	document.getElementById("frmSize").reset();
});

$("#btnadd")
		.click(
				function(event) {
					event.preventDefault();
					var sizeFrm = $("#frmSize").serializeArray();
					size = {};
					var product_detail = [];
					$.each(frmSize, function(i, field) {
						size[field.name] = field.value;
					});
					
						$.ajax({

								url : ' /AShop/admin/size/size', 
								type : 'POST',
								data : {
									sizeJson : JSON.stringify(size),
								},
								success : function(value) {
									alert("Successfully");
								},
								error : function() {
									alert("Failed");
								}
							});
					console.log(JSON.stringify(size));
					location.reload();
				});


$("#delete").click(function() {

	 if (confirm("Comfirm delete")) {
		 $("#listSize input:checked").each(function() {
			 var id=$(this).val();
			var This = $(this);
		
			  $.ajax({
	                url: '/AShop/admin/size/delete',
	                type: 'get',
	                data: {
	                	size_id: id,
	                },
             		success: function(value){
             			This.closest("tr").remove();
                 		},
             		error: function(){
						
						confirm("ERROR");
                 		}
                 	
	            });
		})
	    }
	    return false;
	
});


$("#chkAll").change(function() {
	if(this.checked){
		$("#listSize input").each(function() {
			$(this).attr("checked",true);
		})
		
	}else{
			$("#listSize input").each(function() {
				$(this).attr("checked",false);
			})
		}
	
}
);



$("#getinfo").click(function(){
	var size_id =$("#size_id").val();
	
	$.ajax({
		url : '/AShop/admin/size/size',
		type : 'get',
		contentType : false,
		data :{
			size_id :size_id
		},
		success : function(size) {
			console.log(size);
			$("#szie_name").val( size.size_name);
			alert("Successfully");
		},
		error : function() {
			alert("ERROR");
		}

	});
	console.log(JSON.stringify(size));
	
});



$(".edit").click(function(){
	var size_id =$(this).attr("value");   
	var size =$(this).closest("tr").find("td:eq(2)").text();
	$("#size").val(size);
	

});

$(".update")
.click(
		function(event) {
			event.preventDefault();
			var size_id =$(this).attr("value");  
			var size = $("#size").val();
			if(size==""){
				alert("PLEASE TYPE SIZE ");
				return;
			}
			var sizeFrm = $("#frmSize").serializeArray();
			size = {};
			var size_id =$(this).attr("value");   
			$.each(frmSize, function(i, field) {
				size[field.name] = field.value;
				//size["size_id"] = size_id;
			});
			size["size_id"] = size_id;
				$.ajax({

						url : ' /AShop/admin/size/update', 
						type : 'POST',
						data : {
							sizeJson : JSON.stringify(size),
						},
						success : function(value) {
							alert("Successfully");
						},
						error : function() {
							alert("Failed");
						}
					});
				
			console.log(JSON.stringify(size));
			
			location.reload();
		});