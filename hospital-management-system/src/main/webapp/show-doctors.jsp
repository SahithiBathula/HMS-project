<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor Table</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="table-div">
		<table class="table table-dark table-striped table-hover table-bordered margin-top-10 ">
			<thead>
				<tr>
					<th>Doctor ID</th>
					<th>Doctor Name</th>
					<th>Doctor Specialization</th>
					<th>Doctor Experience</th>
					<th>Doctor Status</th>
				</tr>
			</thead>
			<jsp:useBean id="dao" class="com.infinite.hospital_management_system.HospitalDao"/>
			<tbody>
				<c:forEach var="doctor" items="${dao.showAllDoctors() }">
					<tr>
						<td>${doctor.doctorId }</td>
						<td>${doctor.doctorName }</td>
						<td>${doctor.doctorSpecialization }</td>
						<td>${doctor.doctorExperience }</td>
						<td>${doctor.doctorStatus }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>