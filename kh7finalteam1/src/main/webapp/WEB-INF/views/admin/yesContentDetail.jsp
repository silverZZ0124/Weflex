<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/style.css"> --%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<div class="container-fluid">
	
	
	<div class="row">
	    <div class="col-md-10 offset-md-1">
	
	        <div class="card shadow mb-4">
	        
	            <div class="card-header py-3">
	                <h6 class="m-0 font-weight-bold text-primary">컨텐츠 상세보기</h6>
	            </div>
	            
	            <div class="card-body row">
	            	<div class="thumnail-img col-md-6 text-left">
	            		<div style="position:relative">
		            		<img alt="${contentDto.contentName }" src="${contentDto.contentThumbnail }" style="width:100%;"><br>
		            		<img alt="${contentDto.contentName }" src="${contentDto.contentLogo }" style="width:40%; position:absolute; top:0; left:0; transform:translateY(100%);">
	            		</div>
	            		<div class="mt-4">
	            			url : ${noSeriesDto.seriesPath}
	            		</div>
	            		<div>
	            			
	            		</div>
	            	</div>
	            	
	            	<div class="col-md-6">
	            		<div>컨텐츠 번호 : ${contentDto.contentNo }</div>
	            		<div class="mt-3">컨텐츠명 : ${contentDto.contentName }</div>
	            		<div class="mt-3">
	            			컨텐츠 타입 : 
		            		<c:choose>
								<c:when test="${contentDto.contentType eq 'km'}"> 한국 영화 </c:when>
								<c:when test="${contentDto.contentType eq 'fm'}"> 외국 영화 </c:when>
								<c:when test="${contentDto.contentType eq 'kd'}"> 한국 드라마 </c:when>
								<c:when test="${contentDto.contentType eq 'fd'}"> 외국 드라마 </c:when>
								<c:when test="${contentDto.contentType eq 'co'}"> TV 예능 </c:when>
								<c:when test="${contentDto.contentType eq 'an'}"> 애니메이션  </c:when>
								<c:when test="${contentDto.contentType eq 'do'}"> 다큐멘터리 </c:when>
							</c:choose>
						</div>
						<div class="mt-3">${contentDto.contentLimit}세 이상</div>
						<div class="mt-3">연작 여부 : ${contentDto.contentSeries}</div>
						<div class="mt-3">개봉년도 : ${contentDto.contentRelease}</div>
						<div class="mt-3">좋아요 : ${contentDto.contentLikes}</div>
						<div class="mt-3">조회수 : ${contentDto.contentViews}</div>
					    <div class="mt-3">영상 길이 : ${noSeriesDto.contentPlaytime}</div>
	            	</div>
	            	
                    <div class="col-md-6 offset-md-6">
                        <div class="row">
                            <div class="col-md-6 p-1">
                                <button type="button" class="btn btn-block btn-outline-primary" data-toggle="modal" data-target="#edit-content-modal">수정</button>
                            </div>
                            <div class="col-md-6 p-1">
                                <a href="contentDelete?contentNo=${contentDto.contentNo }" class="btn btn-block btn btn-outline-danger" id="delete-btn">삭제</a>
                            </div>
                        </div>
                    </div>
	            </div>             
	     	 </div>
	     
		     <div class="text-right mb-4">
		     	<a href="${pageContext.request.contextPath}/admin/content/" class="btn btn-primary">목록으로</a>
		     </div>
	     </div>
	 </div>
	
	<!-- 수정 버튼 클릭시 수정 화면 모달창 -->
    <div class="modal fade" id="edit-content-modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">컨텐츠 수정</h4>
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <div class="modal-body">
                    <div class="conatiner-fluid">
                        <div class="row">
                        	<div class="col-md-12">
                        	
                            <form action="noContentEdit" method="post" class="form">	
								<input type="hidden" name="contentNo" value="${contentDto.contentNo}">
								<input type="hidden" name="contentNo" value="${noSeriesDto.contentNo}">
				                <div class="form-group">
				                    <label>컨텐츠명</label>
				                    <input type="text" name="contentName" class="form-control" value="${contentDto.contentName}">
				                </div>
				
				                <div class="form-group form-textarea">
				                    <label>컨텐츠 소개</label>
				                    <textarea name="contentInfo" class="form-control form-textarea">${contentDto.contentInfo}</textarea>
				                </div>
				
								<div class="form-group">
				                    <label>url</label>
				                    <input type="text" name="seriesPath" class="form-control" value="${noSeriesDto.seriesPath}">
				                </div>
				                
								<div class="form-group">
				                    <label>영상 길이(분)</label>
				                    <input type="text" name="contentPlaytime" class="form-control" value="${noSeriesDto.contentPlaytime}">
				                </div>
								
				                <div class="form-group">
				                    <label>연령제한</label>
				                    <select class="form-control" name="contentLimit" required>
				                      <option value="" >선택하세요</option>
				                      <option value="1">전체 이용가</option>
				                      <option value="12">12세 이용가</option>
				                      <option value="15">15세 이용가</option>
				                      <option value="19">19세 이용가</option>
				                    </select>
				                  </div>
				                  
				                  <div class="form-group">
				                    <label>컨텐츠 타입</label>
				                    <select class="form-control" name="contentType" required>
				                   	  <option value="" >선택하세요</option>
				                      <option value="km">국내 영화</option>
				                      <option value="fm">해외 영화</option>
				                      <option value="kd">국내 드라마</option>
				                      <option value="fd">해외 드라마</option>
				                      <option value="co">예능</option>
				                      <option value="an">애니메이션</option>
				                      <option value="do">다큐멘터리</option>
				                    </select>
				                  </div>
				                  
								<div class="form-group">
				                    <label>개봉연도</label>
				                    <select class="form-control" name="contentRelease" required>
				                   	  <option value="" >선택하세요</option>
				                      <option>2021</option><option>2020</option><option>2019</option> <option>2018</option><option>2017</option>
				                      <option>2016</option><option>2015</option><option>2014</option><option>2013</option><option>2012</option> 
				                      <option>2011</option><option>2010</option><option>2009</option><option>2008</option><option>2007</option>
				                      <option>2006</option><option>2005</option><option>2004</option><option>2003</option><option>2002</option>
				                      <option>2001</option><option>2000</option><option>1999</option><option>1998</option><option>1997</option>
				                      <option>1996</option><option>1995</option>
				                    </select>
				                  </div>
				
				                 <div class="form-group">
				                    <label>컨텐츠 로고</label>
				                    <input type="text" name="contentLogo" class="form-control" value="${contentDto.contentLogo}">
				                </div>
				
				                <div class="form-group">
				                    <label>컨텐츠 썸네일</label>
				                    <input type="text" name="contentThumbnail" class="form-control" value="${contentDto.contentThumbnail}">
				                </div>
				                <div class="modal-footer">
				                    <button type="submit" class="btn btn-primary">확인</button>                        
				                    <button class="btn btn-danger" data-dismiss="modal">취소</button>
				                </div>
				            </form>
				            
                        </div>
                    </div>                    
                </div>


            	</div>
        	</div>
   	 	</div>
	</div>
</div>
<!-- /.container-fluid -->

<script>
	
	$(function(){
		$('select[name="contentLimit"]').find('option[value="${contentDto.contentLimit}"]').attr("selected",true);
		$('select[name="contentType"]').find('option[value="${contentDto.contentType}"]').attr("selected",true);
		$('select[name="contentRelease"]').find('option:contains("${contentDto.contentRelease}")').attr("selected",true);

	});
</script>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>