<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Patient</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	    
	<c:if test="${param.patientEmail != null && param.patientAddress != null}">
		<jsp:useBean id="beanDao" class="com.infinite.hospital_management_system.HospitalDao"/>
	    <jsp:useBean id="beanPatient" class="com.infinite.hospital_management_system.Patient" />
	    <jsp:setProperty property="*" name="beanPatient"/>
	    ${beanDao.addPatient(beanPatient)}
	    <c:redirect url="show-patient.jsp"/>
	</c:if>

	<div class="container">
		<div class="card bg-dark custom-card">
			<article class="card-body mx-auto" style="max-width: 600px;">
				<p class="divider-text"><span class="bg-dark">ADD Patient</span></p>
				<form>
					<div class="form-group input-group">
						<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-bed-pulse"></i></span>
						 </div>
				        <input name="patientName" class="form-control" placeholder="Patient name" type="text" pattern="[A-Za-z\s]+" required>
				    </div>
				    
				    <div class="form-group input-group">
				    	<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-location-dot"></i></span>
						 </div>
				        <input name="patientAddress" class="form-control" placeholder="Address" type="text" pattern="[A-Za-z0-9-,/\s]+" required>
				    </div>
				    
				    <div class="form-group input-group">
				    	<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
						</div>
				        <input name="patientEmail" class="form-control" placeholder="Email" type="email" required>
				    </div>
				            
				    <div class="form-group input-group">
				    	<div class="input-group-prepend">
						    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
						</div>
						<select class="custom-select" style="max-width: 80px;">
						    <option selected value="+91">+91</option>
						    <option value="+1">+1</option>
						    <option value="+198">+198</option>
						    <option value="+701">+701</option>
						</select>
				    	<input name="patientPhone" class="form-control" placeholder="Phone number" pattern="\d*" type=text maxlength="10" minlength="10" required>
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