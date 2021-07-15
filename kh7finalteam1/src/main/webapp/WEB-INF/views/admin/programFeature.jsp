<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<style>
	#linkeFeatureEdit:hover{
		background-color:lightgray;
	}
	.link-feature:hover{
		text-decoration:none;
		
	}
	.link-feature{
		display:block;
	}
	
</style>

    <!-- Begin Page Content -->
     <div class="container-fluid">

         <!-- Page Heading -->
         <div class="row">
         	<div class="col-md-10">
		        <h1 class="h3 mb-4 text-gray-800">새로운 프로그램 특징 입력</h1>
         	</div>
         	<div class="col-md-2 text-right">
		        <!-- <a href="FeatureEdit" class="btn btn-success">수정</a> -->
         	</div>
         </div>

         <div class="row mt-3">

             <div class="col-md-6">

                 <!-- Circle Buttons -->
                 <div class="card shadow mb-4">
                     <div class="card-header py-3">
                         <h6 class="m-0 font-weight-bold text-primary">프로그램 특징 입력</h6>
                     </div>
                     
                     <div class="card-body">
                     
                     	<!-- 프로그램 특징 입력 폼 -->
                    	<form action="insertFeature" method="get" class="form" id="featureForm">
                    		<div class="form-group">
                      			<label for="featureName">프로그램 특징 이름 :</label> 
                          		<input type="text" name="featureName" id="insert-featureName" class="form-control">
                        	</div>
	                         <div class="text-center">
	                         	<button class="btn btn-block btn-success">확인</button>
	                         </div>
                        </form>
                         
                     </div>
                 </div>
                 
                 <!-- 프로그램 특징 검색 -->
                 <div class="card shadow mb-4">
                     <div class="card-body mt-3 text-center">
                    	<form class="form row" id="Feature-search-form">
                    		<div class="form-group col-lg-9 col-sm-12">
                          		<input type="text" name="featureName" class="form-control" id="featureName" placeholder="검색어를 입력하세요">
                        	</div>
	                         <div class="form-group col-lg-3 col-md-12 ">
	                         	<input type="submit" value="검색" class="btn btn-success">
	                         </div>
                        </form>
                     </div>
                 </div>
                 
                 <!-- 프로그램 특징 검색 출력(ajax) -->
                 <div id="search-feature-card">
                 
                 </div>
                 
             </div>
             
             
             <!-- 등록된 프로그램 특징 출력 -->
             <div class="col-md-6">
	             <div class="card shadow mb-4">
	             	<div class="card-header py-3">
	                     <h6 class="m-0 font-weight-bold text-primary">등록된 프로그램 특징</h6>
	                </div>
	             	<div class="card-body" id="list-result">
	             		<ul>
	               		<c:forEach var="programFeatureDto" items="${featureList}">
				    		<li id="linkeFeatureEdit">
				    			<!-- 스크립트에서 href 경로 변경 -->
				    			<a href="featureEdit?featureName=${programFeatureDto.featureName}" class="link-feature">${programFeatureDto.featureName}</a>
				    		</li>
						</c:forEach>
						</ul>
	             	</div>
	             </div>
             </div>
                
         </div>

     </div>
     <!-- /.container-fluid -->
     
    
    
    <script>
		//중복된 값이 입력될 때 띄우는 경고창 (모달로 수정 예정)
		window.onload = function () {
			
			var FeatureForm = document.querySelector("#featureForm");
			FeatureForm.addEventListener("submit",function(event){
				
				var Feature = document.querySelector("#insert-featureName").value;
				console.log(Feature);
				<c:forEach var="programFeatureDto" items="${featureList}">
					if(Feature == "${programFeatureDto.featureName}"){
						window.alert("중복된 값이 존재합니다.");
						event.preventDefault();
					}
				</c:forEach>
				if(Feature.trim() == ""){
					event.preventDefault();
				}
				
			});
			
		};
		
    </script>
    
    <script>
    	$(function(){
    		
    		$("#insert-featureName").focus();
    		
    		//검색 내용 출력하는 ajax
    		$("#feature-search-form").submit(function(e){
    			e.preventDefault();
    			
    			var formdata = $(this).serialize();
				console.log(formdata);
    			
	    		$.ajax({
	    			url : "${pageContext.request.contextPath}/data/admin/searchFeature",
	    			type : "get",
	    			dataType : "json",
	    			data : formdata,
	    			success:function(resp){
	    				$("#search-feature-card").empty();
	    				
	    				var cardDiv = "";
	    				cardDiv += "<div class='card-header py-3'>";
	    				cardDiv += "<h6 class='m-0 font-weight-bold text-primary'>검색된 프로그램 특징</h6>";
	    				cardDiv += "</div>";
	    				cardDiv += "<div class='card shadow mb-4'>";
	    				cardDiv += "<div class='card-body' id='search-feature'>";
	    				cardDiv += "<ul id='search-list'>";
	    				cardDiv += "</ul>";
	    				cardDiv += "</div>";
	    				cardDiv += "</div>";
	    				$("#search-feature-card").append(cardDiv);
	    				
	    				
	    				for(var i=0; i < resp.length; i++){
	    					var content = "";
	    					content += "<li>";
	    					content += resp[i].featureName;
	    					content += "</li>";
	    	    			
	    					$("#search-list").append(content);
	    				}
	    				
					}
	    		});
    		});
    	});
    </script>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>