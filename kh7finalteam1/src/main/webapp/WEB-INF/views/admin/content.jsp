<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/style.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<div class="container-fluid">

    <div class="container-fluid">

        <section class="ftco-section pt-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">컨텐츠 리스트</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-wrap">
                            <table class="table table-responsive-md table-hover">
                                <thead>
                                    <tr>
                                        <th>컨텐츠 번호</th>
                                        <th>제목</th>
                                        <th>분류</th>
                                        <th>연령제한</th>
                                        <th>조회수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="contentDto" items="${contentList}">
                                    <tr onClick="location.href='contentDetail'" style="cursor:pointer;">
                                
                                        <!-- 컨텐츠 번호 들어갈 자리 -->
                                        <td>
                                            <span>&emsp;${contentDto.contentNo }</span>
                                        </td>
                                        
                                        <!-- 제목 들어갈 자리 -->
                                        <td class="d-flex align-items-center">
                                            <div>
                                                <img src="https://via.placeholder.com/120x60?text=P" width="100%"> 
                                            </div>
                                            <div class="pl-3 email">
                                                <span>${contentDto.contentName }</span>
                                                <span>개봉 : ${contentDto.contentRelease }</span>
                                            </div>
                                        </td>
                                        
                                        <!-- 
                                        	컨텐츠 타입 들어갈 자리
                                        	- km : 한국 영화
                                        	- fm : 외국 영화
                                        	- kd : 한국 드라마
                                        	- fd : 외국 드라마
                                        	- co : 예능
                                        	- an : 애니메이션
                                        	- do : 다큐멘터리
                                        -->
                                        <td>
                                        	<c:choose>
												<c:when test="${contentDto.contentType eq 'km'}"> 한국 영화 </c:when>
												<c:when test="${contentDto.contentType eq 'fm'}"> 외국 영화 </c:when>
												<c:when test="${contentDto.contentType eq 'kd'}"> 한국 드라마 </c:when>
												<c:when test="${contentDto.contentType eq 'fd'}"> 외국 드라마 </c:when>
												<c:when test="${contentDto.contentType eq 'co'}"> TV 예능 </c:when>
												<c:when test="${contentDto.contentType eq 'an'}"> 애니메이션  </c:when>
												<c:when test="${contentDto.contentType eq 'do'}"> 다큐멘터리 </c:when>
											</c:choose>     
                                        </td>
                                        
                                        <!-- 연령 제한  -->
                                        <!-- <td class="status"><span class="active">Active</span></td> -->
                                        <td class="status">${contentDto.contentLimit }&nbsp;+</td>
                                        
                                        <!-- 조회수 -->
                                        <td>
                                            <!-- <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true"><i class="fa fa-close"></i></span>
                                            </button> -->
                                            ${contentDto.contentViews }
                                        </td>
                                      
                                    </tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
    </div>
</div>
<!-- /.container-fluid -->

<!-- 행 클릭시 해당 컨텐츠 상세보기 페이지로 이동 -->
<script>
	$(function(){
		$("#content-table tr").click(function(){
			var tr = $(this);
			console.log("클릭한 행의 모든 데이터 : "+tr.text());
		});
	});

</script>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>