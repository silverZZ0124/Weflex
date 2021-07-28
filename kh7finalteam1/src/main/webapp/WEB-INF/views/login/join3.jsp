<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/loginHeader.jsp"></jsp:include>
<script>
	$(function(){
		$("#join3-next-btn").click(function(){
			location.href="${pageContext.request.contextPath }/shop/";
		});
	});
</script>
<body>
	<div id="appMountPoint">
		<div class="netflix-sans-font-loaded">
			<div class="basicLayout notMobile modernInApp hasExtendedDiacritics signupSimplicity-planSelectionWithContext simplicity">
				
				<div class="simpleContainer" data-transitioned-child="true">
					<div class="centerContainer contextStep"style="display: block; transform: none; opacity: 1; transition-duration: 250ms;min-width:340px;">
						<div class="planContainer" >
							<div class="stepLogoContainer">
								<span class="stepLogo planStepLogo">
								</span>
							</div>
							<div class="stepHeader-container" >
								<div class="stepHeader" data-a11y-focus="true" tabindex="0">
									<span id="" class="stepIndicator" >
									<b>2</b>
									/
									<b>3단계</b>
									</span>
									<h1 class="stepTitle" >원하는 멤버십을 선택하세요.</h1>
								</div>
							</div>
							<div class="contextBody contextRow">
								<ul class="checkmark-group" >
									<li class="checkmark-group--row">
									<svg viewBox="0 0 24 24"class="checkmark-group--icon" aria-hidden="true">
											<path fill="currentColor"d="M3.707 12.293l-1.414 1.414L8 19.414 21.707 5.707l-1.414-1.414L8 16.586z">
											</path>
											</svg>
											<span class="checkmark-group--text">無약정, 無위약금. 해지도쿨하게 언제든지.</span>
											</li>
									<li class="checkmark-group--row">
									<svg viewBox="0 0 24 24"class="checkmark-group--icon" aria-hidden="true">
											<path fill="currentColor"d="M3.707 12.293l-1.414 1.414L8 19.414 21.707 5.707l-1.414-1.414L8 16.586z">
											</path>
											</svg>
											<span class="checkmark-group--text">넷플릭스의 모든 콘텐츠를하나의 요금으로.</span>
											</li>
									<li class="checkmark-group--row">
									<svg viewBox="0 0 24 24"class="checkmark-group--icon" aria-hidden="true">
											<path fill="currentColor"d="M3.707 12.293l-1.414 1.414L8 19.414 21.707 5.707l-1.414-1.414L8 16.586z">
											</path>
											</svg>
											<span class="checkmark-group--text">모든 디바이스에서 무제한시청.</span>
											</li>
								</ul>
							</div>
						</div>
						<div class="submitBtnContainer">
							<button type="button" autocomplete="off"class="nf-btn nf-btn-primary nf-btn-solid nf-btn-oversize"placeholder="button_see_plans" id="join3-next-btn">다음</button>
						</div>
					</div>
				</div>
				<div class="site-footer-wrapper centered"style="transition-duration: 250ms; opacity: 1;">
					<div class="footer-divider">
					</div>
					<div class="site-footer">
						<p class="footer-top">질문이 있으신가요? 문의 전화: &nbsp;<a class="footer-top-a"href="tel:080-001-9587">080-001-9587</a>
						</p>
						<ul class="footer-links structural">
							<li class="footer-link-item"placeholder="footer_responsive_link_faq_item">
							<a class="footer-link" data-uia="footer-link"href="https://help.netflix.com/support/412"placeholder="footer_responsive_link_faq">
							<span id="">자주 묻는 질문</span>
							</a>
							</li>
							<li class="footer-link-item"placeholder="footer_responsive_link_help_item">
							<a class="footer-link" data-uia="footer-link"href="https://help.netflix.com"placeholder="footer_responsive_link_help">
							<span id="">고객 센터</span>
							</a>
							</li>
							<li class="footer-link-item"placeholder="footer_responsive_link_terms_item">
							<a class="footer-link" data-uia="footer-link"href="https://help.netflix.com/legal/termsofuse"placeholder="footer_responsive_link_terms">
							<span id="">이용 약관</span>
							</a>
							</li>
							<li class="footer-link-item" placeholder="footer_responsive_link_terms_item">
							<a class="footer-link"  href="https://help.netflix.com/legal/termsofuse" placeholder="footer_responsive_link_terms">
							<span id="" >이용 약관</span>
							</a>
							</li>
							<li class="footer-link-item" placeholder="footer_responsive_link_privacy_separate_link_item">
							<a class="footer-link"  href="https://help.netflix.com/legal/privacy" placeholder="footer_responsive_link_privacy_separate_link">
							<span id="" >개인정보</span>
							</a>
							</li>
							<li class="footer-link-item" placeholder="footer_responsive_link_cookies_separate_link_item">
							<a class="footer-link" href="#" placeholder="footer_responsive_link_cookies_separate_link">
							<span id="" >쿠키 설정</span>
							</a>
							</li>
							<li class="footer-link-item" placeholder="footer_responsive_link_corporate_information_item">
							<a class="footer-link"  href="https://help.netflix.com/legal/corpinfo" placeholder="footer_responsive_link_corporate_information">
							<span id="" >회사 정보</span>
							</a>
							</li>
						</ul>
						<div class="lang-selection-container" id="lang-switcher">
							<div class="nfSelectWrapper inFooter selectArrow prefix">
								<label class="nfLabel" for="lang-switcher-select">언어 선택</label>
								<div class="nfSelectPlacement globe">
								<select data-uia="language-picker" class="nfSelect"id="lang-switcher-select" name="__langSelect" tabindex="0">
									<option selected="" value="/signup/regform?locale=ko-KR" label="한국어"lang="ko">한국어</option>
										<option value="/signup/regform?locale=en-KR" label="English"lang="en">English</option>
										</select>
								</div>
							</div>
						</div>
						<div class="copy-text">
							<div class="copy-text-block">넷플릭스서비시스코리아 유한회사 통신판매업신고번호:제2018-서울종로-0426호 전화번호: 080-001-9587</div>
							<div class="copy-text-block">대표: 레지널드 숀 톰프슨</div>
							<div class="copy-text-block">이메일 주소: korea@netflix.com</div>
							<div class="copy-text-block">주소: 대한민국 서울특별시 종로구 우정국로 26,센트로폴리스 A동 20층 우편번호 03161</div>
							<div class="copy-text-block">사업자등록번호: 165-87-00119</div>
							<div class="copy-text-block">클라우드 호스팅: Amazon Web ServicesInc.</div>
							<div id="" class="copy-text-block" >
								<a href="http://www.ftc.go.kr/www/bizCommView.do?key=232&amp;apv_perm_no=2018300016930200431&amp;pageUnit=10&amp;searchCnd=bup_nm&amp;searchKrwd=%EB%84%B7%ED%94%8C%EB%A6%AD%EC%8A%A4&amp;pageIndex=1">공정거래위원회웹사이트</a>
							</div>
						</div>
					</div>
				</div>
				<div class="a11yAnnouncer" aria-live="assertive" tabindex="-1"></div>
			</div>
		</div>
	</div>
</body>
</html>