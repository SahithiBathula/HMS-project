<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Hospital Management System</title>
		
		<link rel="icon" type="image/png" href="hospital-management-system/images/favicon.ico"/>
		
		<link rel="stylesheet" href="css/style.css">
		
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
			
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		
		<!-- DataTable CDNs -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous" />
	    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	    <link rel="stylesheet" href="style.css" />
	    <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
		<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" ></script>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="index.jsp"><img class="logo-image" src="images/hms-high-resolution-logo-white-on-transparent-background.png"></a>
		    
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link" aria-current="page" href="index.jsp" id="home">Home</a>
		        </li>
		        
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="patient" role="button" data-bs-toggle="dropdown" aria-expanded="false">Patient</a>
		          <ul class="dropdown-menu" aria-labelledby="patient">
		            <li><a class="dropdown-item" href="add-patient.xhtml">Add Patient</a></li>
		            <li><a class="dropdown-item" href="show-patient.xhtml">Show Patient</a></li>
		            <li><a class="dropdown-item" href="search-patient.xhtml">Search Patient</a></li>
		          </ul>
		        </li>
		        
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" id="payment" aria-expanded="false">Payment</a>
		          <ul class="dropdown-menu" aria-labelledby="payment">
<!-- 		            <li><a class="dropdown-item" href="add-payment.jsp">Add Payment</a></li> -->
		            <li><a class="dropdown-item" href="show-payments.jsp">Show Payment</a></li>
		            <li><a class="dropdown-item" href="search-payment.jsp">Search Payment</a></li>
		          </ul>
		        </li>
		       
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" id="treatment" aria-expanded="false">Treatment</a>
		          <ul class="dropdown-menu" aria-labelledby="treatment">
<!-- 		            <li><a class="dropdown-item" href="add-treatment.jsp">Add Treatment</a></li> -->
		            <li><a class="dropdown-item" href="show-treatments.jsp">Show Treatment</a></li>
		            <li><a class="dropdown-item" href="search-treatment.jsp">Search Treatment</a></li>
		          </ul>
		        </li>
		       
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" id="doctor" aria-expanded="false">Doctor</a>
		          <ul class="dropdown-menu" aria-labelledby="doctor">
		            <li><a class="dropdown-item" href="add-doctor.xhtml">Add Doctor</a></li>
		            <li><a class="dropdown-item" href="show-doctors.xhtml">Show Doctor</a></li>
		          </ul>
		        </li>
		       
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#"role="button" data-bs-toggle="dropdown" id="med-history" aria-expanded="false">Medical History</a>
		          <ul class="dropdown-menu" aria-labelledby="med-history">
		            <li><a class="dropdown-item" href="add-medical-history.xhtml">Add Medical History</a></li>
		            <li><a class="dropdown-item" href="show-medical-history.xhtml">Show Medical History</a></li>
		            <li><a class="dropdown-item" href="search-medical-history.xhtml">Search Medical History</a></li>
		          </ul>
		        </li>
		        
		        <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" id="issues" aria-expanded="false">Issues</a>
                  <ul class="dropdown-menu" aria-labelledby="med-history">
                    <li><a class="dropdown-item" href="add-issue.xhtml">Add Issue</a></li>
                    <li><a class="dropdown-item" href="show-issues.xhtml">Show Issues</a></li>
                  </ul>
                </li>
                
		        <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" id="issues" aria-expanded="false">Room</a>
                  <ul class="dropdown-menu" aria-labelledby="med-history">
                    <li><a class="dropdown-item" href="add-room.jsp">Add Room</a></li>
                    <li><a class="dropdown-item" href="show-rooms.jsp">Show Rooms</a></li>
                  </ul>
                </li>
		      </ul>
		      
		      <c:if test="${username != null}">
			      <ul class="navbar-nav ml-auto">
			        <li><a class="nav-link">Welcome <c:out value="${username }" /> </a></li>
			        <li><a class="nav-link" href="logout.xhtml">Logout</a></li>
			      </ul>
		      </c:if>
		    </div>
		  </div>
		</nav>

		
	<script>
	
		let url = window.location.href.split('?')[0];
		baseUrl = "http://localhost:8080/hospital-management-system/"
		
		if(url == (baseUrl + "index.jsp")){
			document.getElementById("home").classList.add("active");
		}
		
		if(url == (baseUrl + "add-patient.xhtml") || url == (baseUrl + "show-patient.xhtml") || url == (baseUrl + "search-patient.xhtml")){
			document.getElementById("patient").classList.add("active");
		}
		
		if(url == (baseUrl + "add-payment.jsp") || url == (baseUrl + "show-payments.jsp") || url == (baseUrl + "search-payment.jsp")){
			document.getElementById("payment").classList.add("active");
		}
		
		if(url == (baseUrl + "add-treatment.jsp") || url == (baseUrl + "show-treatments.jsp") || url == (baseUrl + "search-treatment.jsp")){
			document.getElementById("treatment").classList.add("active");
		}
		
		if(url == (baseUrl + "add-doctor.xhtml") || url == (baseUrl + "show-doctors.xhtml")){
			document.getElementById("doctor").classList.add("active");
		}
		
		if(url == (baseUrl + "add-medical-history.xhtml") || url == (baseUrl + "show-medical-history.xhtml") || url == (baseUrl + "search-medical-history.xhtml")){
			document.getElementById("med-history").classList.add("active");
		}
		
		if(url == (baseUrl + "add-issue.xhtml") || url == (baseUrl + "show-issues-history.xhtml")){
            document.getElementById("issues").classList.add("active");
        }
	</script>