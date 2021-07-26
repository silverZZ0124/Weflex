<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<style>
	.btn-lab, .genre-add, .feature-add{
	cursor: pointer;
	}
	
	input[type=checkbox]{
		margin-right:0.5rem;
	}
	
	input[type=checkbox]:checked + label {
   color: #4e73df;
	}
	
	.category-ul{
	padding-inline-start: 1rem;
	}
	
	.category-li{
	list-style-type: none;
	}

</style>
<script>
	$(function() {
		$("#regist-form").submit(function(e) {//체크를 하나도 안했을 경우 데이터 전송 막음!!
			
			var genre = $(".genre-add:checked").is(":checked");//체크 유무
			var feature = $(".feature-add:checked").is(":checked");//체크 유무
			
			console.log(genre);
			console.log(feature);
			
			if(!genre || !feature){//둘중 하나라도 체크를 하나도 안했으면 데이터 전송을 막음!!!
				e.preventDefault();
				$("#myModal").modal("show");
			}
		});
		
	});

</script>

<!-- Begin Page Content -->
	<div class="container-fluid">
         <!-- Page Heading -->
         <div class="row">
         
         	 <div class="col-md-6">
	             <div class="card shadow mb-4">
	             	<div class="card-header py-3">
	                     <h6 class="m-0 font-weight-bold text-dark">장르 등록</h6>
	                </div>
	             	<div class="card-body" id="list-result" >
					<form action="genreFeatureRegist" method="post" id="regist-form">
	             		<ul class="category-ul" style="overflow-y: scroll; height:550px;">
	               		<c:forEach var="genreDto" items="${genreList}">
				    		<li class="category-li">
				    			<input type="checkbox" name="genreNo" value="${genreDto.genreNo}" class="genre-add"  id="genre-${genreDto.genreNo}">
				    			<label class="btn-lab" for="genre-${genreDto.genreNo}">${genreDto.genreName}</label>
				    		</li>
						</c:forEach>

						</ul>
				
	             	</div>
	             </div>
             </div>
         
         	<div class="col-md-6">
	             <div class="card shadow mb-4">
	             	<div class="card-header py-3">
	                     <h6 class="m-0 font-weight-bold text-primary">특징 등록</h6>
	                </div>
	             	<div class="card-body" id="list-result">
	             		<ul class="category-ul" style="overflow-y: scroll; height:550px;">
	               		<c:forEach var="featureDto" items="${featureList}">
				    		<li class="category-li">
				    				<input type="checkbox" name="featureNo" value="${featureDto.featureNo}" class="feature-add" id="feature-${featureDto.featureNo}">
				    				<label class="btn-lab" for="feature-${featureDto.featureNo}">${featureDto.featureName}</label>
				    		</li>
						</c:forEach>
						</ul>
	             	</div>
	             </div>
             </div>
                <div class="text-center" style="width: 100%">
							<button type="submit" class="btn btn-success">등록</button>
							<button type="reset" class="btn btn-secondary">초기화</button>
				</div>
				</form>
 
                
         </div>
      </div>
      
      <!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">체크해주세요</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        장르와 특징을 체크해주세요!!
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
		      </div>
		
		    </div>
		  </div>
		</div>
      
         
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>