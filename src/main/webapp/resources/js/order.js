$("#resetText").click(function() {
	
	document.getElementById("Search").reset();
});


$("#delete").click(function() {
	if (confirm("Comfirm Delete")) {
		$("#listOrder input:checked").each(function() {
			var id = $(this).val();
			alert(id);
			var a = $(this);
			
			$.ajax({
				url : '/AShop/admin/order/delete',
				type : 'get',
				data : {
					orders_id : id,
				},
				success : function(value) {
					a.closest("tr").remove();
					alert("Successfully"); 
				},
				error : function() {
					alert("Error");
				}
			});
		})
	}

});


$("#chkAll").change(function() {
	if (this.checked) {
		$("#listOrder input").each(function() {
			$(this).attr("checked", true);
		})

	} else {
		$("#listOrder input").each(function() {
			$(this).attr("checked", false);
		})
	}

});


$(".search").click(function(){
	$(".frmSearch").show();
});

$(".edit").click(function(){
	$(".frmOrder_detail").show();
	var order_id =$(this).attr("value");  
	$("#order_id").val(order_id);
	var username =$(this).closest("tr").find("td:eq(2)").text();
	$("#username").val(username);
	
	var phone =$(this).closest("tr").find("td:eq(3)").text();
	$("#phone").val(phone);
	
	var address =$(this).closest("tr").find("td:eq(4)").text();
	$("#address").val(address);
	

	var order_status =$(this).closest("tr").find("td:eq(6)").text();
	
	$("#order_status").val(order_status);

	
	var order_date =$(this).closest("tr").find("td:eq(7)").text();
	$("#order_date").val(order_date);
	
	var note =$(this).closest("tr").find("td:eq(8)").text();
	$("#note").val(note);
});

$("#cancel").click(function(){
	location.reload();
});



