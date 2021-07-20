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

    <section class="ftco-section pt-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">컨텐츠 리스트</h2>
                </div>
            </div>
            
            <!-- 검색창 -->
            <div class="col-md-4 offset-md-4">
            	<form class="form">
            		<div class="row">
	            		<div class="col-md-5 p-1">
			            	<select class="form-control">
			            		<option>선택</option>
			            		<option>드라마</option>
			            		<option>영화</option>
			            		<option>예능</option>
			            		<option>다큐멘터리</option>
			            	</select>
		            	</div>
		            	<div class="col-md-5 p-1">
		            		<input type="text" class="form-control">
		            	</div>
		            	<div class="col-md-2 p-1">
		            		<input type="submit" class="btn btn-primary" value="검색">
		            	</div>
	            	</div>
            	</form>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrap">
                        <table class="table table-responsive-md table-hover content-table">
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
                            	<!-- 행 클릭시 해당 컨텐츠 상세보기 페이지로 이동 -->
                                <tr onClick="location.href='contentDetail?contentNo=${contentDto.contentNo}'" style="cursor:pointer;" class="content-tr">
                            
                                    <!-- 컨텐츠 번호 들어갈 자리 -->
                                    <td>
                                        <span class="content-no" style="padding-left:2em">${contentDto.contentNo}</span>
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
<!-- /.container-fluid -->



<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>