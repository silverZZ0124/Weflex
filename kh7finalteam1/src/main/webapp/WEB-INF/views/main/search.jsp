<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>history.scrollRestoration = "auto"</script>

<div class="main-color container-center search-page-body">
<%-- 
	<div style="position: relative;top: -12vw;">
		<c:forEach var="sliderVO" items="${sliderList }" varStatus="status">
		<div class="slider-title container-center">${sliderVO.sliderTitle }</div>		
		<div class="custom-img-slide-box">
			<div class="container-center slider-box" id="slider1">
				
				
			  	<div class="custom-img-slide">
			   		<c:forEach var="contentListVO" items="${sliderList[status.index].contentList }" varStatus="stat">
						<div><img class="slider-img" src="${contentListVO.contentThumbnail }" data-contentNo="${contentListVO.contentNo }"></div>
					</c:forEach> 	  
		  		</div>
		  		</div>
			</div>
		</c:forEach> 	
	</div>	
--%>

	<c:forEach var="contentListVO" items="${contentList}">
		<div class="search-page-card"><img src="${contentListVO.contentThumbnail}" data-contentNo="${contentListVO.contentNo }" class="search-page-card-img"></div>
	</c:forEach> 
	
	<c:forEach var="castListVO" items="${castList}">
		<div class="search-page-card"><img src="${castListVO.contentThumbnail}" data-contentNo="${castListVO.contentNo }" class="search-page-card-img"></div>
	</c:forEach> 
<%-- 
	<c:forEach var="i" begin="1" end="24" step="1">
		<div class="search-page-card"><img src="res/img/slider_img1.jpeg" class="search-page-card-img"></div>
	</c:forEach> 
--%>	
	<c:forEach var="j" begin="1" end="5" step="1">
		<div class="search-page-card" style="visibility:hidden;"><img src="res/img/slider_img1.jpeg" class="search-page-card-img"></div>
	</c:forEach> 
	
<%-- 
	<c:forEach var="contentListVO" items="${sliderList[status.index].contentList }" varStatus="stat">
						<div><img class="slider-img" src="${contentListVO.contentThumbnail }" data-contentNo="${contentListVO.contentNo }"></div>
	</c:forEach> 
--%>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>



