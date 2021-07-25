<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.finalteam1.entity.NoticeVo"%>
<%@page import="java.util.ArrayList"%>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>

	
<%
	NoticeVo[] list = new NoticeVo[10]; // 리스트 정보
	
	for(int i = 0; i < 8; i++) {
		list[i].setNoticeNo(i + 1);
		list[i].setClientNo(i);
		list[i].setNoticeName("샘플 공지사항" + (i+1) + "번");
		list[i].setNoticeWrite("asdfasdfasdfasdfsafasfdafsadf" + i + i+ i+ i+ i+ i);
		list[i].setNoticeViewCount(10 + 44 * i);
	}
	//페이지 번호
	int pageNo;
	
	try {
		pageNo = Integer.parseInt(request.getParameter("pageNo"));
		if(pageNo < 1) throw new Exception();
	}
	catch (Exception e) {
		pageNo = 1;
	}
	
	// 한 페이지 글 개수
	int pageSize;
	try {
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
		if(pageSize < 10) throw new Exception();
	}
	catch (Exception e) {
		pageSize = 10;
	}
	
	// 시작과 끝번호
	int startRow = pageNo * pageSize - (pageSize - 1);
	int endRow = pageNo * pageSize;
	
	// 페이지 네비게이션 영역 계산
	int count = list.length;
	
	int blockSize = 10;
	
	int lastBlock = (count + pageSize - 1) / pageSize;
	
	int startBlock = (pageNo - 1) / blockSize * blockSize + 1;
	int endBlock = startBlock + blockSize - 1;
	
	if(endBlock > lastBlock) // 범위를 벗어나면
		endBlock = lastBlock;
	
%>

<script>
	$(function(){
		$(".pagination > a").click(function(){
			var pageNo = $(this).text();
			
			if(pageNo == "이전") {
				pageNo = parseInt($(".pagination > a:not(.move-link)").first().text()) - 1;
				$("input[name=pageNo]").val(pageNo);
			}	
			else if(pageNo == "다음") {
				pageNo = parseInt($(".pagination > a:not(.move-link)").last().text()) + 1;
				$("input[name=pageNo]").val(pageNo);
			}
			else {
				$("input[name=pageNo]").val(pageNo);
			}
		});
	});
</script>

<div class="row">
	<table class="table table-border table-hover">
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th width="40%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th width="10%">조회</th>
			</tr>
		</thead>

		<tbody>
			<%for(NoticeVo noticeVo : list) { %>
				<tr>
					<td><%=noticeVo.getNoticeNo() %></td>
					<td align=left>
						<a href="/noticeDetail?noticeNo=<%=noticeVo.getNoticeNo()%>">
							<%=noticeVo.getNoticeName() %>
						</a>
					</td>
					<td><%=noticeVo.getClientNo() %></td>
					<td><%=noticeVo.getNoticeDate() %></td>
					<td><%=noticeVo.getNoticeViewCount() %></td>
				</tr>
			<%} %>
		</tbody>
	</table>
</div>



<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>