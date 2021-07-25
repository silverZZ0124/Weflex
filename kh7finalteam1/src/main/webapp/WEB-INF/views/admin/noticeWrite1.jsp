	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.finalteam1.entity.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<% %>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%int clientNo = (int)request.getAttribute("noticeList");%>
<style>
	th {
		width:15%;
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	// 높이 자동 설정
	function resize(obj) {
			obj.style.height = "1px";
			obj.style.height = (12+obj.scrollHeight)+"px";
	}
</script>

<div class="main">
	
	<form action="boardAnswer.kh" method="post">
		<input type="hidden" name="noticeNo" value="<%=clientNo%>">
		<table class="table table-border table-hover board-table">
			<tbody>
				<tr>
					<th>작성자</th>
					<td>
						<p><%=clientNo%></p>
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<textarea name="answerContent" rows="15" maxlength="3000" class="board-write-area" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="row text-right">
			<button class="board-btn">등록</button>
			<a href="/notice" class="link-btn">취소</a>
		</div>
	</form>
</div>