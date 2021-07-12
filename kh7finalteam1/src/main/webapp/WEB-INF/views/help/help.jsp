<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" href="res/css/help.css"/>
	    
    <!-- Custom styles for this template -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>넷플릭스 고객 센터</title>

<script>
	$(function(){
		$(".channels").click(function(){
			$(".channels").each(function(){
				$(this).next().removeClass("show");
				$(this).next().addClass("hide");
				
				$(this).find("span").removeClass("active");
				$(this).find("span").addClass("no-hover");
			});
						
			if(!$(this).find("span").hasClass("active")){
				$(this).find("span").addClass("active");
				$(this).find("span").removeClass("no-hover");
			}
			
			if($(this).next().hasClass("hide")){
				$(this).next().removeClass("hide");
				$(this).next().addClass("show");
			}
		});
				
		$(".popover-close-btn").click(function(){
			if($(this).parents(".custom-popover").prev().find("span").hasClass("active")){
				$(this).parents(".custom-popover").prev().find("span").removeClass("active");
				$(this).parents(".custom-popover").prev().find("span").addClass("no-hover");
			}
			
			if($(this).parents(".custom-popover").hasClass("show")){
				$(this).parents(".custom-popover").removeClass("show");
				$(this).parents(".custom-popover").addClass("hide");
			}
		});
	});
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
						<img class="mainLogo" src="res/img/Netflix_Logo_RGB.png" width="165px" height="70px">
						<img class="subLogo" src="res/img/n_logo.png" width="36px" height="32px">
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
</div>	
	<!-- footer -->
	<div class="container-fluid help-footer ">
		<div class="custom-contactbar">
			<div class="d-flex justify-content-between custom-inner-container">
				<div class="bar-title">
					<h3>고객 센터에 문의하시겠어요?</h3>
				</div>
				
				<div class="d-flex justify-content-between contact-channels position-relative">
					<div class="call-btn-div channels">
						<span class="no-hover" style="width: 100%;">문의 전화</span>
					</div>	
					<div class="phone-popover hide custom-popover">
						<div class="popover-content">
							<div class="popover-title">
								문의 전화
							</div>
							<div class="popover-btn-div">
								<div>
									<a class="btn btn-primary call-btn">080-001-9587</a>
								</div>
							</div>
							<div class="popover-desc">
								한국어 상담 운영 시간은 월요일부터 일요일까지 오전 8:00 ~ 오후 8:00(KST)입니다. 
								영어는 연중무휴 24시간 지원됩니다.
							</div>
							<hr style="border: 0; border-top: 1px solid #d5d4d1; margin: 24px 0 0; padding: 0 0 24px; background-color: transparent;">								
							<div class="popover-service-code">									
								<p>빠른 서비스를 위해 전화 연결 후 코드를 물어보면 아래 코드를 입력하세요.</p>
								<div class="service-code">133502</div>
							</div>
							
							<button class="popover-close-btn"></button>
						</div>
					</div>
					
					<div class="chat-btn channels">
						<span class="no-hover" style="width: 100%;">실시간 채팅 시작하기</span>
					</div>
					
					<div class="chat-popover custom-popover hide">
						<div class="popover-content">
							<div class="popover-title">
								채팅을 이용할 수 없음
							</div>
							<div class="popover-btn-div">
								<div class="chat-middle-content">
									한국어 채팅 이용 시간은 오전 8:00 - 오후 8:00 KST입니다.
								</div>
								<div class="chat-middle-content">
									일부 일반적인 문의는 실시간 채팅 없이도 해결하실 수 있습니다.
								</div>
							</div>	
							
							<ul class="selfhelp-options">
								<li class="help-option">
									<a href="#">TV프로그램 및 영화 요청하기</a>
								</li>
								<li class="help-option">
									<a href="#">비밀번호를 업데이트하려고 함</a>
								</li>
								<li class="help-option">
									<a href="#">결제 수단을 업데이트하려고 함</a>
								</li>
							</ul>		
							
							<div class="chat-popover-footer">
								<p>전화해 주시거나 나중에 다시 시도해 주세요.</p>
							</div>				
							
							<button class="popover-close-btn"></button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="dark-area">
			<div class="custom-inner-container">
				<ul class="footer-links">
					<li class="legalese-item">
						<a href="#">이용 약관</a>
					</li>
					<li class="legalese-item">
						<a href="#">개인정보</a>
					</li>
					<li class="legalese-item">
						<a href="#">쿠키 설정</a>
					</li>
					<li class="legalese-item">
						<a href="#">회사 정보</a>
					</li>
				</ul>
			</div>		
		</div>	
	</div>
</body>
</html>