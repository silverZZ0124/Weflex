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
</style>
<%
%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<div class="container my-1">
	<div class="row">
		<table class="table">
			<thead>
				<tr class="table-active">
					<th scope="col" style="width: 60%">${noticeVo.noticeName}<br>
						${noticeVo.clientName}</th>
					<th scope="col" style="width: 40%" class="text-right">조회수 ${noticeVo.noticeViewCount}
						<br> ${noticeVo.noticeDate}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><pre>${noticeVo.noticeWrite}</pre></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>