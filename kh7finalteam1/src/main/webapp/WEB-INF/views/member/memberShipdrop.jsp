<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath }/res/css/member.css" />
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath }/res/css/drop.css" />  
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
var contextPath = "${pageContext.request.contextPath}";
</script>   
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
	<script>
	$(function(){
		$(".confirm-link").click(function(e){
			var message = $(this).data("message")||"정말 탈퇴하시겠습니까?";
			var choice = window.confirm(message);
			if(!choice){
				e.preventDefault();				
			}
		});
	});
	</script>
	<script>
	$(function(){
		$("fakie").click(function(){
			location.href="${pageContext.request.contextPath }/yourAccount/";
		});
	});
	</script>
</head>
<body>
				<div id="hdSpace">
					<div id="hdPinTarget" class="member-header">
						<div id="hd">
							<div>
								<a href="/finalteam1" class="svg-nfLogo logo">
									<img class="logo_img" src="/finalteam1/res/img/weflex_logo.png">
								</a>
							</div>
							<div class="account-secondary-navigation last">
								<div id="account-tools">
									<div id="profileSelector" class="profile-selector collapsed" data-bs-toggle="collapse" data-bs-target=".triggers" aria-expanded="false" aria-controls="trigger-collapse profiles-collapse">
										<div class="current-profile">
											<img class="avatar" src="https://occ-0-988-395.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABZAl_RHxQaFudkiao5vPLVFhEyGG1QqTCFxjdy4hEOrxzY9GGUa2IoZyznfP4TitB2zLMNPgY_RK74GZJufj7ek.png?r=a41">
											<span class="profile-arrow"></span>	
											<span class="trigger triggers collapse" id="trigger-collapse" style=""></span>										
										</div>
										<div class="profiles-container triggers collapse" id="profiles-collapse" style="">											
											<ul class="links structural">
												<li><a id="move-account" href="/finalteam1/yourAccount">계정</a></li>
												<li><a id="move-help" href="/finalteam1/help">고객 센터</a></li>
												<li><a id="move-logout" href="/">넷플릭스에서 로그아웃</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="bd">
					<div class="responsive-account-container">
						<div>
							<div class="areYouWatching" style="text-align: center;">
								<h1>그동안 감사했습니다. 회원탈퇴를 도와드리겠습니다.</h1>
									<h2 id="" class="description">회원탈퇴를 하시려면 아래를 버튼을 눌러 주세요.</h2>
									
									<a class="btn btn-plain btn-small " href="${pageContext.request.contextPath }/yourAccount" >뒤로</a>
									<a class="btn btn-plain btn-small  btn-drop confirm-link" href="${pageContext.request.contextPath }/exit" >회원탈퇴</a>									

							</div>
						</div>
					</div>
				</div>
				<div class="site-footer-wrapper">
					<div class="footer-divider"></div>
					<div class="site-footer">
						<p class="footer-top">
							<a class="footer-top-a" href="https://help.netflix.com/contactus">질문이 있으신가요? 고객 센터에 문의하세요.</a>
						</p>
						<ul class="footer-links structural">
							<li class="footer-link-item footer-link-audio-and-subtitles"placeholder="footer_responsive_link_audio_and_subtitles_item">
								<a class="footer-link" href="http://netflix.com/browse/subtitles/"placeholder="footer_responsive_link_audio_and_subtitles">
									<span id="" >자막 및 음성</span>
								</a>
							</li>
							<li class="footer-link-item footer-link-help"placeholder="footer_responsive_link_help_item">
								<a class="footer-link"href="http://help.netflix.com/"placeholder="footer_responsive_link_help">
									<span id="">고객 센터</span>
								</a>
							</li>
							<li class="footer-link-item footer-link-gift-card"placeholder="footer_responsive_link_gift_card_item">
								<a class="footer-link" href="http://netflix.com/redeem/"placeholder="footer_responsive_link_gift_card">
								<span id="">기프트카드</span>
								</a>
								</li>
							<li class="footer-link-item footer-link-relations"
								placeholder="footer_responsive_link_relations_item">
								<a class="footer-link"href="http://ir.netflix.com"placeholder="footer_responsive_link_relations">
									<span id="">투자 정보(IR)</span>
								</a>
							</li>
							<li class="footer-link-item footer-link-media"
								placeholder="footer_responsive_link_media_center_item">
								<a
								class="footer-link" data-uia="footer-link"
								href="http://media.netflix.com"
								placeholder="footer_responsive_link_media_center">
								<span
									id="" data-uia="data-uia-footer-label">미디어 센터</span>
									</a>
									</li>
							<li class="footer-link-item footer-link-jobs"placeholder="footer_responsive_link_jobs_item">
								<a class="footer-link"href="http://jobs.netflix.com/"placeholder="footer_responsive_link_jobs">
									<span id="">입사 정보</span>
								</a>
							</li>
							<li class="footer-link-item footer-link-cookies"placeholder="footer_responsive_link_cookies_separate_link_item">
								<a class="footer-link"href="http://netflix.com/Cookies/"placeholder="footer_responsive_link_cookies_separate_link">
									<span id="" >쿠키 설정</span>
								</a>
							</li>
							<li class="footer-link-item footer-link-terms"placeholder="footer_responsive_link_terms_item">
								<aclass="footer-link"href="https://help.netflix.com/legal/termsofuse"placeholder="footer_responsive_link_terms">
									<span id="">이용 약관</span>
								</a>
							</li>
							<li class="footer-link-item footer-link-privacy"placeholder="footer_responsive_link_privacy_item">
								<a class="footer-link"href="https://help.netflix.com/legal/privacy"placeholder="footer_responsive_link_privacy">
									<span id="">개인정보 처리방침</span>
								</a>
							</li>
						</ul>
						<div class="copy-text">
							<div class="copy-text-block">넷플릭스서비시스코리아 유한회사 통신판매업신고번호: 제2018-서울종로-0426호 전화번호: </div>
							<div class="copy-text-block">대표: 레지널드 숀 톰프슨</div>
							<div class="copy-text-block">이메일 주소: korea@netflix.com</div>
							<div class="copy-text-block">주소: 대한민국 서울특별시 종로구 우정국로 26, 센트로폴리스 A동 20층 우편번호 03161</div>
							<div class="copy-text-block">사업자등록번호: 165-87-00119</div>
							<div class="copy-text-block">클라우드 호스팅: Amazon Web Services Inc.</div>
							<div id="" class="copy-text-block" >
								<a href="http://www.ftc.go.kr/www/bizCommView.do?key=232&amp;apv_perm_no=2018300016930200431&amp;pageUnit=10&amp;searchCnd=bup_nm&amp;searchKrwd=%EB%84%B7%ED%94%8C%EB%A6%AD%EC%8A%A4&amp;pageIndex=1">공정거래위원회 웹사이트</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>