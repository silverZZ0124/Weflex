<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<style>
	.card-body{
		color:#141414 !important;
	}
	.link-genre:hover{
		color:#d10914;
		
	}
	.link-genre{
		color:#141414;
		display:block;
	}
	
</style>

    <!-- Begin Page Content -->
     <div class="container-fluid">

         <!-- Page Heading -->
         <div class="row">
         	<div class="col-md-10">
		        <h1 class="h3 mb-4 text-gray-800">새로운 장르 입력</h1>
         	</div>
         	<div class="col-md-2 text-right">
		        <!-- <a href="genreEdit" class="btn btn-success">수정</a> -->
         	</div>
         </div>

         <div class="row mt-3">

             <div class="col-md-6">

                 <!-- Circle Buttons -->
                 <div class="card shadow mb-4">
                     <div class="card-header py-3">
                         <h6 class="m-0 font-weight-bold text-primary">장르 입력</h6>
                     </div>
                     
                     <div class="card-body">
                     
                     	<!-- 신규 장르 입력 폼 -->
                    	<form action="insertGenre" method="get" class="form" id="genreForm">
                    		<div class="form-group">
                      			<label for="genreName">장르 이름 :</label> 
                          		<input type="text" name="genreName" id="insert-genreName" class="form-control input-sm">
                        	</div>
	                         <div class="text-center">
	                         	<button class="btn btn-block btn-danger">확인</button>
	                         </div>
                        </form>
                         
                     </div>
                 </div>
                 
                 <!-- 장르 검색 -->
                 <div class="card shadow mb-4">
                     <div class="card-body mt-3 text-center">
                    	<form class="form row" id="genre-search-form">
                    		<div class="form-group col-lg-9 col-sm-12">
                          		<input type="text" name="genreName" class="form-control" id="genreName" placeholder="검색어를 입력하세요">
                        	</div>
	                         <div class="form-group col-lg-3 col-md-12 ">
	                         	<input type="submit" value="검색" class="btn btn-danger">
	                         </div>
                        </form>
                     </div>
                 </div>
                 
                 <!-- 장르 검색 출력(ajax) -->
                 <div id="search-genre-card">
                 
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
				    		<li id="linkeGenreEdit">
				    			<!-- 스크립트에서 href 경로 변경 -->
				    			<a href="#" class="link-genre">${genreDto.genreName}</a>
				    		</li>
						</c:forEach>
						</ul>
	             	</div>
	             </div>
             </div>
                
         </div>
		
		<!-- 중복된 값이거나 값이 없을때 입력될 때 띄우는 모달창 -->
        <div class="modal fade" id="insert-genre-modal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    
                    <div class="modal-header">
                        <h4 class="modal-title">입력 오류</h4>
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <div class="modal-body">
                        <div class="conatiner-fluid">
                            <div class="row">
                                <div class="col" id="input-modal-content">#</div>
                            </div>
                        </div>                    
                    </div>

                    <div class="modal-footer"> 
                        <div class="col-md-3 offset-md-9">   
                        <button class="btn btn-secondary btn-block" data-dismiss="modal">확인</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
	 </div>
	 <!-- /.container-fluid -->
     
    
    
    <script>
		//값 입력시 중복값 존재하는지 검사
		window.onload = function () {
			var genreForm = document.querySelector("#genreForm");
			genreForm.addEventListener("submit",function(event){
				
				var genre = document.querySelector("#insert-genreName").value;
				console.log(genre);
				<c:forEach var="genreDto" items="${genreList}">
					if(genre == "${genreDto.genreName}"){
						$("#input-modal-content").text("중복된 값이 존재합니다.");
						$('#insert-genre-modal').modal('show');
						event.preventDefault();
					}
				</c:forEach>
				if(genre.trim() == ""){
					$("#input-modal-content").text("값을 입력하세요.");
					$('#insert-genre-modal').modal('show');
					event.preventDefault();
				}
				
			});
			
		};
		
    </script>
    
    <script>
    	$(function(){
    		
    		$("#insert-genreName").focus();
    		
    		//검색 내용 출력하는 ajax
    		$("#genre-search-form").submit(function(e){
    			e.preventDefault();
    			
    			var formdata = $(this).serialize();
				//console.log(formdata);
    			
	    		$.ajax({
	    			url : "${pageContext.request.contextPath}/data/admin/searchGenre",
	    			type : "get",
	    			dataType : "json",
	    			data : formdata,
	    			success:function(resp){
	    				$("#search-genre-card").empty();
	    				
	    				var cardDiv = "";
	    				cardDiv += "<div class='card-header py-3'>";
	    				cardDiv += "<h6 class='m-0 font-weight-bold text-primary'>검색된 장르</h6>";
	    				cardDiv += "</div>";
	    				cardDiv += "<div class='card shadow mb-4'>";
	    				cardDiv += "<div class='card-body' id='search-genre'>";
	    				cardDiv += "<ul id='search-list'>";
	    				cardDiv += "</ul>";
	    				cardDiv += "</div>";
	    				cardDiv += "</div>";
	    				$("#search-genre-card").append(cardDiv);
	    				
	    				if(resp.length == 0){
	    					var content = "<li>없음</li>";
	    					$("#search-list").append(content);
	    				}
	    				else{
		    				for(var i=0; i < resp.length; i++){
		    					var content = "";
		    					content += "<li>";
		    					content += resp[i].genreName;
		    					content += "</li>";
		    	    			
		    					$("#search-list").append(content);
		    				}
	    				}
					}
	    		});
    		});
    	});
    </script>
    
    <script>
    	$(function(){
    		$(".link-genre").click(function(){
    			var param = $(this).text();
    			console.log(param);
    			var encodeParam = encodeURIComponent(param);
    			console.log(encodeParam); 
    			$(this).attr("href", "genreEdit?genreName="+encodeParam);
    		});
    	});
    </script>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>