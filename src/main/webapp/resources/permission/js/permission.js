
$("#reset").click(function() {
	
	document.getElementById("frmRole").reset();
});

$("#btnadd")
		.click(
				function(event) {
					event.preventDefault();
					var roleFrm = $("#frmRole").serializeArray();
					role = {};
					
					$.each(frmRole, function(i, field) {
						role[field.name] = field.value;
					});
					
						$.ajax({

								url : ' /AShop/admin/permission/add', 
								type : 'POST',
								data : {
									roleJson : JSON.stringify(role),
								},
								success : function(value) {
									alert("Successfully");
								},
								error : function() {
									alert("Failed");
								}
							});
					console.log(JSON.stringify(role));
					
				});


$("#delete").click(function() {

	 if (confirm("Comfirm delete")) {
		 $("#listRole input:checked").each(function() {
			 var id=$(this).val();
			var This = $(this);
		
			  $.ajax({
	                url: '/AShop/admin/permission/delete',
	                type: 'get',
	                data: {
	                	role_id: id,
	                },
             		success: function(value){
             			This.closest("tr").remove();
                 		},
             		error: function(){
             			alert("Failed");
                 		}
                 	
	            });
		})
	    }
	    return false;
	
});


$("#chkAll").change(function() {
	if(this.checked){
		$("#listRole input").each(function() {
			$(this).attr("checked",true);
		})
		
	}else{
			$("#listRole input").each(function() {
				$(this).attr("checked",false);
			})
		}
	
}
);



$(".edit").click(function(){
	var role_id =$(this).attr("value");   
	var role =$(this).closest("tr").find("td:eq(2)").text();
	$("#role").val(role);
	

});

$(".update").click(
		function(event) {
			event.preventDefault();
			var role_id =$(this).attr("value");  
			var roleFrm = $("#frmRole").serializeArray();
			var role_id =$(this).attr("value");   
			$.each(frmRole, function(i, field) {
				role[field.name] = field.value;
			});
			role["role_id"] = role_id;
				$.ajax({

						url : ' /AShop/admin/permission/update', 
						type : 'POST',
						data : {
							roleJson : JSON.stringify(role),
						},
						success : function(value) {
							alert("Successfully");
						},
						error : function() {
							alert("Failed");
						}
					});
				
			console.log(JSON.stringify(role));
			location.reload();
		});