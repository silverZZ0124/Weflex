<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- Begin Page Content -->
     <div class="container-fluid">

         <!-- Page Heading -->
         <h1 class="h3 mb-4 text-gray-800">새로운 장르 입력</h1>

         <div class="row mt-3">

             <div class="col-md-6">

                 <!-- Circle Buttons -->
                 <div class="card shadow mb-4">
                     <div class="card-header py-3">
                         <h6 class="m-0 font-weight-bold text-primary">장르 입력</h6>
                     </div>
                     
                     <div class="card-body">
                     
                    	<form action="insertGenre" method="get" class="form">
                    		<div class="form-group">
                      			<label for="genreName">장르 이름 :</label> 
                          		<input type="text" name="genreName" id="genreName" class="form-control input-sm">
                        	</div>
	                         <div class="text-center">
	                         	<input type="submit" value="확인" class="btn btn-block btn-success">
	                         </div>
                        </form>
                         
                     </div>
                 </div>
                 
                 <!-- 장르 검색 -->
                 <div class="card shadow mb-4">
                     <div class="card-body mt-3">
                    	<form action="searchGenre" method="get" class="form row">
                    		<div class="form-group col-9">
                          		<input type="text" name="searchGenreName" class="form-control">
                        	</div>
	                         <div class="col-3">
	                         	<input type="submit" value="검색" class="btn btn-success">
	                         </div>
                        </form>
                     </div>
                 </div>
                 
                 <!-- 장르 검색 출력(ajax) -->
                 <div class="card shadow mb-4">
                     <div class="card-body" id="search-genre">
                    	<ul id="search-list">
                    	</ul>
                     </div>
                 </div>
                 
             </div>
             
             
             <!-- 등록된 장르 출력 -->
             <div class="col-md-6">
	             <div class="card shadow mb-4">
	             	<div class="card-header py-3">
	                     <h6 class="m-0 font-weight-bold text-primary">등록된 장르</h6>
	                </div>
	             	<div class="card-body" id="list-result">
	             		<ul class="genrelist">
	               		<c:forEach var="genreDto" items="${genreList}">
				    	<li>${genreDto.genreName}</li>
						</c:forEach>
						</ul>
	             	</div>
	             </div>
             </div>
                
         </div>

     </div>
     <!-- /.container-fluid -->
     
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script>
    	$(function(){
    		$("#search-btn").submit(function(e){
    			e.preventDefault();
    			
    			var formdata = $(this).serialize();
				console.log(formdata);
    			
	    		$.ajax({
	    			url : "${pageContext.request.contextPath}/data/admin/searchGenre",
	    			type : "get",
	    			dataType : "json",
	    			data : formdata,
	    			success:function(resp){
	    				$("#search-list").empty();
	    				
	    				for(var i=0; i < resp.length; i++){
	    					var searchLi = $("li");
	    					var searchContent = $("<h5>").text(resp[i].genreName);
	    					
	    					searchLi.append(searchContent);
		    				$("#search-list").append(searchLi);
	    	    			
	    				}
	    				
					}
	    		});
    		});
    	});
    </script>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>