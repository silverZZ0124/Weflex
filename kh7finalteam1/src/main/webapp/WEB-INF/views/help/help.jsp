<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" href="../res/css/help.css">
	    
    <!-- Custom styles for this template -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>넷플릭스 고객 센터</title>

<script>

</script>

</head>
<body>
	<div class="container-fluid position-relative custom-top-container">
		<div class="overlay"></div>
		<div class="position-relative custom-inner-container">
			<div class="d-flex align-items-center" >
				<div class="me-auto">
					<a href="${pageContext.request.contextPath }">
						<img class="mainLogo" src="../res/img/Netflix_Logo_RGB.png" width="165px" height="70px">
						<img class="subLogo" src="../res/img/n_logo.png" width="36px" height="32px">
					</a>
				</div>
				
				<div class="ms-auto">
					<a class="text-white custom-a-tag" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false" >
						회원이름 
						<span style="padding-left: 10px;"><i class="fas fa-caret-down" style="color:red; font-size:1.5rem;"></i></span>
					</a>
					<ul class="dropdown-menu dropdown-menu-end cumstom-help-dropdown" aria-labelledby="navbarDarkDropdownMenuLink" >
						<li><a class="dropdown-item" href="#">계정</a></li>
						<li><a class="dropdown-item" href="#">넷플릭스에서 로그아웃</a></li>						
					</ul>
				</div>
			</div>
			
			<div class="logo-wrapper">
				<a href="${pageContext.request.contextPath }/help/help">고객 센터</a>
			</div>
			
			<div class="search-wrapper">
				<form>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1" style="background-color: white;"><i class="fas fa-search"></i></span>
						<input type="text" class="form-control" id="form-control-search" placeholder="어떤 도움이 필요하세요?" aria-label="Username" aria-describedby="basic-addon1">
					</div>
				</form>
			</div>
		</div>	
	</div>	
</body>
</html>