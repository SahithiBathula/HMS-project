<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Payment</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div class="card bg-dark custom-card">
			<article class="card-body mx-auto" style="max-width: 600px;">
				<p class="divider-text"><span class="bg-dark">Search Payment</span></p>
				<form>
					<div class="form-group input-group">
						<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-indian-rupee-sign"></i></span>
						</div>
				        <input name="paymentId" class="form-control" placeholder="Payment ID" type="number">
				    </div>
				                                         
				    <div class="form-group">
				        <button type="submit" class="btn btn-primary btn-block">SUBMIT</button>
				    </div>                                                                 
				</form>
			</article>
		</div>
	</div>

	<c:if test="${param.paymentId != null}">
		<jsp:useBean id="beanDao" class="com.infinite.hospital_management_system.HospitalDao"/>
	    <div class="table-div">
			<table class="table table-dark table-striped table-hover table-bordered margin-top-10 ">
				<tr>
					<th>Payment ID</th>
					<th>Amount (&#8377;)</th>
					<th>Due Amount (&#8377;)</th>
					<th>Payment Date</th>
					<th>Pay Mode</th>
					<th>Patient Id</th>
				</tr>
				<c:set var="payment" value="${beanDao.searchPayment(param.paymentId)}"/>
					<c:if test="${payment != null}">
					<tr>
						<td>${payment[0].paymentId}</td>
						<td>${payment[0].amount}</td>
						<td>${payment[0].dueAmount}</td>
						<td>${payment[0].paymentDate}</td>
						<td>${payment[0].payMode}</td>
						<td>${payment[0].treatmentId}</td>
					</tr>
				</c:if>
				<c:if test="${payment.size() == 0}">
						<caption>No Record found. Please check ID and try again.</caption>	
				</c:if>
			</table>
		</div>
	 </c:if>
</body>
</html>