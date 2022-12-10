<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Patient</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:useBean id="beanDao" class="com.infinite.hospital_management_system.HospitalDao"/>
	<form method="get" action="ShowPatient.jsp" class="">
		<div class="table-div">
			<table class="table table-dark table-striped table-hover table-bordered margin-top-10">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Phone Number</th>
					<th>Address</th>
					<th>Email</th>
					<th>Treat</th>
				</tr>
				<c:forEach var="patient" items="${beanDao.showPatient()}">	
		 			<tr>
						<td>${patient.patientId}</td>
						<td>${patient.patientName}</td>
						<td>${patient.patientPhone}</td>
						<td>${patient.patientAddress}</td>
						<td>${patient.patientEmail}</td>
						<td><a href="add-treatment.jsp?patientid=${patient.patientId}"><input class="btn btn-outline-primary" type="button" value="Treat"></a>
		 			</tr> 	
	 			</c:forEach>	   	
			</table>
		</div>
	</form>
</body>
</html>