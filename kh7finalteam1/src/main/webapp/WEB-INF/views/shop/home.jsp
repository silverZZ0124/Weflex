<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color:white !important;">
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/template.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/common.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/pay.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/join3.css"/>

 
	

	
	    
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
<script>
	$(function(){
		$(".red-block").hover(function(){
			$(this).css("cursor","pointer");
		});
		
		$("#standard-box").click(function(){
			$(this).removeClass("semi-red").addClass("real-red");
			$("#premium-box").removeClass("real-red").addClass("semi-red");
			$(".pay-page-detail-small-text-box > div:first-child").removeClass("gray-font").addClass("real-red-font");
			$(".pay-page-detail-small-text-box > div:last-child").removeClass("real-red-font").addClass("gray-font");
			$("#standard-red-check").show();
			$("#standard-gray-check").hide();
			$("#premium-gray-check").show();
			$("#premium-red-check").hide();
			$("#input-productNo").val("1");
			
			
		});
		$("#premium-box").click(function(){
			$(this).removeClass("semi-red").addClass("real-red");
			$("#standard-box").removeClass("real-red").addClass("semi-red");
			$(".pay-page-detail-small-text-box > div:last-child").removeClass("gray-font").addClass("real-red-font");
			$(".pay-page-detail-small-text-box > div:first-child").removeClass("real-red-font").addClass("gray-font");
			$("#premium-red-check").show();
			$("#premium-gray-check").hide();
			$("#standard-gray-check").show();
			$("#standard-red-check").hide();
			$("#input-productNo").val("2");
			
		});
	});
</script>

<body style="background-color:white !important;">
		<main>
		<div class="" >
		<div class="nfHeader noBorderHeader signupBasicHeader">
					<a href="/" class="svg-nfLogo signupBasicHeader">
						<img class="svg-icon svg-icon-netflix-logo"src="${pageContext.request.contextPath }/res/img/weflex_logo.png" style="margin-bottom:7%;">
						
					</a>
					<a href="/signout" class="authLinks signupBasicHeader">로그아웃</a>
				</div>
	
		
		

		
		</div>		
<section style="background-color:white !important;">
<div class="container-center pay-page-main">
	<div style=" width:50%;    margin-left: 2%;">
		<div class="pay-page-small-font">2/3 단계</div>
		<div class="pay-page-big-font">원하는 멤버십을 선택하세요.</div>
		<div>
			<svg viewBox="0 0 24 24"class="checkmark-group--icon" aria-hidden="true">
			<path fill="currentColor"d="M3.707 12.293l-1.414 1.414L8 19.414 21.707 5.707l-1.414-1.414L8 16.586z"></path>
			</svg>
			<span class="checkmark-group--text">광고 없이 무제한으로 시청.</span>
		</div>
		<div>
			<svg viewBox="0 0 24 24"class="checkmark-group--icon" aria-hidden="true">
			<path fill="currentColor"d="M3.707 12.293l-1.414 1.414L8 19.414 21.707 5.707l-1.414-1.414L8 16.586z"></path>
			</svg>
			<span class="checkmark-group--text">취향에 꼭 맞는 콘텐츠를 추천해 드립니다.</span>
		</div>
		<div>
			<svg viewBox="0 0 24 24"class="checkmark-group--icon" aria-hidden="true">
			<path fill="currentColor"d="M3.707 12.293l-1.414 1.414L8 19.414 21.707 5.707l-1.414-1.414L8 16.586z"></path>
			</svg>
			<span class="checkmark-group--text">멤버십은 언제든지 변경 또는 해지 가능.</span>
		</div>
	</div>
	<div style="width:100%;margin-top: 2%;">
		<div style="display:flex;">
		<div class="red-block-box">
			
			<div class="red-block semi-red" id="standard-box"><span class="semi-red-block-text">스탠다드</span></div>
			<div class="red-block real-red" id="premium-box"><span class="semi-red-block-text">프리미엄</span></div>
			
			
		</div>
		</div>
		<div class="pay-page-detail-text">
			<div>월 요금</div>
			<div class="pay-page-detail-small-text-box">
				<div class="pay-page-detail-small-text gray-font">12,000원</div>
				<div class="pay-page-detail-small-text real-red-font">14,000원</div>
			</div>
		</div>
		<div class="pay-page-detail-text">
			<div>영상 화질</div>
			<div class="pay-page-detail-small-text-box">
				<div class="pay-page-detail-small-text gray-font">매우 좋음</div>
				<div class="pay-page-detail-small-text real-red-font">가장 좋음</div>
			</div>
		</div>
		<div class="pay-page-detail-text">
			<div>해상도</div>
			<div class="pay-page-detail-small-text-box">
				<div class="pay-page-detail-small-text gray-font">1080p</div>
				<div class="pay-page-detail-small-text real-red-font">4K+HDR</div>
			</div>
		</div>
		<div class="pay-page-detail-text">
			<div>TV, 컴퓨터, 스마트폰, 태블릿으로 시청</div>
			<div class="pay-page-detail-small-text-box">
				<div class="pay-page-detail-small-text">
					<div id="standard-gray-check"><svg viewBox="0 0 26 26"class="checkmark-group--icon gray-check" id="standard-check" aria-hidden="true"><polygon points="4.70710678 13.2928932 3.29289322 14.7071068 9 20.4142136 22.7071068 6.70710678 21.2928932 5.29289322 9 17.5857864"></polygon></svg></div>
					<div id="standard-red-check" style="display:none;"><svg viewBox="0 0 24 24"class="checkmark-group--icon" id="premium-check" aria-hidden="true"><path fill="currentColor"d="M3.707 12.293l-1.414 1.414L8 19.414 21.707 5.707l-1.414-1.414L8 16.586z"></path></svg></div>
				</div>
				<div class="pay-page-detail-small-text">
					<div id="premium-red-check"><svg viewBox="0 0 24 24"class="checkmark-group--icon" id="premium-check" aria-hidden="true"><path fill="currentColor"d="M3.707 12.293l-1.414 1.414L8 19.414 21.707 5.707l-1.414-1.414L8 16.586z"></path></svg></div>
					<div id="premium-gray-check" style="display:none;"><svg viewBox="0 0 26 26"class="checkmark-group--icon gray-check" id="standard-check" aria-hidden="true"><polygon points="4.70710678 13.2928932 3.29289322 14.7071068 9 20.4142136 22.7071068 6.70710678 21.2928932 5.29289322 9 17.5857864"></polygon></svg></div>
					</div>
			</div>
			
		</div>
	</div>
	<div style="display:flex;">
	<form action="buy" method="post" class="container-center">
		<input type="hidden" name="no" id="input-productNo" value="2">
		<input type="hidden" name="quantity" value="1">
	
		
		<input type="submit" value="다음" class="red-next-btn">
		</form>
	</div>
</div>

</section>
</main>
</body>
</html>


