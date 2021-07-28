<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color:white !important;">
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/template.css"/>

 
	

	
	    
    <!-- Custom styles for this template -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>






<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Weflex</title>
</head>

<body style="background-color:white !important;">
		<main>
		<div class="" >
		<nav class="navbar navbar-light navbar-expand-sm nav-style" style="border-bottom:1px solid rgb(243,243,243);margin-top: -10%;">
			<ul class="navbar-nav nav-logo-ul" style="width: 120px; margin-left: 1%;">
				<li class="nav-item"> <a class="nav-link logo-wrapper" href="#"><img src="${pageContext.request.contextPath}/res/img/weflex_logo.png" style="width: 100%;"></a> </li> 
			</ul>
			
			
			<ul class="navbar-nav nav-var-right" style="position:absolute; right:50px;    width: 80px;">
				
			 	<li class="nav-item"> <a class="nav-link" href="#">로그아웃</a> </li>
				
					
  	
			</ul>
			

		</nav>
	
		
		

		
		</div>		
<section style="background-color:white !important;">
<div style="margin-top:10%;  margin-bottom: 10%;">
<form action="confirm" method="post">
	partner_order_id : <input type="text" name="partner_order_id" required>
	<br><br>
	partner_user_id : <input type="text" name="partner_user_id" required>
	<br><br>
	item_name : <input type="text" name="item_name" required>
	<br><br>
	quantity : <input type="text" name="quantity" required>
	<br><br>
	total_amount : <input type="text" name="total_amount" required>
	<br><br>
	<input type="submit" value="결제하기">
</form> 

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


