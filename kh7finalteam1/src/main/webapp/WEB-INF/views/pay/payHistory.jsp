<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/join3.css"/>
<jsp:include page="/WEB-INF/views/template/loginHeader.jsp"></jsp:include>
<style>
.pay-history-detail-text{
	width: 250px;
    margin-top: 3%;
    display: flex;
    justify-content: space-evenly;
}
</style>
<script>
	$(function(){
		$("#start-weflex-btn").click(function(){
			location.href="${pageContext.request.contextPath}/home";
		});
	});
</script>
<div class="container-center pay-page-main">

	<div class="pay-page-big-font text-center">결제 이력 확인</div>
	<div style="margin-top:3%;">
		<div style="text-align:center;">결제 정보를 확인하세요.</div>
		<div class="container-center pay-history-detail-text">
			<div>
				<c:forEach var="buyListDto" items="${list }">
					<div>
						<span>${buyListDto.buyPaymentDate}</span>
					</div>
				</c:forEach>
			</div>
			<div>
				<c:forEach var="productDto" items="${productList }">
					<div>
						<span>${productDto.productName }</span>
					</div>
				</c:forEach>
			</div>
			<div>
				<c:forEach var="productDto" items="${productList }">
					<div>
						<span>${productDto.productPrice }</span>
					</div>
				</c:forEach>
			</div>
			
		
		
		</div>
	</div>
	
	<div style="display:flex;">
		<button class="red-next-btn container-center" id="start-weflex-btn">메인 페이지로 돌아가기</button>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/loginFooter.jsp"></jsp:include>	