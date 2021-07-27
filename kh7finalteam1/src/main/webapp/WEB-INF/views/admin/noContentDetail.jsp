<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
	label{
		color:#141414;
	}
	.txt-bar{
		color:#ececec;
	}
	.text-gray-800{
		font-size:2rem !important;
	}
	.genreBox, .featureBox, .castBox{
		display:inline-block;
		background-color:lightgray;
		border-radius:5px;
		color:#141414;
	}
	.btn-close{
		background-color:lightgray;
		border:none;
	}
	.btn-close:hover{
		color:gray;
	}
</style>

<div class="container-fluid">
	
	
	<div class="row">
	    <div class="col-md-10 offset-md-1">
	
	        <div class="card shadow mb-4">
	        
	            <div class="card-header py-3">
	                <h6 class="m-0 font-weight-bold text-primary">컨텐츠 상세보기</h6>
	            </div>
	            
	            <div class="card-body row">
	            	<div class="thumnail-img col-md-6 text-left">
	            		<div style="position:relative">
		            		<img alt="${contentDto.contentName }" src="${contentDto.contentThumbnail }" style="width:100%;"><br>
		            		<img alt="${contentDto.contentName }" src="${contentDto.contentLogo }" style="width:40%; position:absolute; top:0; left:0; transform:translateY(100%);">
	            		</div>
	            		
	            	</div>
	            	
	            	<div class="col-md-6">
	            		<div class="mb-2">
		            		<span class="text-gray-800 mr-1">${contentDto.contentName }</span>
		            		<span class="txt-bar">|</span>
		            		<span class="ml-1 text-primary">${contentDto.contentRelease}&nbsp;개봉</span>
		            		<span class="txt-bar">|</span>
		            		<span class="ml-1 text-primary">${contentDto.contentLimit}세 이상</span>
		            		<span class="txt-bar">|</span>
		            		<span class="ml-1 text-primary">${noSeriesDto.contentPlaytime}분</span>
	            		</div>
	            		
	            		<dl>
	            		<dt>번호</dt> <dd>${contentDto.contentNo }</dd>
	            		
	            			<dt>타입</dt>
	            			<dd>
			            		<c:choose>
									<c:when test="${contentDto.contentType eq 'km'}"> 한국 영화 </c:when>
									<c:when test="${contentDto.contentType eq 'fm'}"> 외국 영화 </c:when>
									<c:when test="${contentDto.contentType eq 'kd'}"> 한국 드라마 </c:when>
									<c:when test="${contentDto.contentType eq 'fd'}"> 외국 드라마 </c:when>
									<c:when test="${contentDto.contentType eq 'co'}"> TV 예능 </c:when>
									<c:when test="${contentDto.contentType eq 'an'}"> 애니메이션  </c:when>
									<c:when test="${contentDto.contentType eq 'do'}"> 다큐멘터리 </c:when>
								</c:choose>
							</dd>
						
						
							<dt>장르</dt> 
							<dd>
								<c:forEach var="genreFeatureCastVO" items="${contentGenreList }" varStatus="status">
									<span>${genreFeatureCastVO.genreName}</span>
									<c:if test="${status.last eq false}">,</c:if>
								</c:forEach>
							</dd>
						
							<dt>특징</dt> 
							<dd>
								<c:forEach var="genreFeatureCastVO" items="${contentFeatureList }" varStatus="status">
									<span>${genreFeatureCastVO.featureName}</span>
									<c:if test="${status.last eq false}">,</c:if>
								</c:forEach>
							</dd>
							
							<dt>출연</dt> 
							<dd>
								<c:forEach var="genreFeatureCastVO" items="${contentCastList }" varStatus="status">
									<span>${genreFeatureCastVO.castName}</span>
									<c:if test="${status.last eq false}">,</c:if>
								</c:forEach>
							</dd>
						
							<dt>좋아요</dt><dd>${contentDto.contentLikes}</dd>
							<dt>조회수</dt><dd>${contentDto.contentViews}</dd>
					    </dl>
					    
					    
	            	</div>
	            	
                    <div class="col-md-6 offset-md-6 pt-3" >
                        <div class="row">
                            <div class="col-md-6 p-1">
                                <button type="button" class="btn btn-block btn-outline-primary" id="edit-content-btn" data-toggle="modal" data-target="#edit-content-modal">수정</button>
                            </div>
                            <div class="col-md-6 p-1">
                                <a href="contentDelete?contentNo=${contentDto.contentNo }" class="btn btn-block btn btn-outline-danger" id="delete-btn">삭제</a>
                            </div>
                        </div>
                    </div>
	            </div>             
	     	 </div>
	     	 
	     	 <div class="card shadow mb-4">
		     	 <div class="card-body px-3">
		     	 	<div class="text-primary mb-1" style="font-weight:bold">소개 </div>
		     	 	<div class="text-primary">${contentDto.contentInfo }</div>
		     	 </div>
	     	 </div>
	     
		     <div class="text-right mb-4">
		     	<a href="${pageContext.request.contextPath}/admin/content/" class="btn btn-secondary">목록으로</a>
		     </div>
	     </div>
	 </div>
	
	<!-- 수정 버튼 클릭시 수정 화면 모달창 -->
    <div class="modal fade" id="edit-content-modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">컨텐츠 수정</h4>
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <div class="modal-body">
                    <div class="conatiner-fluid">
                        <div class="row">
                        	<div class="col-md-12">
                        	
                            <form action="noContentEdit" method="post" class="form">	
								<input type="hidden" name="contentNo" value="${contentDto.contentNo}">
								<input type="hidden" name="contentNo" value="${noSeriesDto.contentNo}">
				                <div class="form-group">
				                    <label>컨텐츠명</label>
				                    <input type="text" name="contentName" class="form-control" value="${contentDto.contentName}">
				                </div>
				
				                <div class="form-group form-textarea">
				                    <label>컨텐츠 소개</label>
				                    <textarea name="contentInfo" class="form-control form-textarea">${contentDto.contentInfo}</textarea>
				                </div>
				
								<div class="form-group">
				                    <label>url</label>
				                    <input type="text" name="seriesPath" class="form-control" value="${noSeriesDto.seriesPath}">
				                </div>
				                
								<div class="form-group">
				                    <label>영상 길이(분)</label>
				                    <input type="text" name="contentPlaytime" class="form-control" value="${noSeriesDto.contentPlaytime}">
				                </div>
								
				                <div class="form-group">
				                    <label>연령제한</label>
				                    <select class="form-control" name="contentLimit" required>
				                      <option value="" >선택하세요</option>
				                      <option value="1">전체 이용가</option>
				                      <option value="12">12세 이용가</option>
				                      <option value="15">15세 이용가</option>
				                      <option value="19">19세 이용가</option>
				                    </select>
				                  </div>
				                  
				                  <div class="form-group">
				                    <label>컨텐츠 타입</label>
				                    <select class="form-control" name="contentType" required>
				                   	  <option value="" >선택하세요</option>
				                      <option value="km">국내 영화</option>
				                      <option value="fm">해외 영화</option>
				                      <option value="kd">국내 드라마</option>
				                      <option value="fd">해외 드라마</option>
				                      <option value="co">예능</option>
				                      <option value="an">애니메이션</option>
				                      <option value="do">다큐멘터리</option>
				                    </select>
				                  </div>
				                  
				                  <div class="form-group">
				                  	<label>장르</label>
				                  	<select class="form-control" name="contentGenre">
				                  		<option value="">선택하세요</option>
				                  		<c:forEach var="genreDto" items="${genreList }">
				                  			<option value="${genreDto.genreNo }">${genreDto.genreName }</option>
				                  		</c:forEach>
				                  	</select>
				                  </div>
				                  
				                  <div id="this-content-genre"></div>
				                  
				                  <div class="form-group">
				                  	<label>프로그램 특징</label>
				                  	<select class="form-control" name="contentFeature" >
				                  		<option value="">선택하세요</option>
				                  		<c:forEach var="programFeatureDto" items="${featureList }">
				                  			<option value="${programFeatureDto.featureNo }">${programFeatureDto.featureName }</option>
				                  		</c:forEach>
				                  	</select>
				                  </div>
				                  
				                  <div id="this-content-feature"></div>
				                  
				                  <div class="form-group">
				                    <label>출연진 추가</label>
				                    <input type="text" name="contentCast" class="form-control">
				                  </div>
				                  
				                  <div id="this-content-cast"></div>
				                  
								<div class="form-group">
				                    <label>개봉연도</label>
				                    <select class="form-control" name="contentRelease" required>
				                   	  <option value="" >선택하세요</option>
				                      <option>2021</option><option>2020</option><option>2019</option> <option>2018</option><option>2017</option>
				                      <option>2016</option><option>2015</option><option>2014</option><option>2013</option><option>2012</option> 
				                      <option>2011</option><option>2010</option><option>2009</option><option>2008</option><option>2007</option>
				                      <option>2006</option><option>2005</option><option>2004</option><option>2003</option><option>2002</option>
				                      <option>2001</option><option>2000</option><option>1999</option><option>1998</option><option>1997</option>
				                      <option>1996</option><option>1995</option>
				                    </select>
				                  </div>
				
				                 <div class="form-group">
				                    <label>컨텐츠 로고</label>
				                    <input type="text" name="contentLogo" class="form-control" value="${contentDto.contentLogo}">
				                </div>
				
				                <div class="form-group">
				                    <label>컨텐츠 썸네일</label>
				                    <input type="text" name="contentThumbnail" class="form-control" value="${contentDto.contentThumbnail}">
				                </div>
				                <div class="modal-footer">
				                    <button type="submit" class="btn btn-primary" id="noContent-edit">확인</button>                        
				                    <button class="btn btn-danger" data-dismiss="modal">취소</button>
				                </div>
				            </form>
				            
                        </div>
                    </div>                    
                </div>


            	</div>
        	</div>
   	 	</div>
	</div>
</div>
<!-- /.container-fluid -->

<script>
	
	$(function(){
		$('select[name="contentLimit"]').find('option[value="${contentDto.contentLimit}"]').attr("selected",true);
		$('select[name="contentType"]').find('option[value="${contentDto.contentType}"]').attr("selected",true);
		$('select[name="contentRelease"]').find('option:contains("${contentDto.contentRelease}")').attr("selected",true);
		
		$("#edit-content-btn").click(function(){
			//다시 불러올 때 비웠다가 불러오기
			$("#this-content-genre").empty();
			$("#this-content-feature").empty();
			$("#this-content-cast").empty();
			
			$("select[name='contentGenre'] option").prop('disabled',false);
			$("select[name='contentFeature'] option").prop('disabled',false);
			
			$("select[name='contentFeature'] option:eq(0)").prop("selected",true);
			$("select[name='contentGenre'] option:eq(0)").prop("selected",true);
			$("input[name='contentCast']").val("");
			
			var contentGenreList = '<c:out value="${contentGenreList}"/>';
			if(!contentGenreList){
				$("#this-content-genre").addClass("mb-3");
			}
			
			var contentFeatureList = '<c:out value="${contentFeatureList}"/>';
			if(!contentFeatureList){
				$("#this-content-feature").addClass("mb-3");
			}
			
			var contentGenreList = '<c:out value="${contentCastList}"/>';
			if(!contentGenreList){
				$("#this-content-cast").addClass("mb-3");
			}
			
			/* input type="hidden" name 통일하여 컨트롤러로 배열 값 전달  */
			<c:forEach var="genreFeatureCastVO" items="${contentGenreList }">
				$("#this-content-genre").append("<span class='genreBox p-2 mr-2 mb-2'><input name='genreNo' type='hidden' value='${genreFeatureCastVO.genreNo}'>${genreFeatureCastVO.genreName}<button class='btn-close'>&times;</button></span>");
				$("select[name='contentGenre'] option[value*='${genreFeatureCastVO.genreNo}']").prop('disabled',true);
			</c:forEach>
			
			<c:forEach var="genreFeatureCastVO" items="${contentFeatureList }">
				$("#this-content-feature").append("<span class='featureBox p-2 mr-2 mb-2'><input name='featureNo' type='hidden' value='${genreFeatureCastVO.featureNo}'>${genreFeatureCastVO.featureName}<button class='btn-close'>&times;</button></span>");
				$("select[name='contentFeature'] option[value*='${genreFeatureCastVO.featureNo}']").prop('disabled',true);
			</c:forEach>
			
			<c:forEach var="genreFeatureCastVO" items="${contentCastList }">
				$("#this-content-cast").append("<span class='castBox p-2 mr-2 mb-2'><input name='castName' type='hidden' value='${genreFeatureCastVO.castName}'>${genreFeatureCastVO.castName}<button class='btn-close'>&times;</button></span>");
			</c:forEach>
		});
		
		
		$("select[name='contentGenre']").change(function(){
			var selectedGenreName = $("select[name='contentGenre'] option:checked").text();
			var selectedGenreNo = $(this).val();
			console.log(selectedGenreNo);
            
			var genreDiv = "";
			genreDiv += "<span class='genreBox p-2 mr-2 mb-2'>";
			genreDiv += selectedGenreName;
			genreDiv += '<input type="hidden" name="genreNo" value="'+selectedGenreNo+'">';
			genreDiv += "<button class='btn-close'>&times;</button></span>";
			$("#this-content-genre").append(genreDiv);
			
			$("select[name='contentGenre'] option[value*='"+selectedGenreNo+"']").prop('disabled',true);
			
		});
		
		$("select[name='contentFeature']").change(function(){
			var selectedFeatureName = $("select[name='contentFeature'] option:checked").text();
			var selectedFeatureNo = $(this).val();
			
			var featureDiv = "";
			featureDiv += "<span class='featureBox p-2 mr-2 mb-2'>";
			featureDiv += selectedFeatureName;
			featureDiv += '<input type="hidden" name="featureNo" value="'+selectedFeatureNo+'">';
			featureDiv += "<button class='btn-close'>&times;</button></span>";
			$("#this-content-feature").append(featureDiv);
			
			$("select[name='contentFeature'] option[value*='"+selectedFeatureNo+"']").prop('disabled',true);
			
		});
		
		$("input[name='contentCast']").keydown(function(key) {
        	if (key.keyCode == 13) {
           		event.preventDefault();
				var castName = $(this).val();

				var castList = $(".castBox");
				
				for(var i=0; i<castList.length; i++){
					var cast = castList[i].innerText.replace('×', '');
					//console.log(cast);
					if(castName == cast){
						//console.log(cast);
						$(this).val("");
						return false;
					}
				}
				
	            var castDiv = "";
				castDiv += "<span class='castBox p-2 mr-2 mb-2'>";
				castDiv += castName;
				castDiv += '<input type="hidden" name="castName" value="'+castName+'">';
				castDiv += "<button class='btn-close'>&times;</button></span>";
				$("#this-content-cast").append(castDiv);
				
				$(this).val("");
        	}
		});
		
		
		$("#noContent-edit").click(function(e){
			/* 
				장르, 특징, 배우가 입력 되었는지 검사.  
				아무것도 없으면 입력하라는 메세지
			*/
			if($("#this-content-genre").children().length == 0){
				window.alert("장르를 입력하세요");
				$("select[name='contentGenre']").focus();
				e.preventDefault();
			}
			else if($("#this-content-feature").children().length == 0){
				window.alert("특징을 입력하세요");
				$("select[name='contentFeature']").focus();
				e.preventDefault();
			}
			else if($("#this-content-cast").children().length == 0){
				window.alert("배우를 입력하세요");
				$("input[name='contentCast']").focus();
				e.preventDefault();
			}
			
			
			/* 수정 값 유효성 검사 */
			var contentName = $("input[name='contentName']").val();
			var contentInfo = $("textarea[name='contentInfo']").val();
			var seriesPath = $("input[name='seriesPath']").val();
			var contentPlaytime = $("input[name='contentPlaytime']").val();
			var contentLogo = $("input[name='contentLogo']").val();
			var contentThumbnail = $("input[name='contentThumbnail']").val();
			
			//console.log(contentName.length);
			if(contentName.length == 0 || contentName.length>50){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("input[name='contentName']").val("");
				$("input[name='contentName']").focus();
				e.preventDefault();
			}
			else if(contentInfo.length == 0 || contentInfo.length>300){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("textarea[name='contentInfo']").val("");
				$("textarea[name='contentInfo']").focus();
				e.preventDefault();
			}
			else if(seriesPath.length == 0 || seriesPath.length>500){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("input[name='seriesPath']").val("");
				$("input[name='seriesPath']").focus();
				e.preventDefault();
			}
			else if(contentPlaytime.length == 0 || contentPlaytime.length>3){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("input[name='contentPlaytime']").val("");
				$("input[name='contentPlaytime']").focus();
				e.preventDefault();
			}
			else if(contentLogo.length == 0 || contentLogo.length>500){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("input[name='contentLogo']").val("");
				$("input[name='contentLogo']").focus();
				e.preventDefault();
			}
			else if(contentThumbnail.length == 0 || contentThumbnail.length>500){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("input[name='contentThumbnail']").val("");
				$("input[name='contentThumbnail']").focus();
				e.preventDefault();
			}
		});

	});
</script>
<script>
	$(function(){
		$(document).on("click",".btn-close",function(e){
			e.preventDefault();
			$(this).parents("span").remove();
		});
		
	});
</script>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>