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
                     
                     	<form class="form" action ="genreEditComplete" method="post" id="genreForm" >
                    		<div class="form-group">
                    			<p id="change-input"></p>
                    			<input type="hidden" name="genreName" class="form-control" id="genre-input">
                          		<input type="text" name="newGenreName" class="form-control" id="new-genre-input">
                        	</div>
	                         <div class="form-group">
	                         	<input type="submit" value="수정" class="btn btn-block btn-light">
	                         </div>
                        </form>
                        
                        <!-- 클릭시 스크립트에서 주소 변경해줌 -->
						<a href="#" class="btn btn-block btn-outline-danger" id="delete-btn">삭제</a>
		             </div>             
		         </div>
		         
		         <div class="text-right mb-4">
		         	<a href="genre" class="btn btn-secondary">취소</a>
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
                        <button class="close" data-dismiss="modal">&times;</button>
                        <div class="conatiner-fluid">
                            <div class="row">
                                <div class="col" id="input-modal-content">#</div>
                            </div>
                        </div>                    
                    </div>

                    <div class="modal-footer row"> 
                        <div class="col-md-3 offset-md-9">   
                        <button class="btn btn-secondary btn-block" data-dismiss="modal">확인</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
     </div>
     <!-- /.container-fluid -->
     
     
     <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
     <script>
        $(function(){
        	
        	 var param = '<c:out value="${editGenreName}" />';
        	 console.log(param);
        	 
        	 $("#change-input").html(param).hide();
        	 
        	 var change = $("#change-input").text();
        	 console.log(change);
        	 
        	 $("#genre-input").val(change);
        	 $("#new-genre-input").val(change);
        	
        	//삭제 버튼 눌렀을 때, 기존 값과 비교 후 진행
           $("#delete-btn").click(function(){
           		var param = $("#new-genre-input").val();
                console.log(param);
                
                var encodeParam = encodeURIComponent(param);
                
                <c:forEach var="genreDto" items="${genreList}">
					if(param == "${genreDto.genreName}"){
						$("#delete-btn").attr("href", "genreDelete?genreName="+encodeParam);
						return;
					}
				</c:forEach>
				$("#input-modal-content").text("존재하지 않는 값입니다.");
				$('#insert-genre-modal').modal('show');
           });
        });
    </script>
    
     <script>
	   // (모달로 수정 예정)
		window.onload = function () {
		   
     		console.log($("#new-genre-input").val());
		   
     		//중복된 값이 입력될 때 띄우는 경고창
			var genreForm = document.querySelector("#genreForm");
			genreForm.addEventListener("submit",function(event){
				
				var genre = document.querySelector("#new-genre-input").value;
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
     

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>