<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Show Payments</title>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:useBean id="beanDao" class="com.infinite.hospital_management_system.HospitalDao"/>
		<div class="table-div">
			<table id="paymentTable" class="table table-secondary table-striped table-hover table-bordered margin-top-10 ">
				<tr>
					<th>Payment Id</th>
					<th>Amount</th>
					<th>Due Amount</th>
					<th>Payment Date</th>
					<th>Pay Mode</th>
					<th>Treatment Id</th>
				</tr>
				<c:forEach var="payment" items="${beanDao.showPayments()}">
					<tr>
						<td>${payment.paymentId}</td>
						<td>${payment.amount}</td>
						<td>${payment.dueAmount}</td>
						<td>${payment.paymentDate}</td>
						<td>${payment.payMode}</td>
						<td>${payment.treatmentId}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<script>
	        $(document).ready(function() {
	            $('#paymentTable').DataTable({
	                scrollY: '50vh',
	                scrollCollapse: true,
	            });
	        });
	    </script>
	</body>
</html>