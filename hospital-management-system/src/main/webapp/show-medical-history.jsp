<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:useBean id="dao" class="com.infinite.hospital_management_system.HospitalDao"/>
	<div class="table-div">
		<table class="table table-dark table-striped table-hover table-bordered margin-top-10 ">
			<tr>
				<th>MedHisId</th>
				<th>PatientId</th>
				<th>TreatmentDay</th>
				<th>TreatmentDescription</th>
			</tr>
			<c:forEach var="medicalHistory" items="${dao.showMedicalHistory()}">	
	 			<tr>
	 				<td>${medicalHistory.medHisId }</td>
	 				<td>${medicalHistory.patientId }</td>
	 				<td>${medicalHistory.treatmentDay }</td>
	 				<td>${medicalHistory.treatmentDescription }</td>
	 			</tr> 
			</c:forEach>
		</table>
	</div>
</body>
</html>