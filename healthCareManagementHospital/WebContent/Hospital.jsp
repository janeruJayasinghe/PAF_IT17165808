<%@page import="com.healthCareManagementSystemHospital.model.Hospital"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LCUD Medical Center Schedule Management </title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet" href="Views/mdtimepicker.css">
<link rel="stylesheet" href="Views/jquery.datepicker2.css">

<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/Hospital.js"></script>
<script src="Components/mdtimepicker.js"></script>
<script src="Components/jquery.datepicker2.js"></script>

</head>
<body>
<div style=text-align:center>
	<div class="container" style="width:1500px; margin:0 auto;text-align:center;">
		<div class="row">
			<div class="col-6">
				<h1>LCUD Medical Center Schedule Management </h1><br>
				<form id="formShedule" name="formShedule">
					Hospital code: <input id="hospitalCode" name="hospitalCode"
						type="text" class="form-control form-control-sm"
						readonly="readonly" value="LCUD">
						 <br>
						  <label for="doctors">Choose a Doctor:</label> <select id="doctorName" name="doctorName" type="text" class="form-control form-control-sm">
						<option></option>
						<option value="DR.Kamal Hettiarachi">DR.Kamal Hettiarachi</option>
						<option value="DR.Nishanthi Gunathilake">DR.Nishanthi Gunathilake</option>
						<option value="DR.Nuwan Jayasinghe">DR.Nuwan Jayasinghe</option>
						<option value="DR.Renuka Jayasinghe">DR.Renuka Jayasinghe</option>
						<option value="DR.cheth perera">DR.cheth perera</option>
						<option value="DR.Ranil Fernando">DR.Ranil Fernando</option>
						<option value="DR.Uthpala Piyathilake">DR.Uthpala Piyathilake</option>
						<option value="DR.Lalindi Thilakawardhana">DR.Lalindi Thilakawardhana</option>
					</select> 
					<br> Room no: <input id="roomNo" name="roomNo" type="text"
						class="form-control form-control-sm"> 
					<br> Time from:

					<input id="timeFrom" name="timeFrom" readonly="readonly"type="text" class="form-control form-control-sm"> <br>
						 <br>Time to: 
						 <input id="timeTo" name="timeTo" readonly="readonly"type="text"class="form-control form-control-sm"> <br>
						<br> Date:
						 <input type="text"readonly="readonly" name="date" id="date" data-select="datepicker"class="form-control form-control-sm"> 
						<br>
					<input id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> <br><input type="hidden"
						id="hidSheduleIDSave" name="hidSheduleIDSave" value="">
				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divShedulesGrid">
					<%
					Hospital itemObj = new Hospital();
					out.print(itemObj.viewAllShedules());
				%>
				</div>
			</div>
		</div>

	</div>
	</div>
</body>

</html>