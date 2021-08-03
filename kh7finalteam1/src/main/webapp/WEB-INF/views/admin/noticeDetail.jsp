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
                    <h2 class="heading-section text-gray-800">공지사항</h2>
                </div>
            </div>
<div class="container my-1">
	<div class="row">
		<div class="col-md-10 offset-md-1">
		<div class="card">
			<div class="card-body">
				<table class="table">
					<thead style="color:#141414">
						<tr class="border-bottom">
							<th class="col-md-7">${noticeVo.noticeName}</th>
							<th class="col-md-5 text-right">${noticeVo.clientName} | ${noticeVo.noticeDate} | 조회수 ${noticeVo.noticeViewCount}
							</th>
						</tr>
					</thead>
					
					<tbody>
						<tr class="table">
							<td colspan="2" class="col-md-12 pt-5" id="content"><pre><br>${noticeVo.noticeWrite}<br><br></pre></td>
						</tr>
					</tbody>
					
				</table>
				</div>
			</div>
		</div>
		</div>
		<%-- <div class="col-md-12"><pre><br>${noticeVo.noticeWrite}<br><br></pre></div> --%>
		
		<c:if test="${noticeVo.clientNo eq sessionScope.clientNo}">
			<div class="col-md-10 offset-md-1 text-right py-3 pr-0">
    		<a onClick="location.href='noticeEdit?noticeNo=${noticeVo.noticeNo}'"  class="btn btn-danger">글 수정</a> 
    		<a onClick="location.href='noticeDelete?noticeNo=${noticeVo.noticeNo}'"  class="btn btn-secondary">삭제</a>
    		<a href="${pageContext.request.contextPath}/admin/notice/list" class="btn btn-outline-dark">목록으로</a>
    		</div> 
		</c:if>
	
</div>
</section>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>