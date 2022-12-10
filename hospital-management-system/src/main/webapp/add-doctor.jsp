<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Hospital Management System - Add Patient</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<c:if test="${param.doctorName != null && param.doctorSpecialization != null}">
	    <jsp:useBean id="doctor" class="com.infinite.hospital_management_system.Doctor" />
	    <jsp:useBean id="dao" class="com.infinite.hospital_management_system.HospitalDao"/>
	    <jsp:setProperty property="*" name="doctor"/>
	    ${dao.addDoctor(doctor)}
	    <c:redirect url="show-doctors.jsp" />
	</c:if>

	<div class="container">
		<div class="card bg-dark custom-card">
			<article class="card-body mx-auto" style="max-width: 600px;">
				<p class="divider-text"><span class="bg-dark">ADD Doctor</span></p>
				<form>
					<div class="form-group input-group">
						<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa fa-user-doctor"></i></span>
						 </div>
				        <input name="doctorName" class="form-control" placeholder="Doctor name" type="text" pattern="[A-Za-z\s]+" required>
				    </div>
				    
				    <div class="form-group input-group">
				    	<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-heart"></i></span>
						 </div>
				        <input name="doctorSpecialization" class="form-control" placeholder="Specialization" type="text" pattern="[A-Za-z\s]+" required>
				    </div>
				    
				    <div class="form-group input-group">
				    	<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-hashtag"></i></span>
						</div>
				        <input name="doctorExperience" class="form-control" placeholder="Experience (in years)" type="number" min="0" required>
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