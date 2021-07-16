<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>


<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">컨텐츠 목록</h1>

    <div class="row mt-3">
        <div class="col-md-12">

            <div class="card shadow mb-4">
            
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">제목 머라고 쓰지</h6>
                </div>
                
                <div class="card-body ">
                
                	<!-- 검색창 -->
                	<div></div>
                	
                	<!-- 컨텐츠 내역  -->
                	<table class="table">
					    <thead class="thead-light">
					      <tr>
					        <th scope="col">#</th>
					        <th scope="col">First</th>
					        <th scope="col">Last</th>
					        <th scope="col">Handle</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <th scope="row">1</th>
					        <td>Mark</td>
					        <td>Otto</td>
					        <td>@mdo</td>
					      </tr>
					      <tr>
					        <th scope="row">2</th>
					        <td>Jacob</td>
					        <td>Thornton</td>
					        <td>@fat</td>
					      </tr>
					      <tr>
					        <th scope="row">3</th>
					        <td>Larry</td>
					        <td>the Bird</td>
					        <td>@twitter</td>
					      </tr>
					    </tbody>
					</table>
                   
          		</div> <!-- end of card-body -->             
      		</div> <!-- end of card -->     
      
      		<div class="text-right mb-4">
      			<a href="feature" class="btn btn-primary">취소</a>
      		</div>
        </div>
    </div>
    
</div>
<!-- /.container-fluid -->


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>