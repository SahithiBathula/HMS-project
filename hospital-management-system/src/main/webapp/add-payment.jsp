<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Payment</title>
</head>
<body>

	<jsp:include page="header.jsp" />
	<jsp:useBean id="beanDao" class="com.infinite.hospital_management_system.HospitalDao"/>
	
	<c:if test="${param.payMode != null && param.dueAmount != null}">
		<jsp:useBean id="beanPayment" class="com.infinite.hospital_management_system.Payment" />
		<jsp:setProperty property="*" name="beanPayment"/>
		${beanDao.addPayment(beanPayment)}
		<c:redirect url="show-payments.jsp"/>
	</c:if>
	
	<div class="container">
		<div class="card bg-dark custom-card">
			<article class="card-body mx-auto" style="max-width: 600px;">
				<p class="divider-text"><span class="bg-dark">ADD Payment</span></p>
				<form>
					<c:set var="treatmentId" value="${param.treatmentid }"/>
					<div class="form-group input-group">
						<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-bed"></i></span>
						 </div>
				         <input class="form-control" type="number" value="${param.patientid }" readonly>
				    </div>
				    <input type="hidden" name="treatmentId" value="${treatmentId }" readonly>
				    
				    <div class="form-group input-group">
				    	<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-indian-rupee-sign"></i></span>
						</div>
						<c:set var="dueAmount" value="${beanDao.dueAmount(treatmentId) }" />
				        <input name="dueAmount" class="form-control" placeholder="Due Amount" type="number" value="${dueAmount }" readonly>
				    </div>
				    
				    <div class="form-group input-group">
				    	<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-indian-rupee-sign"></i></span>
						 </div>
				        <input name="amount" class="form-control" placeholder="Amount" type="number" min="1" max="${dueAmount }" required>
				    </div>
				    
				    <div class="form-group input-group">
				    	<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-money-bill-1"></i></span>
						</div>
						<select class="form-control" name="payMode" required>
							<option value="" selected disabled>PAY MODE</option>
							<option value="UPI">UPI</option>
							<option value="PayTM Wallet">PayTM Wallet</option>
							<option value="Credit Card">Credit Card</option>
							<option value="Debit Card">Debit Card</option>
							<option value="Net Banking">Net Banking</option>
							<option value="CASH">CASH</option>
						</select>
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