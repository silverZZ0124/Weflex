<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/help.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/help-footer.css"/>
	    
    <!-- Custom styles for this template -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/res/js/help-footer.js"></script>
<meta charset="UTF-8">
<title>넷플릭스 고객 센터</title>

<script>
	
</script>

</head>
<body>
<div class="global-div">
	<!-- 고객센터 상단 div (search bar 까지) -->
	<div class="container-fluid position-relative custom-top-container">
		<div class="overlay"></div>
		<div class="position-relative custom-inner-container">
			<div class="d-flex align-items-center" >
				<div class="me-auto">
					<a href="${pageContext.request.contextPath }">
						<img class="mainLogo" src="res/img/weflex_logo.png" >
						<img class="subLogo" src="res/img/n_logo.png" width="36px" height="32px">
					</a>
				</div>
				
				<div class="ms-auto">
					<a class="text-white custom-a-tag" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false" >
						회원이름 
						<span style="padding-left: 10px;"><i class="fas fa-caret-down" style="color:red; font-size:1.5rem;"></i></span>
					</a>
					<ul class="dropdown-menu dropdown-menu-end cumstom-help-dropdown" aria-labelledby="navbarDarkDropdownMenuLink" >
						<li><a class="dropdown-item" href="${pageContext.request.contextPath }/yourAccount">계정</a></li>
						<li><a class="dropdown-item" href="#">넷플릭스에서 로그아웃</a></li>						
					</ul>
				</div>
			</div>
			
			<div class="logo-wrapper">
				<a href="${pageContext.request.contextPath }/help">고객 센터</a>
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
	
	<!-- 고객센터 중단 -->
	<div class="container-fluid custom-middle-container">
		<div class="row custom-inner-container">
			<h2 style="padding: 0; font-weight: 700;">회원이름 님, 안녕하세요.</h2>
		</div>
		
		<div class="row custom-inner-container custom-middle-second-container" >
			<p style="font-size: 17px; font-weight: 300; margin-bottom: 16px; padding: 0;">도움이 될 만한 문서</p>
			
			<div class="d-flex flex-row help-card-wrapper">
				<div class="help-card">
					<a href="#">
						<i class="far fa-file-alt"></i>
						<span>계정 보안을 유지하는 방법</span>
					</a>
				</div>
				<div class="help-card">
					<a href="#">
						<i class="far fa-file-alt"></i>
						<span>넷플릭스 자녀 보호 기능</span>
					</a>					
				</div>
				<div class="help-card">
					<a href="#">
						<i class="far fa-file-alt"></i>
						<span>멤버십 변경 방법</span>
					</a>					
				</div>
			</div>
		</div>
	</div>
	
	<!-- 고객센터 중단 -->	
	<div class="row custom-bottom-container">
		<div class="d-flex custom-inner-container">
			<div class="d-flex categories">
				<div class="category">
					<h2>내 계정 관리</h2>
					<ul>
						<li><a href="#">멤버십 및 요금</a></li>
						<li><a href="#">내 계정에 새로운 로그인이 발생했다는 이메일을 수신했습니다.</a></li>
						<li><a href="#">시청 기록에서 콘텐츠를 숨기는 방법</a></li>
					</ul>
				</div>
				<div class="category">
					<h2>시청 불가</h2>
					<ul>
						<li><a href="#">타인의 내 계정 사용을 중단시키는 방법</a></li>
						<li><a href="#">HTML5 플레이어와 Silverlight에 대한 넷플릭스 시스템 요구 사항</a></li>
						<li><a href="#">'넷플릭스에 연결하는 데 문제가 있습니다(3.1).'라는 넷플릭스 메시지가 표시됩니다.</a></li>
					</ul>
				</div>
				<div class="category">
					<h2>결제 문의</h2>
					<ul>
						<li><a href="#">청구 및 결제</a></li>
						<li><a href="#">'최근 결제에 문제가 있어 계정이 보류 중입니다.'라는 Netflix 메시지가 표시됩니다.</a></li>
						<li><a href="#">넷플릭스 기프트카드</a></li>
					</ul>
				</div>
				<div class="category">
					<h2>넷플릭스 시청</h2>
					<ul>
						<li><a href="#">프로필 생성 및 수정 방법</a></li>
						<li><a href="#">TV에서 넷플릭스를 시청하는 방법</a></li>
						<li><a href="#">TV 프로그램 및 영화를 저장하여 오프라인 상태에서 시청하는 방법</a></li>
					</ul>
				</div>			
			</div>
			
			<div class="quick-links">
				<h2>빠른 링크</h2>
				<ul>
					<li><a href="#">TV 프로그램 및 영화 요청하기</a></li>
					<li><a href="#">이메일 업데이트</a></li>
					<li><a href="#">비밀번호 업데이트</a></li>
					<li><a href="#">결제 수단 업데이트</a></li>
					<li><a href="#">멤버십 해지</a></li>
					<li><a href="#">결제 내역 검토</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="footer-push"></div>
</div>	

<%@include file="help-footer.jsp" %>