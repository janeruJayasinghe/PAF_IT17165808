function onSheduleSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divShedulesGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidSheduleIDSave").val("");
	$("#formShedule")[0].reset();
}
$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});

// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {

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

	var type = ($("#hidSheduleIDSave").val() == "") ? "POST" : "PUT";

	$.ajax(
			{
		url : "HospitalAPI",
		type : type,
		data : $("#formShedule").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onSheduleSaveComplete(response.responseText, status);
		}

	});
});



//UPDATE
$(document)
		.on(
				"click",
				".btnUpdate",
				function(event) {
					$("#hidSheduleIDSave").val(
							$(this).closest("tr").find('#hidSheduleIDUpdate')
									.val());
					$("#hospitalCode").val(
							$(this).closest("tr").find('td:eq(0)').text());
					$("#doctorName").val(
							$(this).closest("tr").find('td:eq(1)').text());
					$("#roomNo").val(
							$(this).closest("tr").find('td:eq(2)').text());
					$("#timeFrom").val(
							$(this).closest("tr").find('td:eq(3)').text());
					$("#timeTo").val(
							$(this).closest("tr").find('td:eq(4)').text());
					$("#date").val(
							$(this).closest("tr").find('td:eq(5)').text());

				})

// REMOVE==========================================
$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "HospitalAPI",
		type : "DELETE",
		data : "hospitalID=" + $(this).data("itemid"),
		dataType : "text",
		complete : function(response, status) {
			onSheduleDeleteComplete(response.responseText, status);
		}

	});
});

function onSheduleDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divShedulesGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

//CLIENT-MODEL=================================================================

function validateItemForm() {

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
