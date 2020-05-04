/**
 * 
 */
$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "")
	{
		$("#alertSuccess").hide();
	}	
	$("#alertError").hide();
});
// SAVE ============================================
$(document).on("click","#btnSave",function(event) {
	
			// Clear status msges-------------
			$("#alertSuccess").text("");
			$("#alertSuccess").hide();
			$("#alertError").text("");
			$("#alertError").hide();
			// Form validation----------------
			var status = validateItemForm();
			// If not valid-------------------
			if (status != true) {
				$("#alertError").text(status);
				$("#alertError").show();
				return;
			}
			// If valid----------------------
			$("#formItem").submit();
});
//update
$(document).on("click", ".btnUpdate", function(event)
		{
	$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());
	$("#hospitalCode").val($(this).closest("tr").find('td:eq(0)').text());
	$("#doctorName").val($(this).closest("tr").find('td:eq(1)').text());
	$("#roomNo").val($(this).closest("tr").find('td:eq(2)').text());
	$("#timeFrom").val($(this).closest("tr").find('td:eq(3)').text());
	$("#timeTo").val($(this).closest("tr").find('td:eq(4)').text());
	$("#date").val($(this).closest("tr").find('td:eq(5)').text());
	
		});	
	
		

// REMOVE==========================================
$(document).on("click", ".remove", function(event) {
	$(this).closest(".student").remove();
	$("#alertSuccess").text("Removed successfully.");
	$("#alertSuccess").show();
});
12
// CLIENT-MODEL=================================================================
function validateItemForm() {
	// NAME
	if ($("#hospitalCode").val().trim() == "") {
		return "Insert hospital code.";
	}
	if ($("#doctorName").val().trim() == "") {
		return "Insert Doctor name.";
	}
	if ($("#roomNo").val().trim() == "") {
		return "Insert roomNO.";
	}
	if ($("#timeFrom").val().trim() == "") {
		return "Insert Time from.";
	}
	if ($("#timeTo").val().trim() == "") {
		return "Insert Time to.";
	}
	if ($("#date").val().trim() == "") {
		return "Insert Date.";
	}
	
	return true;
}


