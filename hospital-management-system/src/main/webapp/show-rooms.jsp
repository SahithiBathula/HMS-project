<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Show Rooms</title>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:useBean id="beanDao" class="com.infinite.hospital_management_system.HospitalDao"/>
		
		<div class="table-div">
			<table id="roomsTable" class="table table-secondary table-striped table-hover table-bordered margin-top-10 ">
				<tr>
					<th>Room Id</th>
					<th>Cost</th>
					<th>Status</th>
				</tr>
				<c:forEach var="room" items="${beanDao.showRooms()}">
					<tr>
						<td>${room.roomId}</td>
						<td>${room.roomCost}</td>
						<td>${room.status}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<script>
	        $(document).ready(function() {
	            $('#roomsTable').DataTable({
	                scrollY: '50vh',
	                scrollCollapse: true,
	            });
	        });
	    </script>
	</body>
</html>