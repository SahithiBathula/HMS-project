<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>	
	<jsp:include page="header.jsp" />
	<jsp:useBean id="beanDao" class="com.infinite.hospital_management_system.HospitalDao"/>

	<div class="container">
		<div class="card bg-dark custom-card">
			<article class="card-body mx-auto" style="max-width: 600px;">
				<p class="divider-text"><span class="bg-dark">Search Treatment</span></p>
				<form>
					<div class="form-group input-group">
						<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-bed-pulse"></i></span>
						</div>
				        <input name="treatmentId" class="form-control" placeholder="Treatment ID" type="number">
				    </div>
				                                         
				    <div class="form-group">
				        <button type="submit" class="btn btn-primary btn-block">SUBMIT</button>
				    </div>                                                                 
				</form>
			</article>
		</div>
	</div>
	
	<c:if test="${param.treatmentId != null}">
		<div class="table-div">
			<table class="table table-dark table-striped table-hover table-bordered margin-top-10 ">
				<tr>
					 <th>ID</th>
					 <th>Patient ID</th>
					 <th>Doctor ID</th>
					 <th>Type</th>
					 <th>Treatment Date</th>
					 <th>Discharge Date</th>
					 <th>Issue</th>
					 <th>Room ID</th>
				</tr>
				<c:set var="treatment" value="${beanDao.searchTreatment(param.treatmentId)}" />
				<c:set var="issues" value="${dao.searchIssue(treatment.issueId) }" />
				<tr>
					<td>${treatment[0].treatmentId}</td>
					<td>${treatment[0].patientid}</td>
					<td>${treatment[0].doctorid}</td>
					<td>${treatment[0].visitingOrAdmitting}</td>
					<td>${treatment[0].treatmentdate}</td>
					<td>${treatment[0].dischargedate}</td>
					<td>${issues[0].issue }</td>
					<td>${treatment[0].roomId}</td>		
				</tr>
				<c:if test="${treatment.size() == 0}">
					<caption>No Record found. Please check ID and try again.</caption>
				</c:if>
			</table>
		</div>
	</c:if>
</body>
</html>