<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/loginHeader.jsp"></jsp:include>

<div class="container-center pay-page-main">
	<div class="pay-page-small-font text-center">3/3단계</div>
	<div class="pay-page-big-font text-center">결제 정보 확인</div>
	<div class="pay-page-etc-text">
		<div>결제가 완료되면 바로</div>
		<div>멤버십이 시작됩니다.</div>
		<div>약정도 없고, 광고도 없다!</div>
		<div>클릭 한번으로 끝.</div>
	</div>
	<div class="pay-info-box container-center">
		<div><span class="pay-info-title">결제 상품&ensp;</span><span>${productDto.productName }</span>  </div>
		<div><span class="pay-info-title">결제 금액&ensp;</span><span>${productDto.productPrice }원</span>  </div>
	</div>
	<div style="display:flex;">
		<form action="confirm" method="post" class="container-center">
			<input type="hidden" name="no" value="${productDto.productNo}">
			<input type="hidden" name="item_name" value="${productDto.productName}">
			<input type="hidden" name="quantity" value="${quantity}">
			<input type="hidden" name="total_amount" value="${total_amount}">
			<input type="submit" value="결제하기" class="red-next-btn">
		</form>
	</div>
</div>
</section>
</main>
</body>
</html>