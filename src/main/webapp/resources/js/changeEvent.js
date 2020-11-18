/*
$("#image").click(function(){
	files = $("#image")[0].files;
	forms = new FormData();   
	forms.append("file",files[0]);
	 $.ajax({
         url: '/AShop/uploadEvent/productImg',
         type: 'post',
         contentType: false,
         data: forms,
         enctype: 'multipart/form-data',
         processData:false,
         
   		success: function(){
   		
       		}
   		
     });
	 
});

function upload(image){
	if (image != "") {
			files = $("#image")[0].files;
			forms = new FormData();
			forms.append("file", files[0], image);
			$.ajax({
						url : '/AShop/uploadEvent/productImg',
						type : 'post',
						contentType : false,
						data : forms,
						enctype : 'multipart/form-data',
						processData : false,
		
						success : function() {
							alert("Đã cập nhật hình ảnh sản phẩm");
						},
						error : function() {
							alert("Chưa cập nhật hình ảnh sản phẩm");
						}
						
					});
		

	} else
		alert("Thêm sản phẩm thành công,\nChưa thêm hình ảnh sản phẩm");
}

$(".update").click(function(event){
	event.preventDefault();
	var event_id =$(this).attr("value");  
	var content= $("#content").val();
	
	var eventFrm = $("#eventFrm").serializeArray();
	event = {};
	
	$.each(eventFrm, function(i, field) {
		event[field.content] = field.value;
		//size["size_id"] = size_id;
	});
	event["event_id"] = event_id;
		$.ajax({

				url : ' /AShop/admin/event/update', 
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



$("#btnUpdate").click(function(){
	var event_id =$("#event_id").val();
	$("#image").val("");
	$.ajax({
		url : '/AShop/admin/event/update',
		type : 'post',
		contentType : false,
		data :{
			event_id :event_id
		},
		success : function(event) {
			$("#command").val();
			$("#command").val("update");
			
			$("#content").val( event.content);
			
			$("#oldimg").val(event.image);
			$("#url").attr("href", 'http://localhost:8080/AShop/'+event.image)
			$("#img-url").attr("src", 'http://localhost:8080/AShop/'+event.image)
			$("#url").removeAttr("hidden");
		},
		error : function() {
			alert("không có sản phẩm này");
		}

	});
	
});*/