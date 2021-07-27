<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>결제 정보 확인</h1>
<div>${productDto.productNo }</div>
<div>${productDto.productName }</div>
<div>${productDto.productPrice }</div>

<form action="confirm" method="post">
	<input type="hidden" name="no" value="${productDto.productNo}">
	<input type="hidden" name="item_name" value="${productDto.productName}">
	<input type="hidden" name="quantity" value="${quantity}">
	<input type="hidden" name="total_amount" value="${total_amount}">
	<input type="submit" value="결제하기">
</form>
</body>
</html>