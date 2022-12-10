<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Patient</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:useBean id="beanDao" class="com.infinite.hospital_management_system.HospitalDao"/>

	<div class="container">
		<div class="card bg-dark custom-card">
			<article class="card-body mx-auto" style="max-width: 600px;">
				<p class="divider-text"><span class="bg-dark">Search Patient</span></p>
				<form>
					<div class="form-group input-group">
						<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-bed-pulse"></i></span>
						</div>
				        <input name="patientId" class="form-control" placeholder="Patient ID" type="number">
				    </div>
				                                         
				    <div class="form-group">
				        <button type="submit" class="btn btn-primary btn-block">SUBMIT</button>
				    </div>                                                                 
				</form>
			</article>
		</div>
	</div>
	
	<c:if test="${param.patientId != null}">
		<div class="table-div">
			<table class="table table-dark table-striped table-hover table-bordered margin-top-10 ">
				<tr>
					<th>PatientId</th>
					<th>PatientName</th>
					<th>PatientPhoneNumber</th>
					<th>PatientAddress</th>
					<th>PatientEmail</th>
				</tr>
				<c:set var="patient" value="${beanDao.searchPatient(param.patientId)}" />
				<c:if test="${patient.size() > 0}">
					<tr>
						<td>${patient[0].patientId}</td>
						<td>${patient[0].patientName}</td>
						<td>${patient[0].patientPhone}</td>
						<td>${patient[0].patientAddress}</td>
						<td>${patient[0].patientEmail}</td>
					</tr>		
				</c:if>
				<c:if test="${patient.size() == 0}">
						<caption>No Record found. Please check ID and try again.</caption>	
				</c:if>
			</table>
		</div>
	</c:if>
</body>
</html>