<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/loginHeader.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/join2.css"/>

		
</div>	
	<script>
		var emailFlag = false;
		var passwordFlag = false;
		var nameFlag= false;
		var birthFlag = false;
		var phoneFlag = false;
		
		$(function(){
			if($("#id_email").attr("disabled") == "disabled")
				emailFlag = true;
			
			$("#id_email").on("propertychange change keyup paste input", function(){				
				var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				
				$("#email-input-error").text("정확한 이메일 주소를 입력하세요. 예: name@example.com");
				if(regex.test($(this).val())){
					$(this).css("border-color", "#5fa53f");					
					$("#email-input-error").css("display", "none");
					emailFlag = true;
				}
				else{
					$(this).css("border-color", "#b92d2b");
					$("#email-input-error").css("display", "block");
					emailFlag = false;
				}
			});
			
			$("#id_email").blur(function(){
				if(!emailFlag)
					return;
				
				$.ajax({
					url: "${pageContext.request.contextPath}/data/member/emailCheck",
					type: "post",
					dataType: "json",
					data: {
						email: $(this).val()	
					},
					success:function(resp){		
						//null 이면 true  email 사용 가능 , false면 email 사용 불가능
						if(!resp){
							$("#id_email").css("border-color", "#b92d2b");
							$("#email-input-error").text("이미 사용중인 이메일 입니다");
							$("#email-input-error").css("display", "block");
							emailFlag = false;
						}
						else{
							emailFlag = true;
						}
					}	
				});
			});
			
			$("#id_password").on("propertychange change keyup paste input", function(){				
				var regex = /^(?=.*[A-Za-z])(?=.*[@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,16}$/;
				
				if(regex.test($(this).val())){
					$(this).css("border-color", "#5fa53f");					
					$("#password-input-error").css("display", "none");
					passwordFlag = true;
				}
				else{
					$(this).css("border-color", "#b92d2b");
					$("#password-input-error").css("display", "block");
					passwordFlag = false;
				}
			});
			
			$("#id_name").on("propertychange change keyup paste input", function(){				
				var regex = /^(?=.*[가-힣])[가-힣]{2,5}$/;
				
				if(regex.test($(this).val())){
					$(this).css("border-color", "#5fa53f");					
					$("#name-input-error").css("display", "none");
					nameFlag = true;
				}
				else{
					$(this).css("border-color", "#b92d2b");
					$("#name-input-error").css("display", "block");
					nameFlag = false;
				}
			});
			
			$("#id_birth").change(function(){
				var selDate = $(this).val();
				var selDateArr = selDate.split('-');
				
				var selDateCompare = new Date(selDateArr[0], selDateArr[1]-1, selDateArr[2]);
				
				var today = new Date();
				var todayCompare = new Date(today.getFullYear(), today.getMonth(), today.getDate());				
				
				if(selDateCompare.getTime() > todayCompare.getTime()){
					$(this).css("border-color", "#b92d2b");
					$("#birth-input-error").css("display", "block");
					birthFlag = false;
				}
				else{
					$(this).css("border-color", "#5fa53f");
					$("#birth-input-error").css("display", "none");
					birthFlag = true;
				}
			});
			
			$("#id_phone").on("propertychange change keyup paste input", function(){				
				var regex = /^\d{3}-\d{3,4}-\d{4}$/;
				
				if(regex.test($(this).val())){
					$(this).css("border-color", "#5fa53f");					
					$("#phone-input-error").css("display", "none");
					phoneFlag = true;
				}
				else{
					$(this).css("border-color", "#b92d2b");
					$("#phone-input-error").css("display", "block");
					phoneFlag = false;
				}
			});
			
			$("#regit-btn").click(function(e){
				if(!emailFlag){
					$("#id_email").focus();
					e.preventDefault();
					return false;
				}
				
				if(!passwordFlag){
					$("#id_password").focus();
					e.preventDefault();
					return false;
				}
				
				if(!nameFlag){
					$("#id_name").focus();
					e.preventDefault();
					return false;
				}
				
				if(!phoneFlag){
					$("#id_phone").focus();
					e.preventDefault();
					return false;
				}
				
				if(!birthFlag){
					$("#id_birth").focus();
					e.preventDefault();
					return false;
				}
				
				return true;
			});
		});
	</script>

				<div class="simpleContainer" data-transitioned-child="true">
					<div class="centerContainer"style="display: block; transform: none; opacity: 1; transition-duration: 250ms;min-width:400px;">
						<form action="joinCheck"method="POST" id="joinCheck">
							<div class="regFormContainer">
								<div class="stepHeader-container" >
									<div class="stepHeader" data-a11y-focus="true" tabindex="0">
										<span id="" class="stepIndicator" >
										<b>2</b>
										/
										<b>3단계</b>
										</span>
										<c:choose>
											<c:when test="${param.email ne 'null'}">
												<h1 class="stepTitle">비밀번호를 설정해 멤버십을시작하세요.</h1>								
											</c:when>														
											<c:otherwise>
												<h1 class="stepTitle">이메일과 비밀번호를 설정해 멤버십을시작하세요.</h1>
											</c:otherwise>
										</c:choose>	
										
									</div>
								</div>
								<div>
									<div class="contextRow" >몇 단계만 더거치면 넷플릭스 가입 완료!</div>
									<div class="contextRow">복잡한단계는 모두 없앴습니다.</div>
									<ul class="simpleForm structural ui-grid">
										<li class="nfFormSpace">
											<div class="nfInput nfInputOversize">
												<div class="nfInputPlacement">
													<label class="input_id" placeholder="email">
													<c:choose>
														<c:when test="${param.email ne 'null'}">
															<input type="hidden" name="clientId" value="${param.email}" >
															<input class="nfTextField hasText" id="id_email" type="email"tabindex="0" autocomplete="email" maxlength="50"minlength="5" dir="ltr" value="${param.email}" disabled required>															
														</c:when>														
														<c:otherwise>
															<input class="nfTextField hasText" id="id_email" name="clientId" type="email"tabindex="0" autocomplete="email" maxlength="50"minlength="5" dir="ltr" required>
														</c:otherwise>
													</c:choose>													
													<label for="id_email" class="placeLabel">이메일 주소</label>
													<div class="inputError" id="email-input-error">정확한 이메일 주소를 입력하세요. 예: name@example.com</div>
													</label>
												</div>
											</div>
										</li>
										<li class="nfFormSpace">
										<div class="nfInput nfInputOversize">
												<div class="nfInputPlacement">
													<label class="input_id" placeholder="password">
													<input name="clientPw"class="nfTextField hasText" id="id_password" type="password"value tabindex="0" autocomplete="password" maxlength="61"minlength="4" dir="" dir required>
													<label for="id_password" class="placeLabel">비밀번호를 추가하세요</label>
													</label>
													<div class="inputError" id="password-input-error">비밀번호는 하나 이상의 특수문자를 포함해  6~16자 사이여야 합니다</div>
												</div>
										</div>
										</li>
										<li class="nfFormSpace">
										<div class="nfInput nfInputOversize">
												<div class="nfInputPlacement">
													<label class="input_id" placeholder="이름" >
													<input name="clientName"class="nfTextField hasText" id="id_name" type="text"tabindex="0" autocomplete="name" maxlength="62" dir="" value="" required>
													<label for="id_name" class="placeLabel">이름</label>
													</label>
													<div class="inputError" id="name-input-error">이름은 한글로 2~5자 사이여야 합니다</div>
												</div>
										</div>
										</li>
										<li class="nfFormSpace">
										<div class="nfInput nfInputOversize">
												<div class="nfInputPlacement">
													<label class="input_birth" placeholder="생년월일">
													<input name="clientBirth"class="nfTextField hasText" id="id_birth" type="date"tabindex="0" autocomplete="birth" maxlength="62"minlength="6" dir="" value="" required>
													<label for="id_birth" class="placeLabel">생년월일를 입력해주세요</label>
													</label>
													<div class="inputError" id="birth-input-error">잘못된 생년월일 입니다</div>
												</div>
										</div>
										</li>
										<li class="nfFormSpace">
										<div class="nfInput nfInputOversize">
												<div class="nfInputPlacement">
													<label class="input_id" placeholder="phone">
													<input name="clientPhone"class="nfTextField hasText" id="id_phone" type="text"tabindex="0" autocomplete="phone" maxlength="62"minlength="6" dir="" value="" required>
													<label for="id_phone" class="placeLabel">핸드폰번호를 -포함하여 적어주세요</label>
													</label>
													<div class="inputError" id="phone-input-error">잘못된 핸드폰번호 입니다</div>
												</div>
										</div>
										</li>
									</ul>
								</div>
							</div>
							<div class="submitBtnContainer">
								<button type="submit" id="regit-btn" autocomplete="off"class="nf-btn nf-btn-primary nf-btn-solid nf-btn-oversize"placeholder="regForm_agree_next_registration_button">회원가입하기</button>
							</div>
						</form>
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