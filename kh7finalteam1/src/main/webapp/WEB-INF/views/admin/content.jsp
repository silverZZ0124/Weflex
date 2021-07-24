<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
    table#contentTable tbody tr:hover 
    {
        cursor:pointer;
    }
</style>

<!-- 컨텐츠 타입 이름 변경 (ex. kd->국내드라마) -->
<script>
	$(function(){
		
	});
</script>

<div class="container-fluid">

	<div class="container">
	    <div class="row justify-content-center">
	        <div class="col-md-6 text-center mb-3 mt-3">
	            <h2 class="heading-section">컨텐츠 리스트</h2>
	        </div>
	    </div>
	    
	    <div class="card shadow mb-4 row">
	        <div class="col-md-12">
	        	<div class="card-body">
	                <table class="table table-hover py-4" id="contentTable" style="width:100%">
	                    <thead>
	                        <tr>
	                            <th width="15%">컨텐츠 번호</th>
	                            <th>제목</th>
	                            <th>분류</th>
	                            <th>연령제한</th>
	                            <th width="15%">조회수</th>
	                        </tr>
	                    </thead>
	                </table>
                </div>
	        </div>
	    </div>
	</div>
</div>
<!-- /.container-fluid -->

<script src="${pageContext.request.contextPath}/res/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/res/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath}/res/js/demo/datatables-content.js"></script>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>