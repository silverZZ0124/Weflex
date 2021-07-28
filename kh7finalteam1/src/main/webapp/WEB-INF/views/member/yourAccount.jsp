<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/member.css"/>
		    
    <!-- Custom styles for this template -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script>
    	var contextPath = "${pageContext.request.contextPath}";
    </script>    
<meta charset="UTF-8">
<title>Netflix</title>
	<script>
		$(function(){
			$("#profileSelector").hover(function(){	
				$(this).click();
			},function(){
				$(".triggers").each(function(){
					if($(this).hasClass("show"))
						$(this).removeClass("show");
				});
			});
			
			$("#move-account").click(function(){
				location.replace(contextPath + "/yourAccount");
			});
			
			$("#move-help").click(function(){
				location.replace(contextPath + "/help");
			});
						
		});
	</script>
</head>
<body>
	<div id="appMountPoint">
		<div class="netflix-sans-font-loaded">
			<div class="accountLayout">
				<!-- 상단 메뉴 -->
				<div id="hdSpace">
					<div id="hdPinTarget" class="member-header">
						<div id="hd">
							<div>
								<a href="${pageContext.request.contextPath }" class="svg-nfLogo logo">
									<img class="logo_img" src="${pageContext.request.contextPath }/res/img/weflex_logo.png">
								</a>
							</div>
							<div class="account-secondary-navigation last">
								<div id="account-tools">
									<div id="profileSelector" class="profile-selector" data-bs-toggle="collapse" data-bs-target=".triggers" aria-expanded="false" aria-controls="trigger-collapse profiles-collapse">
										<div class="current-profile">
											<img class="avatar" src="https://occ-0-988-395.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABZAl_RHxQaFudkiao5vPLVFhEyGG1QqTCFxjdy4hEOrxzY9GGUa2IoZyznfP4TitB2zLMNPgY_RK74GZJufj7ek.png?r=a41">
											<span class="profile-arrow"></span>	
											<span class="trigger collapse triggers" id="trigger-collapse"></span>										
										</div>
										<div class="profiles-container collapse triggers" id="profiles-collapse">											
											<ul class="links structural">
												<li><a id="move-account" href="${pageContext.request.contextPath }/yourAccount">계정</a></li>
												<li><a id="move-help" href="${pageContext.request.contextPath }/help">고객 센터</a></li>
												<li><a id="move-logout" href="/">넷플릭스에서 로그아웃</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 중단 content 부분 -->
				<div class="bd">
					<div class="responsive-account-container">
						<div>
							<h1 class="account-header account-header-inline">계정</h1>
							<div class="account-section-membersince">
								<div class="account-section-membersince--svg"></div>
								멤버십 시작: 5월 2021
							</div>
							<div class="responsive-account-content">
								<div class="account-section collapsable-panel clearfix membership-section-wrapper membership-section-with-button">
									<header class="account-section-header collapsable-section-toggle">
										<h2 class="account-section-heading">멤버십 & 결제 정보
											<button class="btn account-cancel-button btn-plain btn-small">
												<span>멤버십 해지</span>
											</button>
											<button class="btn account-cancel-button btn-small btn-drop">
												<span>회원 탈퇴</span>
											</button>
										</h2>
									</header>
									<section class="collapsable-section-content account-section-content">
										<div class="account-subsection clearfix">
											<div class="clearfix">
												<div class="account-section-group">
													<div class="account-section-item account-section-email">${clientDto.clientId }</div>
													<div class="account-section-item account-section-item-disabled">비밀번호:********</div>
													<div class="account-section-item account-section-item-disabled">전화번호: ${clientDto.clientPhone }</div>
												</div>
												<div class="account-section-group">
													<div class="account-section-item">
														<form class="account-section-form" action="changeEmail">
															<input type="hidden" name="email" value="${clientDto.clientId }">
															<button class="account-section-link" type="submit">																
																이메일 주소 변경
															</button>
														</form>
													</div>
													<div class="account-section-item">
														<form class="account-section-form" action="changePassword">
															<input type="hidden" >
															<button class="account-section-link" type="submit">																
																비밀번호 변경
															</button>
														</form>
													</div>
													<div class="account-section-item">
														<form class="account-section-form" action="changePhone">
															<input type="hidden" name="phoneNumber" value="${clientDto.clientPhone }">
															<button class="account-section-link" type="submit">																
																휴대폰 번호 변경
															</button>
														</form>
													</div>
												</div>
											</div>
										</div>
										<div class="account-subsection clearfix light-divider">
											<div>
												<div class="account-subsection-borderless clearfix">
													<div class="account-section-group payment-details -wide">
														<div class="account-section-item">
															<div class="wallet--mop">
																<span>
																	<span class="text-payment">카카오페이</span>
																</span>
															</div>
														</div>
														<div class="account-section-item">
															${nextExpire }
														</div>
													</div>
													<div class="account-section-group -thin">
														<div class="account-section-item">
															<form class="account-section-form" >
																<input type="hidden" >
																<button class="account-section-link" type="submit">																
																	결제 정보 관리
																</button>
															</form>
														</div>
														<!-- <div class="account-section-item">
															<form class="account-section-form" >
																<input type="hidden" >
																<button class="account-section-link" type="submit">																
																	결제 상세 정보
																</button>
															</form>
														</div>
														<div class="account-section-item">
															<form class="account-section-form" >
																<input type="hidden" >
																<button class="account-section-link" type="submit">																
																	결제일 변경
																</button>
															</form>
														</div> -->
													</div>
												</div>
											</div>											
										</div>
									</section>
								</div>
								
								<div class="account-section collapsable-panel clearfix">
									<header class="account-section-header collapsable-section-toggle">
										<h2 class="account-section-heading">멤버십 상세 정보</h2>
									</header>
									<section class="collapsable-section-content account-section-content">
										<div class="account-subsection clearfix">
											<div class="clearfix">
												<div class="account-section-group">
													<div class="account-section-item">
														<c:choose>
															<c:when test="${clientGradeDto.gradeName eq 'standard'}">
																<b>스탠다드</b>
															</c:when>	
															<c:otherwise>
																<b>등급이 잘못되었습니다.</b>
															</c:otherwise>														
														</c:choose>
													</div>
												</div>
												<div class="account-section-group">
													<div class="account-section-item">
														<form class="account-section-form" >
															<input type="hidden" >
															<button class="account-section-link" type="submit">																
																멤버십 변경
															</button>
														</form>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								
							</div>
						</div>
					</div>
				</div>
				
				<!-- 하단 footer 부분 -->
				<div class="site-footer-wrapper">
					<div class="footer-divider"></div>
					<div class="site-footer">
						<p class="footer-top">
							<a href="#" class="footer-top-a">질문이 있으신가요? 고객 센터에 문의하세요.</a>
						</p>						
						<ul class="footer-links structural">
							<li class="footer-link-item footer-link-audio-and-subtitles">
								<a href="#" class="footer-link"><span>자막 및 음성</span></a>
							</li>
							<li class="footer-link-item footer-link-help">
								<a href="#" class="footer-link"><span>고객 센터</span></a>
							</li>
							<li class="footer-link-item footer-link-gift-card">
								<a href="#" class="footer-link"><span>기프트카드</span></a>
							</li>
							<li class="footer-link-item footer-link-relations">
								<a href="#" class="footer-link"><span>투자 정보(IR)</span></a>
							</li>
							<li class="footer-link-item footer-link-media">
								<a href="#" class="footer-link"><span>미디어 센터</span></a>
							</li>
							<li class="footer-link-item footer-link-jobs">
								<a href="#" class="footer-link"><span>입사 정보</span></a>
							</li>							
							<li class="footer-link-item footer-link-cookies">
								<a href="#" class="footer-link"><span>쿠키 설정</span></a>
							</li>
							<li class="footer-link-item footer-link-terms">
								<a href="#" class="footer-link"><span>이용 약관</span></a>
							</li>
							<li class="footer-link-item footer-link-privacy">
								<a href="#" class="footer-link"><span>개인정보 처리방침</span></a>
							</li>
						</ul>
						<div class="service-code-wrapper">
							<a class="service-code pointer">서비스 코드</a>
						</div>
						<div class="copy-text">
							<div class="copy-text-block">넷플릭스서비시스코리아 유한회사 통신판매업신고번호: 제2018-서울종로-0426호 전화번호: </div>
							<div class="copy-text-block">대표: 레지널드 숀 톰프슨</div>
							<div class="copy-text-block">이메일 주소: korea@netflix.com</div>
							<div class="copy-text-block">주소: 대한민국 서울특별시 종로구 우정국로 26, 센트로폴리스 A동 20층 우편번호 03161</div>
							<div class="copy-text-block">사업자등록번호: 165-87-00119</div>
							<div class="copy-text-block">클라우드 호스팅: Amazon Web Services Inc.</div>
							<div class="copy-text-block">공정거래위원회 웹사이트</div>							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>