<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/loginHeader.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/join1.css"/>

<body>
	<div id="appMountPoint">
		<div class="netflix-sans-font-loaded">
			<div class="basicLayout notMobile modernInApp hasExtendedDiacritics signupSimplicity-registrationWithContext simplicity">
				
				<div class="simpleContainer">
					<div class="centerContainer contextStep firstLoad"style="min-width:400px;">
						<div class="regContainer">
							<div class="stepLogoContainer">
								<span class="stepLogo regStepLogo"></span>
							</div>
							<div class="stepHeader-container">
							<div class="stepHeader" data-a11y-focus="true" tabindex="0">
							<span id="" class="stepIndicator" >
							<b>1</b>/<b>3단계</b>
							</span>
							<h1 class="stepTitle" >계정 설정 마무리하기</h1>							
							</div>
							</div>
							<div id="" class="contextBody contextRow">맞춤형 콘텐츠 서비스, 넷플릭스! 비밀번호를 설정해 다양한 디바이스에서 아무 때나 시청하세요.</div>
						</div>
						<div class="submitBtnContainer">

						<a href="/finalteam1/join2">
						<form action="join1" method="POST">
							<input type="hidden" value="${param.email }" name="email">
							<button  type="submit" autocomplete="off" class="nf-btn nf-btn-primary nf-btn-solid nf-btn-oversize"  placeholder="registration_button_continue">다음</button>
						</form>
						</a>

						</div>
					</div>
				</div>
<jsp:include page="/WEB-INF/views/template/loginFooter.jsp"></jsp:include>				