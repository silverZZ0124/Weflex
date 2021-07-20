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
			
			$("#id_phoneNumber").on("propertychange change keyup paste input", function(){				
				var regex = /^\d{3}-\d{3,4}-\d{4}$/;
				
				if(regex.test($(this).val())){
					$(".inputError").css("display", "none");
					$("#btn-next").attr('disabled', false);
				}
				else{
					$(".inputError").css("display", "block");
					$("#btn-next").attr('disabled', true);
				}
			});
			
			$("#btn-next").click(function(e){
				$.ajax({
					url:"${pageContext.request.contextPath}/data/member/changePhone",
					type:"post",
					data: {"phoneNumber": $("#id_phoneNumber").val()},
					success:function(resp){
						$(".modal").modal("show");
					},
					error:function(resp){
						console.log(resp);
						window.alert("업로드 실패..");
					}
				});
				
				e.preventDefault();
				
			});
			
			$("#btn-cancel").click(function(){
				window.history.back();
			});
			
			$("#move-main-btn").click(function(){
				location.replace("/");
			});
			
			$("#move-account-btn").click(function(){
				console.log("move account");
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
								<a href="#" class="svg-nfLogo logo">
									<img class="logo_img" src="${pageContext.request.contextPath }/res/img/Netflix_Logo_RGB.png">
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
											<div class="profile-selector">
												<ul class="profiles structural">
													<li class="profile">
														<a href="#">
															<img src="https://occ-0-988-395.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABf9uIfUy3k75jnjPf-M5wZdrjcXMLe04_P5az0_eAPb3dECf_y_hunxCmOg5febcU6DyIEc1L18SK7t1vmE6s5o.png?r=fcd">
															<span class="name">키즈</span>															
														</a>
													</li>
												</ul>
											</div>
											<ul class="profile-manage structural">
												<li class="manage">
													<a href="#">프로필 관리</a>
												</li>
											</ul>
											<ul class="links structural">
												<li><a href="#">계정</a></li>
												<li><a href="#">고객 센터</a></li>
												<li><a href="#">넷플릭스에서 로그아웃</a></li>
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
					<div class="responsive-account-container responsive-account-container-phone">
						<form class="change-phone-form">
							<div class="ui-message-container ui-message-security-pass">
								<div class="ui-message-svg-icon">
									<i class="fas fa-user-shield" style="color: white;"></i>
								</div>
								<div class="ui-message-contents">
									확인되었습니다! 본인 확인이 완료되었으므로 이제 계정 정보를 변경하실 수 있습니다.
								</div>
							</div>
							<h1 class="headline">전화번호를 변경하세요	</h1>
							<p class="secondary">등록하신 전화번호는 나중에 접속 문제를 해결하거나 계정을 복구하는 데 사용됩니다.</p>
							<label for="id_phoneNumber">휴대폰 번호</label>
							<ul class="simpleForm structural ui-grid">
								<li class="nfFormSpace phone-number">
									<div class="nfInput externalLabel">
										<div class="nfInputPlacement">
											<input type="text" name="phoneNumber" placeholder="${phoneNumber }" class="nfTextField hasText" id="id_phoneNumber">
											<div class="inputError">정확한 전화번호를 입력하세요.	</div>
										</div>
									</div>
								</li>
							</ul>
							<div class="nf-btn-bar change-phone-buttons">
								<button id="btn-next" type="submit" disabled class="nf-btn nf-btn-primary nf-btn-retro nf-btn-small">
									변경
								</button>
								<button id="btn-cancel" type="button" class="nf-btn nf-btn-secondary nf-btn-solid nf-btn-small">
									취소
								</button>
							</div>
						</form>
					</div>
				</div>
				
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop"	data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true" >
					<div class="modal-dialog">
						<div class="modal-content" style="margin-top: 10rem;">
							<div class="modal-body"><h1 class="headline">전화번호가 변경되었습니다</h1></div>
							<div class="modal-footer">
								<button id="move-main-btn" type="button" class="btn btn-secondary modal-btn" data-bs-dismiss="modal">메인페이지로 이동</button>
								<button id="move-account-btn" type="button" class="btn btn-primary modal-btn">내 계정 보러가기</button>
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