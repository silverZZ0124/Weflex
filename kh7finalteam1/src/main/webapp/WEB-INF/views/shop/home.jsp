<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/loginHeader.jsp"></jsp:include>
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


