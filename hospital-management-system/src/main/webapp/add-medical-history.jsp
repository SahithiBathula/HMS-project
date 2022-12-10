<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Medical History</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:useBean id="beanDao" class="com.infinite.hospital_management_system.HospitalDao"/>
	
	
	<c:if test="${param.treatmentDay != null && param.treatmentDescription != null}">
	    <jsp:useBean id="beanMedicalHistory" class="com.infinite.hospital_management_system.MedicalHistory" />
		<jsp:setProperty property="*" name = "beanMedicalHistory"/>
		${beanDao.addMedicalHistory(beanMedicalHistory)}
		<c:redirect url="show-medical-history.jsp"/>
	</c:if>


	<div class="container">
		<div class="card bg-dark custom-card">
			<article class="card-body mx-auto" style="max-width: 600px;">
				<p class="divider-text"><span class="bg-dark">ADD Medical History</span></p>
				<form>
					<div class="form-group input-group">
						<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-bed"></i></span>
						 </div>
				        <input name="patientId" class="form-control" placeholder="Patient ID" type="number" min="1" required>
				    </div>
				    
				    <div class="form-group input-group">
				    	<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-bed-pulse"></i></span>
						 </div>
				        <input name="treatmentDay" class="form-control" placeholder="Treatment Day" type="number" min="1" required>
				    </div>
				    
				    <div class="form-group input-group">
				    	<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-notes-medical"></i></span>
						</div>
				        <input name="treatmentDescription" class="form-control" placeholder="Treatment Description" type="text" pattern="[A-Za-z0-9-,/\s]+" required>
				    </div>
				                                         
				    <div class="form-group">
				        <button type="submit" class="btn btn-primary btn-block">SUBMIT</button>
				    </div>                                                                 
				</form>
			</article>
		</div>
	</div> 
</body>
</html>
