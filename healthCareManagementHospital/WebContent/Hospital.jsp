
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="com.healthCareManagementSystemHospital.model.Hospital"%>
	<%
		session.setAttribute("statusMsg", "");
		System.out.println("Tryinf to process....");
		
		if (request.getParameter("hospitalCode") != null)
		{
			Hospital itemObj = new Hospital();
			String stsMsg = "";
		
		if  (request.getParameter("hidItemIDSave") == "")
		{
			stsMsg = itemObj.addSchedule(request.getParameter("hospitalCode"), request.getParameter("doctorName"), request.getParameter("roomNo"), request.getParameter("timeFrom"), request.getParameter("timeTo"), request.getParameter("date"));
			
		}
		else 
		{
			stsMsg = itemObj.updateDoctorShedule(request.getParameter("hidItemIDSave"), request.getParameter("hospitalCode"), request.getParameter("doctorName"), request.getParameter("roomNo"), request.getParameter("timeFrom"), request.getParameter("timeTo"), request.getParameter("date"));
			
		}
		session.setAttribute("statusMsg", stsMsg);
		
		}
		if(request.getParameter("hidItemIDDelete") != null)
		{
			Hospital itemObj = new Hospital();
			String stsMsg=itemObj.deleteShedule(request.getParameter("hidItemIDDelete"));
			session.setAttribute("statusMsg", stsMsg);		
			
		}
	%>

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
			<div class="col-8">
				<h1 class="m-3">Student details</h1>
				<form id="formItem" name="formItem" method="post" action="Hospital.jsp">
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
					   <input type="hidden"id="hidItemIDSave" name="hidItemIDSave" value="">
				</form>
				<div id="alertSuccess" class="alert alert-success">
				<%
				out.print(session.getAttribute("statusMsg"));
				%>
				</div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<%
					Hospital itemObj = new Hospital();
					out.print(itemObj.viewAllShedules());
				%>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-12" id="colStudents"></div>
		</div>
	</div>
</body>

</html>