<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>   


 <!-- Begin Page Content -->
     <div class="container-fluid">

         <!-- Page Heading -->
         <h1 class="h3 mb-4 text-gray-800">회원 관리</h1>
         
   <div class="card shadow mb-4">
     <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
     </div>
     <div class="card-body">
         <div class="table-responsive">
            	 <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
								<thead>
	                                  <tr>
	                                      <th>회원번호</th>
	                                      <th>아이디</th>
	                                      <th>이름</th>
	                                      <th>회원가입일</th>
	                                      <th>등급</th>
	                                      <th>결제만료일</th>
	                                  </tr>
                              </thead>
                              
                             
                 	</table>
                </div>
     
           </div>
     </div>
     
     
</div>
     <!-- /.container-fluid -->

 
 
 
 
 </div>
 <!-- End of Main Content -->


	<!-- Page level plugins -->
	<script src="${pageContext.request.contextPath}/res/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/res/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	 <!-- Page level custom scripts -->
	<script src="${pageContext.request.contextPath}/res/js/demo/datatables-demo.js"></script>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>