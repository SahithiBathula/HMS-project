<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add Room</title>
	</head>
	<body>
		<jsp:include page="header.jsp" />
	
		<c:set var="roomCost" value="${param.roomCost }" />
		<c:if test="${roomCost != null }">
			<jsp:useBean id="beanDao" class="com.infinite.hospital_management_system.HospitalDao" />
			${beanDao.addRoom(roomCost) }
			<c:redirect url="show-rooms.jsp" />
		</c:if>
		
		<div class="container">
			<div class="card bg-dark custom-card">
				<article class="card-body mx-auto" style="max-width: 600px;">
					<p class="divider-text"><span class="bg-dark">ADD Doctor</span></p>
					<form>
						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa-solid fa-indian-rupee-sign"></i></span>
							</div>
					        <input name="roomCost" class="form-control" placeholder="Room Cost" type="number" min="100" required>
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