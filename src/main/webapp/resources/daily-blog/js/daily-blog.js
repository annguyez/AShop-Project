$("#btnadd").click(function(event){
	event.preventDefault();
	var formBlog = $("#formBlog").serializeArray();
	news= {};
	
	$.each(formBlog, function(i, field) {
		news[field.name] = field.value;
	});
	
	$.ajax({
		url : ' /AShop/admin/daily-blog/add',
		type : 'POST',
		data : {
			newJson : JSON.stringify(news), 
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
	
	document.getElementById("formBlog").reset();
});



$("#delete").click(function() {

	 if (confirm("Comfirm delete")) {
		 $("#list input:checked").each(function() {
			 var id=$(this).val();
			var This = $(this);
		
			  $.ajax({
	                url: '/AShop/admin/daily-blog/delete',
	                type: 'get',
	                data: {
	                	news_id: id,
	                },
           		success: function(value){
           			This.closest("tr").remove();
               		},
           		
	            });
		})
	    }
	    return false;
	
});


$("#chkAll").change(function() {
	if(this.checked){
		$("#list input").each(function() {
			$(this).attr("checked",true);
		})
		
	}else{
		$("#list input").each(function() {
			$(this).attr("checked",false);
		})
	}
}
);


