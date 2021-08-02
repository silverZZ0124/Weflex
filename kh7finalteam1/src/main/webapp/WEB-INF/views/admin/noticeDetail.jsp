<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.finalteam1.vo.NoticeVo"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>

<style>
	th {
		width:15%;
	}
	div {white-space: normal;}
	#content {
            min-height: 150px;
            max-height: 400px;
        }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <section class="ftco-section pt-5">
 			<div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">공지사항</h2>
                </div>
            </div>
<div class="container my-1 border-top">
	<div class="row">
		<table class="table table-active">
			<thead>
				<tr class="table-active border-bottom">
					<th class="col-md-8">${noticeVo.noticeName}<br>
						${noticeVo.clientName}</th>
					<th class="col-md-4" class="text-right">조회수 ${noticeVo.noticeViewCount}
						<br> ${noticeVo.noticeDate}</th>
				</tr>
			</thead>
			
			<tbody>
				<tr class="table table-active">
					<td colspan="2" class="col-md-12 pt-5 content"><pre><br>${noticeVo.noticeWrite}<br><br></pre></td>
				</tr>
			</tbody>
			
		</table>
		<div class="col-md-12"><pre><br>${noticeVo.noticeWrite}<br><br></pre></div>
		<c:if test="${noticeVo.clientNo eq 10}">
    		<a onClick="location.href='noticeEdit?noticeNo=${noticeVo.noticeNo}'"  class="btn btn-primary">글 수정</a> 
    		<a onClick="location.href='noticeDelete?noticeNo=${noticeVo.noticeNo}'"  class="btn btn-danger">삭제</a> 
		</c:if>
	</div>
</div>
</section>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>