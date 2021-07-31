<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>history.scrollRestoration = "auto"</script>
<style>
	.search-not {
		display: inline-block;
	}
	
	.search-info{
		margin-left:20px;
	}
</style>
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
	<c:if test="${empty contentList}">
			<div class="row">
				<div class="col text-center">
						<div class="search-not text-left">
							<p>입력하신 검색어 "${keyword}"(와)과 일치하는 결과가 없습니다.</p>
							<p>추천검색어
							<ul class="search-info">
								<li>다른 키워드를 입력해 보세요.</li>
								<li>TV 프로그램이나 영화를 찾고 있으신가요?</li>
								<li>영화 제목, TV 프로그램 제목, 또는 배우나 감독의 이름으로 검색해 보세요.</li>
								<li>코미디, 로맨스, 스포츠 또는 드라마와 같은 장르명으로 검색해 보세요.</li>
							</ul>
						</div>
				</div>
		</div>
	</c:if>
		


		<c:forEach var="contentListVO" items="${contentList}">
			<div class="search-page-card"><img src="${contentListVO.contentThumbnail}" data-contentNo="${contentListVO.contentNo }" class="search-page-card-img"></div>
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



