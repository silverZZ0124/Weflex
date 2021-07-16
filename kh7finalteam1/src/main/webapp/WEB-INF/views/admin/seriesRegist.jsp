<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>   

<c:if test="${contentDto.contentSeries eq 'Y'}">
<div class="container-fluid">
        <div class="row mt-3">
            <div class="col-md-4 offset-sm-4">
                <div class="text-center mb-4">
                    <h2> 연작 컨텐츠 정보 입력</h2>
                </div>
            <form class="form" action="yes" method="post">

               		 <input type="hidden" name="contentNo" value="${contentDto.contentNo}">

                <div class="form-group">
                    <label>시즌</label>
                    <input type="number" name="contentSeason" class="form-control" placeholder="시즌을 입력하세요(ex. 1 , 2 , 3 ...)">
                </div>

                <div class="form-group">
                    <label>몇화</label>
                    <input type="number" name="contentEpisode" class="form-control" placeholder="화를 입력하세요(ex. 1 , 2 , 3 ...)">
                </div>

                <div class="form-group">
                    <label>해당 화 소개글</label>
                    <textarea name="episodeInfo" class="form-control form-textarea"></textarea>
                </div>

                <div class="form-group">
                    <label>영상길이</label>
                    <input type="number" name="contentPlaytime" class="form-control" placeholder="ex) 70(분) 형식으로 입력(숫자)" min="0" max="999">
                </div>

                <div class="form-group">
                    <label>컨텐츠 주소</label>
                    <input type="text" name="seriesPath" class="form-control" placeholder="url">
                </div>



                <button type="submit" class="btn btn-primary btn-block">등록</button>
                <button type="reset" class="btn btn-secondary btn-block">초기화</button>

            </form>
        </div>
	</div>
</div>

</c:if>

<c:if test="${contentDto.contentSeries eq 'N'}">
	<div class="container-fluid">
	    <div class="row mt-3">
	        <div class="col-md-4 offset-sm-4">
	            <div class="text-center mb-4">
	                <h2>비 연작 컨텐츠 정보 입력</h2>
	            </div>
	           
	            <form class="form" action="no" method="post">
	
		            	<input type="hidden" name="contentNo" value="${contentDto.contentNo}">
		
		            <div class="form-group">
		                <label>영상길이</label>
		               <input type="number" name="contentPlaytime" class="form-control" placeholder="ex) 70(분) 형식으로 입력(숫자)" min="0" max="999">
		            </div>
		
		            <div class="form-group">
		                <label>컨텐츠 주소</label>
		                <input type="text" name="seriesPath" class="form-control" placeholder="url">
		            </div>
		
		
		            <button type="submit" class="btn btn-primary btn-block">등록</button>
		            <button type="reset" class="btn btn-secondary  btn-block">초기화</button>
		
	        	</form>
	   		 </div>
		</div>
</div>

</c:if>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>