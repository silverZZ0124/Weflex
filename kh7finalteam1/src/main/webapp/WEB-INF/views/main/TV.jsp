<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div class="tv-page-title">
	<div class="tv-page-title-text">TV 프로그램</div>
	<select class="selectpicker main-color tv-page-title-select-box">
								    
								      <option>장르</option>
								      <option>한국드라마</option>
								      <option>미국드라마</option>  
								      <option>영국드라마</option>
								      
								  
								  </select>
	</div>
	
<div class="main-color container-center search-page-body">

	<c:forEach var="i" begin="1" end="10" step="1">
		<div class="search-page-card"><img src="res/img/slider_img1.jpeg" class="search-page-card-img"></div>
	</c:forEach> 
	
	
	
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





