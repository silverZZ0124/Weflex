<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/join3.css"/>
<jsp:include page="/WEB-INF/views/template/loginHeader.jsp"></jsp:include>
<style>
.pay-history-detail-text{
	width: 400px;
    margin-top: 3%;
    display: flex;
    text-align:center;
    font-size: 0.9rem;
}
.pay-history-detail-title{
	color: rgb(204,204,204);
	border-bottom:1px solid rgb(204,204,204);
}
.pay-history-detail{
	border-bottom:1px solid rgb(204,204,204);
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
			<div class="pay-history-detail">
				
			</div>
			<div style="width:100px;">
				<div class="pay-history-detail-title">날짜</div>
				<c:forEach var="buyListDto" items="${list }">
					<div class="pay-history-detail">
						<span style="color:rgb(55,126,247);justify-content: space-between;">${buyListDto.buyPaymentDate}</span>
					</div>
				</c:forEach>
			</div>
			<div style="width:100px; text-align:center;">
				<div class="pay-history-detail-title">설명</div>
				<c:forEach var="productDto" items="${productList }">
					<div class="pay-history-detail">
						<span style="justify-content: space-between;">${productDto.productName }</span>
					</div>
				</c:forEach>
			</div>
			<div style="width:100px;">
				<div class="pay-history-detail-title">가격</div>
				<c:forEach var="productDto" items="${productList }">
					<div class="pay-history-detail">
						<span style="justify-content: space-between;">${productDto.productPrice }</span>
					</div>
				</c:forEach>
			</div>
			<div style="width:100px;">
				<div class="pay-history-detail-title">결제수단</div>
				<c:forEach var="buyListDto" items="${list }">
					<div class="pay-history-detail">
						<span style="justify-content: space-between;">카카오페이</span>
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