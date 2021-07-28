<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.finalteam1.vo.NoticeVo"%>
<%@page import="java.util.ArrayList"%>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>

           
<%
	request.setCharacterEncoding("UTF-8");
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	
	//NoticeVo noticeVo = 
	NoticeVo noticeVo;
	
	Integer clientNo = (Integer)session.getAttribute("clientNo");
	String root = request.getContextPath();
	
	String title = "답변하기";
%>
<style>
	th {
		width:15%;
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<div class="main">
	<div class="header">
		<div class="row">
			<span class="title">제목</span>
		</div>
				
		<div class="row">
			<span class="path"><a class="imgArea" href="<%=root %>"><img alt="home" src="<%=root %>/image/home.png"></a> > 열린 공간 > 질문 답변</span>
		</div>
	</div>
	
	<form action="boardAnswer.kh" method="post">
		<input type="hidden" name="noticeNo" value="<%=noticeNo%>">
		<table class="table table-border table-hover board-table">
			<tbody>
				<tr>
					<th>작성자</th>
					<td>
<<<<<<< HEAD
						<%--
						<p><%=noticeVo.clientDto.getClientName()%></p>
						--%>
=======
						<%-- <p><%=noticeVo.clientDto.getClientName()%></p> --%>
>>>>>>> refs/remotes/origin/main
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<textarea name="answerContent" rows="15" maxlength="4000" class="board-write-area" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="row text-right">
			<button class="board-btn">등록</button>
			<a href="qnaDetail.jsp?noticeNo=<%=noticeNo %>" class="link-btn">취소</a>
		</div>
	</form>
</div>