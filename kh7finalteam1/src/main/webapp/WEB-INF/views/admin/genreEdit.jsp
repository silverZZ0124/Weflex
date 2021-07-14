<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Begin Page Content -->
     <div class="container-fluid">

         <!-- Page Heading -->
         <h1 class="h3 mb-4 text-gray-800">장르 수정</h1>

         <div class="row mt-3">
             <div class="col-md-6">

                 <div class="card shadow mb-4">
                 
                     <div class="card-header py-3">
                         <h6 class="m-0 font-weight-bold text-primary">수정할 장르</h6>
                     </div>
                     
                     <div class="card-body ">
                     
                     	<form class="form" action ="editGenre" method="get" id="genreForm">
                    		<div class="form-group">
                          		<input type="text" name="genreName" class="form-control" id="genre-input" value="${editGenreName}">
                        	</div>
	                         <div class="form-group">
	                         	<input type="submit" value="수정" class="btn btn-block btn-success">
	                         </div>
                        </form>
                        <%-- <a href="genreDelete?genreName=${editGenreName}" class="btn btn-block btn-danger">삭제</a> --%>
						<a href="#" class="btn btn-block btn-danger" id="delete-btn">삭제</a>
		             </div>             
		         </div>
             </div>
         </div>
     </div>
     <!-- /.container-fluid -->
     
     
     <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
     <script>
        $(function(){
           $("#delete-btn").click(function(){
           		var insertValue = $("#genre-input").val();
                console.log(insertValue);
                
                <c:forEach var="genreDto" items="${genreList}">
					if(insertValue == "${genreDto.genreName}"){
						$("#delete-btn").attr("href", "genreDelete?genreName="+insertValue);
						return;
					}
				</c:forEach>
				window.alert("존재하지 않는 값입니다.");
           });
        });
    </script>
    
     <script>
	   // (모달로 수정 예정)
		window.onload = function () {
		   
     		console.log($("#genre-input").val());
		   
     		//중복된 값이 입력될 때 띄우는 경고창
			var genreForm = document.querySelector("#genreForm");
			genreForm.addEventListener("submit",function(event){
				
				var genre = document.querySelector("#genre-input").value;
				console.log(genre);
				<c:forEach var="genreDto" items="${genreList}">
					if(genre == "${genreDto.genreName}"){
						window.alert("중복된 값이 존재합니다.");
						event.preventDefault();
					}
				</c:forEach>
				if(genre.trim() == ""){
					window.alert("값을 입력하세요.");
					event.preventDefault();
				}
				
			});
			
		};
     </script>
     

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>