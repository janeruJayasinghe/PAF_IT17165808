<%@page import="com.healthCareManagementSystemHospital.model.Hospital"%>
	
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/Hospital.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1 >Student details</h1>
				<form id="formShedule" name="formShedule" >
					Hospital code:
					 <input id="hospitalCode" name="hospitalCode" type="text"class="form-control form-control-sm"> 
					<br>Doctor name:
					<input id="doctorName" name="doctorName" type="text"class="form-control form-control-sm"> 
					<br> Room no:
					 <input id="roomNo" name="roomNo" type="text"class="form-control form-control-sm">
					 <br> Time from:
					  <input id="timeFrom" name="timeFrom" type="text"class="form-control form-control-sm">
					  <br>
					  <br> Time to:
					  <input id="timeTo" name="timeTo" type="text"class="form-control form-control-sm">
					  <br>
					  <br> Date:
					  <input id="date" name="date" type="text"class="form-control form-control-sm">
					  <br>
					   <input id="btnSave" name="btnSave" type="button" value="Save"class="btn btn-primary">
					   <input type="hidden"id="hidSheduleIDSave" name="hidSheduleIDSave" value="">
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
</body>

</html>