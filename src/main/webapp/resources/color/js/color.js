$("#btnadd").click(function(event){
	event.preventDefault();
	var colorFrm = $("#frmColor").serializeArray();
	color= {};
	
	$.each(frmColor, function(i, field) {
		color[field.name] = field.value;
	});
	
	$.ajax({
		url : ' /AShop/admin/color/color',
		type : 'POST',
		data : {
			colorJson : JSON.stringify(color),
		},
		success : function(value){
			alert("Successfully");
		},
		error : function(){
			alert("Failed");
		},
	});
	console.log(JSON.stringify(color));
});


$("#reset").click(function() {
	
	document.getElementById("frmColor").reset();
});



$("#delete").click(function() {

	 if (confirm("Comfirm delete")) {
		 $("#listColor input:checked").each(function() {
			 var id=$(this).val();
			var This = $(this);
		
			  $.ajax({
	                url: '/AShop/admin/color/delete',
	                type: 'get',
	                data: {
	                	color_id: id,
	                },
           		success: function(value){
           			This.closest("tr").remove();
               		},
           		error: function(){
						alert("Color being used");
               		}
	            });
		})
	    }
	    return false;
	
});


$("#chkAll").change(function() {
	if(this.checked){
		$("#listColor input").each(function() {
			$(this).attr("checked",true);
		})
		
	}else{
			$("#listColor input").each(function() {
				$(this).attr("checked",false);
			})
		}
}
);

$(".edit").click(function(){
	var color_id =$(this).attr("value");   
	var color_name =$(this).closest("tr").find("td:eq(2)").text();
	$("#color_name").val(color_name);

});

$(".update").click(function(event){
	event.preventDefault();
	var color_id =$(this).attr("value");  
	var color_name= $("#color_name").val();
	if(color_name==""){
		alert("Type color");
		return;
	}
	var colorFrm = $("#frmColor").serializeArray();
	color = {};
	
	$.each(frmColor, function(i, field) {
		color[field.name] = field.value;
		//size["size_id"] = size_id;
	});
	color["color_id"] = color_id;
		$.ajax({

				url : ' /AShop/admin/color/update', 
				type : 'POST',
				data : {
					colorJson : JSON.stringify(color),
				},
				success : function(value) {
					alert("Successfully")
				},
				error : function() {
					alert("Failed")
				}
			});
	console.log(JSON.stringify(color));
});

