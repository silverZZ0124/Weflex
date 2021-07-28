<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/loginHeader.jsp"></jsp:include>
<script>
	$(function(){
		$("#start-weflex-btn").click(function(){
			location.href="${pageContext.request.contextPath }/home";
		});
	});
</script>
<div class="container-center pay-page-main">

	<div class="pay-page-big-font text-center">결제가 완료되었습니다!</div>
	<div style="margin-top:3%;">
		<div style="text-align:center;">위플렉스 회원이 되신걸 축하드립니다.</div>
		<div class="container-center" style="width:300px;margin-top:3%;">
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
	</div>
	
	<div style="display:flex;">
		<button class="red-next-btn container-center" id="start-weflex-btn">지금 바로 동영상 시청하기</button>
	</div>
</div>
</section>
</main>
</body>
</html>