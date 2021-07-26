<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/style.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	function fn_write(){
	
		var form = document.getElementById("boardForm");

		form.action = "<c:url value='/board/writeForm.do'/>";
	form.submit();
	}
 
	function fn_view(code){

		var form = document.getElementById("boardForm");
		var url = "<c:url value='/board/viewContent.do'/>";
		url = url + "?code=" + code;

		form.action = url;    
		form.submit(); 
	}
</script>

<div class="container-fluid">

    <section class="ftco-section pt-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">공지사항</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrap">
                        <table class="table table-responsive-md table-hover content-table">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>조회</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="noticeVo" items="${list}">
                                <tr onClick="location.href='noticeDetail?noticeNo=${noticeVo.noticeNo}'" style="cursor:pointer;" class="content-tr">
                            
                                    <td>
                                        <span class="content-no" style="padding-left:2em">${noticeVo.noticeName}</span>
                                    </td>
                                    
                                    <td class="d-flex align-items-center">
                                        <div>
                                            <img src="https://via.placeholder.com/120x60?text=P" width="100%"> 
                                        </div>
                                        <div class="pl-3 email">
                                            <span>${noticeVo.clientDto.getClientName() }</span>
                                            <span><fmt:formatDate value="${noticeVo.noticeDate }" pattern="YYYY년 MM월 dd일"/></span>
                                        </div>
                                    </td>
                                    <td>
                                        ${noticeVo.noticeViewCount }
                                    </td>
                                </tr>
                            	</c:forEach>
                            </tbody>
                            
							<div>            
								<a onClick="location.href='noticeWrite?clientNo=${noticeVo.clientNo}'"  class="btn btn-success">공지글쓰기</a>            
							</div>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
        
    
</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>