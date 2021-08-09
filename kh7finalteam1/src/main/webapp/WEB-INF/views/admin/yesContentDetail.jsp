<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<style>
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
	.genre-btn-close, .feature-btn-close, .cast-btn-close{
		background-color:lightgray;
		border:none;
	}
	.genre-btn-close:hover, .feature-btn-close:hover, .cast-btn-close:hover{
		color:gray;
	}
	label{
		color:#141414;
	}
</style>

<div class="container-fluid">
	
	
	<div class="row">
	    <div class="col-md-10 offset-md-1">
	
	        <div class="card shadow mb-4">
	        
	            <div class="card-header py-3" >
	            	<div>
	                	<h6 class="m-0 font-weight-bold text-primary">컨텐츠 상세보기</h6>
	                </div>
	            </div>
	            
	            <div class="card-body row">
	            	<div class="thumnail-img col-md-6 text-left">
	            		<div style="position:relative">
		            		<img alt="${contentDto.contentName }" src="${contentDto.contentThumbnail }" style="width:100%;"><br>
		            		
	            		</div>
	            		
	            	</div>
	            	
	            	<div class="col-md-6">
	            		<div class="mb-2">
		            		<span class="text-gray-800 mr-1">${contentDto.contentName }</span>
		            		<span class="txt-bar">|</span>
		            		<span class="ml-1 text-primary">${contentDto.contentRelease}&nbsp;개봉</span>
		            		<span class="txt-bar">|</span>
		            		<span class="ml-1 text-primary">${contentDto.contentLimit}세 이상</span>
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
						
							<c:if test="${not empty contentGenreList }">
								<dt>장르</dt> 
								<dd>
									<c:forEach var="genreFeatureCastVO" items="${contentGenreList }" varStatus="status">
										<span>${genreFeatureCastVO.genreName}</span>
										<c:if test="${status.last eq false}">,</c:if>
									</c:forEach>
								</dd>
							</c:if>
						
							<c:if test="${not empty contentFeatureList }">
								<dt>특징</dt> 
								<dd>
									<c:forEach var="genreFeatureCastVO" items="${contentFeatureList }" varStatus="status">
										<span>${genreFeatureCastVO.featureName}</span>
										<c:if test="${status.last eq false}">,</c:if>
									</c:forEach>
								</dd>
							</c:if>
							
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
	            	
                    <div class="col-md-6 offset-md-6 pt-3">
                        <div class="row">
                            <div class="col-md-6 p-1">
                                <button type="button" class="btn btn-block btn-outline-danger" id="edit-content-btn" data-toggle="modal" data-target="#edit-content-modal">수정</button>
                            </div>
                            <div class="col-md-6 p-1">
                                <a href="contentDelete?contentNo=${contentDto.contentNo }" class="btn btn-block btn btn-outline-secondary delete-btn">삭제</a>
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
	     
   	 		
	     	 <div class="card shadow mb-4">
	     	 	<div class="card-header">
	     	 		<div class="row">
		     	 		<div class="col-md-4 dropdown pb-2">
							  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
							    시즌 1
							  </a>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							  	<c:forEach var="seasonSize" items="${seasonSize }">
								    <li class="dropdown-item ">시즌 ${seasonSize }</li>							  	
							  	</c:forEach>
							  </ul>
		     	 		</div>
		                <div class="col-md-2 offset-md-6 pt-3 col-sm-12 offset-sm-0">
		                	<button class="btn btn-block btn-danger" data-toggle="modal" data-target="#insert-episode-modal">에피소드 추가</button>
		                </div>
	                </div>
	            </div>
	            <div class="card-body row">
	            	<table class="table" style="color:#141414;">
	            		<thead>
		            		<tr>
		            			<th>시즌</th>
		            			<th>회차</th>
		            			<th style="width:50%;">소개글</th>
		            			<th>영상 길이</th>
		            			<th></th>
		            		</tr>
	            		</thead>
	            		<tbody id="episode-list">
	            			<c:forEach var="yesSeriesDto" items="${yesSeriesList }">
	            				<c:if test="${yesSeriesDto.contentSeason eq 1}">	            			
				            		<tr>
				            			<td style="display:none">${yesSeriesDto.contentNo }</td>		
	    								<td style="display:none">${yesSeriesDto.seriesPath }</td>
				            			<td >${yesSeriesDto.contentSeason }</td>
				            			<td>${yesSeriesDto.contentEpisode }</td>
				            			<td>${yesSeriesDto.episodeInfo }</td>
				            			<td>${yesSeriesDto.contentPlaytime }</td>
				            			<td>
				            				<div class="row">
					                            <div class="col-md-6 p-1">
					                                <button class="btn btn-block btn-outline-danger episode-modal-btn" data-toggle="modal" 
					                                data-target="#edit-series-modal"">수정</button>
					                            </div>
					                            <div class="col-md-6 p-1">
					                                <a href="episodeDelete?contentNo=${yesSeriesDto.contentNo}&contentSeason=${yesSeriesDto.contentSeason}&contentEpisode=${yesSeriesDto.contentEpisode}" class="btn btn-block btn-outline-secondary delete-btn">삭제</a>
					                            </div>
					                        </div>
				            			</td>
				            		</tr>
			            		</c:if>
	            			</c:forEach>
	            		</tbody>
	            	</table>
	            </div>
	     	 </div>
	     	 
		     <div class="text-right mb-4">
		     	<a href="${pageContext.request.contextPath}/admin/content/" class="btn btn-secondary">목록으로</a>
		     </div>
	     </div>
	 </div>
	
	<!-- 컨텐츠 수정 버튼 클릭시 수정 화면 모달창 -->
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
                        	
	                            <form action="yesContentEdit" method="post" class="form">	
									<input type="hidden" name="contentNo" value="${contentDto.contentNo}">
					                <div class="form-group">
					                    <label class="text-primary">컨텐츠명</label>
					                    <input type="text" name="contentName" class="form-control" value="${contentDto.contentName}">
					                </div>
					
					                <div class="form-group form-textarea">
					                    <label>컨텐츠 소개</label>
					                    <textarea name="contentInfo" class="form-control form-textarea">${contentDto.contentInfo}</textarea>
					                </div>
					                
					                <div class="form-group">
					                    <label>트레일러 영상 주소</label>
					                    <input type="text" name="contentTrailer" class="form-control" value="${contentDto.contentTrailer}">
					                </div>
									
					                <div class="form-group">
					                    <label>연령제한</label>
					                    <select class="form-control" name="contentLimit" required>
					                      <option value="" >선택하세요</option>
					                      <option value="0">전체 이용가</option>
					                      <option value="12">12세 이용가</option>
					                      <option value="15">15세 이용가</option>
					                      <option value="18">18세 이용가</option>
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
					                  	<select class="form-control" name="contentGenre" >
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
					                    <button type="submit" class="btn btn-danger" id="yesContent-edit">확인</button>                        
					                    <button class="btn btn-dark" data-dismiss="modal">취소</button>
					                </div>
					            </form>
				            
                        	</div>
                    	</div>                    
                	</div>
            	</div>
        	</div>
   	 	</div>
	</div>
	
	<!-- 각 회차 수정 버튼 클릭시 수정 화면 모달창 -->
    <div class="modal fade" id="edit-series-modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">회차 수정</h4>
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <div class="modal-body">
                    <div class="conatiner-fluid">
                        <div class="row">
                        	<div class="col-md-12">
                        	
	                            <form action="episodeEdit" method="post" class="form">	
									<input type="hidden" name="contentNo" id="contentNo">
									<input type="hidden" name="contentSeason" id="contentSeason">
									<input type="hidden" name="contentEpisode" id="contentEpisode">
									
					                <div class="form-group">
					                    <label>시즌</label>
					                    <span class="text-primary" id="modal-contentSeason"></span>
					                    <p class="text-primary" id="modal-contentEpisode"></p>
					                </div>
					                
					                <div class="form-group form-textarea">
					                    <label>에피소드 소개</label>
					                    <textarea name="episodeInfo" class="form-control form-textarea" id="modal-episodeInfo"></textarea>
					                </div>
					                
					                <div class="form-group">
					                    <label>url</label>
					                    <input type="text" name="seriesPath" class="form-control" id="modal-seriesPath">
					                </div>
					                
					                <div class="form-group">
					                    <label>영상 길이(분)</label>
					                    <input type="text" name="contentPlaytime" class="form-control" id="modal-contentPlaytime">
					                </div>
					
					                 
					                <div class="modal-footer">
					                    <button type="submit" class="btn btn-danger" id="episodeEdit-btn">확인</button>                        
					                    <button class="btn btn-dark" data-dismiss="modal">취소</button>
					                </div>
					            </form>
				            
                        	</div>
                    	</div>                    
                	</div>
            	</div>
        	</div>
   	 	</div>
	</div>
	
	<!-- 회차 추가 화면 모달창 -->
    <div class="modal fade" id="insert-episode-modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">에피소드 추가</h4>
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <div class="modal-body">
                    <div class="conatiner-fluid">
                        <div class="row">
                        	<div class="col-md-12">
                        	
	                            <form action="insertEpisode" method="post" class="form">	
									<input type="hidden" name="contentNo" value="${contentDto.contentNo }">
									
					                <div class="form-group">
					                    <label>시즌 </label>
					                    	<input type="text" name="contentSeason" class="form-control" id="insert-contentSeason">
					                </div>
					                
					                <div class="form-group">
					                    <label>회차</label>
					                    	<input type="text" name="contentEpisode" class="form-control" id="insert-contentEpisode">
					                </div>
					                
					                <div class="form-group form-textarea">
					                    <label>에피소드 소개</label>
					                    	<textarea name="episodeInfo" class="form-control form-textarea" id="insert-episodeInfo"></textarea>
					                </div>
					                
					                <div class="form-group">
					                    <label>url</label>
					                    	<input type="text" name="seriesPath" class="form-control" id="insert-seriesPath">
					                </div>
					                
					                <div class="form-group">
					                    <label>영상 길이(분)</label>
					                    	<input type="text" name="contentPlaytime" class="form-control" id="insert-contentPlaytime">
					                </div>
					
					                 
					                <div class="modal-footer">
					                    <button type="submit" class="btn btn-danger" id="insert-episode-btn">확인</button>                        
					                    <button class="btn btn-dark" data-dismiss="modal">취소</button>
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
		
		
		//시즌 몇까지 있는지 확인 후 드롭다운에 출력
		//시즌에 따라 에피소트 테이블 변경 ajax
		
		$(".dropdown-item").click(function(e){
			var contentNo = "<c:out value='${contentDto.contentNo}' />"
			var choice = $(this).text();
			$("#dropdownMenuLink").text(choice);
			
			choice = choice.slice(3);
			console.log(choice);
			
			e.preventDefault();
			
			$.ajax({
    			url : "${pageContext.request.contextPath}/data/admin/content/selectSeason",
    			type : "get",
    			dataType : "json",
    			data : {contentSeason:choice,
    					contentNo:contentNo},
    			success:function(resp){
					$("#episode-list").empty();					
					var index = 0;
					for(var i=0; i < resp.length; i++){
						var template = $("#episode-list-template").html();
						template = template.replace("{{id}}", index+"");
						template = template.replace("{{contentNo}}", resp[i].contentNo);
						template = template.replace("{{seriesPath}}", resp[i].seriesPath);
						template = template.replace("{{contentSeason}}", resp[i].contentSeason);
						template = template.replace("{{contentEpisode}}", resp[i].contentEpisode);
						template = template.replace("{{EpisodeInfo}}", resp[i].episodeInfo);
						template = template.replace("{{contentPlaytime}}", resp[i].contentPlaytime);
						template = template.replace("#no", resp[i].contentNo);
						template = template.replace("#season", resp[i].contentSeason);
						template = template.replace("#episode", resp[i].contentEpisode);
						$("#episode-list").append(template);
						index++;
					}
					
				}
    		});
			
			$("#episode-modal-btn").addClass("episode-modal-btn");
			
		});
		
		$("#edit-series-modal").on("show.bs.modal", function(e){
			var el = $(e.relatedTarget);
			//console.log(el);
			
			var contentNo = el.parents("tr").children("td").eq(0).text();
			var seriesPath = el.parents("tr").children("td").eq(1).text();
			var contentSeason = el.parents("tr").children("td").eq(2).text();
			var contentEpisode = el.parents("tr").children("td").eq(3).text();
			var episodeInfo = el.parents("tr").children("td").eq(4).text();
			var contentPlaytime = el.parents("tr").children("td").eq(5).text();
			
			$("#contentNo").val(contentNo);
			$("#contentSeason").val(contentSeason);
			$("#contentEpisode").val(contentEpisode);
			
			$("#modal-contentSeason").text(contentSeason);
			$("#modal-contentEpisode").text(contentEpisode+"화");
			$("#modal-episodeInfo").text(episodeInfo);
			$("#modal-seriesPath").val(seriesPath);
			$("#modal-contentPlaytime").val(contentPlaytime);
		});
		
	});
</script>

<script id="episode-list-template" type="text/template">       			
	<tr>
    	<td style="display:none">{{contentNo}}</td>		
	    <td style="display:none">{{seriesPath}}</td>
	    <td class="">{{contentSeason}}</td>
	    <td>{{contentEpisode}}</td>
	    <td>{{EpisodeInfo}}</td>
	    <td>{{contentPlaytime}}</td>
	    <td>
	        <div class="row">
	            <div class="col-md-6 p-1">
	                <button class="btn btn-block btn-outline-danger" id="episode-modal-btn" data-toggle="modal" data-target="#edit-series-modal">수정</button>
	            </div>
	            <div class="col-md-6 p-1">
	                <a href="episodeDelete?contentNo=#no&contentSeason=#season&contentEpisode=#episode" class="btn btn-block btn-outline-secondary delete-btn">삭제</a>
	            </div>
	        </div>
	    </td>
	</tr>
</script>

<script>
	$(function(){
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
				$("#this-content-genre").append("<span class='genreBox p-2 mr-2 mb-2'><input name='genreNo' type='hidden' value='${genreFeatureCastVO.genreNo}'>${genreFeatureCastVO.genreName}<button class='genre-btn-close'>&times;</button></span>");
				$("select[name='contentGenre'] option[value='${genreFeatureCastVO.genreNo}']").prop('disabled',true);
			</c:forEach>
			
			<c:forEach var="genreFeatureCastVO" items="${contentFeatureList }">
				$("#this-content-feature").append("<span class='featureBox p-2 mr-2 mb-2'><input name='featureNo' type='hidden' value='${genreFeatureCastVO.featureNo}'>${genreFeatureCastVO.featureName}<button class='feature-btn-close'>&times;</button></span>");
				$("select[name='contentFeature'] option[value='${genreFeatureCastVO.featureNo}']").prop('disabled',true);
			</c:forEach>
			
			<c:forEach var="genreFeatureCastVO" items="${contentCastList }">
				$("#this-content-cast").append("<span class='castBox p-2 mr-2 mb-2'><input name='castName' type='hidden' value='${genreFeatureCastVO.castName}'>${genreFeatureCastVO.castName}<button class='cast-btn-close'>&times;</button></span>");
			</c:forEach>
		});
		
		
		$("select[name='contentGenre']").change(function(){
			var selectedGenreName = $("select[name='contentGenre'] option:checked").text();
			var selectedGenreNo = $(this).val();
            
			var genreDiv = "";
			genreDiv += "<span class='genreBox p-2 mr-2 mb-2'>";
			genreDiv += selectedGenreName;
			genreDiv += '<input type="hidden" name="genreNo" value="'+selectedGenreNo+'">';
			genreDiv += "<button class='genre-btn-close'>&times;</button></span>";
			$("#this-content-genre").append(genreDiv);
			
			$("select[name='contentGenre'] option[value='"+selectedGenreNo+"']").prop('disabled',true);
			
		});
		
		$("select[name='contentFeature']").change(function(){
			var selectedFeatureName = $("select[name='contentFeature'] option:checked").text();
			var selectedFeatureNo = $(this).val();
			
			var featureDiv = "";
			featureDiv += "<span class='featureBox p-2 mr-2 mb-2'>";
			featureDiv += selectedFeatureName;
			featureDiv += '<input type="hidden" name="featureNo" value="'+selectedFeatureNo+'">';
			featureDiv += "<button class='feature-btn-close'>&times;</button></span>";
			$("#this-content-feature").append(featureDiv);
			
			$("select[name='contentFeature'] option[value='"+selectedFeatureNo+"']").prop('disabled',true);
			
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
				castDiv += "<button class='cast-btn-close'>&times;</button></span>";
				$("#this-content-cast").append(castDiv);
				
				$(this).val("");
        	}
		});
		
		/* 수정 값 유효성 검사 */
		$("#yesContent-edit").click(function(e){
			/* 
				배우가 입력 되었는지 검사.  
				아무것도 없으면 입력하라는 메세지
			*/
			if($("#this-content-genre").children().length == 0){
				window.alert("장르를 입력하세요");
				$("select[name='contentGenre']").focus();
				e.preventDefault();
			}
			else if($("#this-content-cast").children().length == 0){
				window.alert("배우를 입력하세요");
				$("input[name='contentCast']").focus();
				e.preventDefault();
			}
			
			
			var contentName = $("input[name='contentName']").val();
			var contentInfo = $("textarea[name='contentInfo']").val();			
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
		
		$("#episodeEdit-btn").click(function(e){
			var episodeInfo = $("#modal-episodeInfo").val();
			var seriesPath = $("#modal-seriesPath").val();
			var contentPlaytime = $("#modal-contentPlaytime").val();
			
			if(episodeInfo.length == 0 || episodeInfo.length>300){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("#modal-episodeInfo").val("");
				$("#modal-episodeInfo").focus();
				e.preventDefault();
			}
			else if(seriesPath.length == 0 || seriesPath.length>500){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("#modal-seriesPath").val("");
				$("#modal-seriesPath").focus();
				e.preventDefault();
			}
			else if(contentPlaytime.length == 0 || contentPlaytime.length>3){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("#modal-contentPlaytime").val("");
				$("#modal-contentPlaytime").focus();
				e.preventDefault();
			}
		});
		
		
		$("#insert-episode-btn").click(function(e){
			
			var contentSeason = $("#insert-contentSeason").val();
			var contentEpisode = $("#insert-contentEpisode").val();
			var episodeInfo = $("#insert-episodeInfo").val();
			var seriesPath = $("#insert-seriesPath").val();
			var contentPlaytime = $("#insert-contentPlaytime").val();
			
			/* 입력한 시즌, 회차가 있는지 검사 */
			var seriesArr = new Array();
			<c:forEach items="${yesSeriesList}" var="yesSeriesDto">
				seriesArr.push({contentSeason:"${yesSeriesDto.contentSeason}",
								contentEpisode:"${yesSeriesDto.contentEpisode}"});
			</c:forEach>
			
			for(var i=0; i<seriesArr.length;i++){
				if(contentSeason==seriesArr[i].contentSeason && contentEpisode==seriesArr[i].contentEpisode){
					window.alert("이미 존재하는 회차 입니다. 다시 입력하세요");
					$("#insert-contentSeason").focus();
					e.preventDefault();
				}
			}
			
			
			/* 유효성 검사 */
			if(contentSeason.length == 0 || contentSeason.length>3){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("#insert-contentSeason").val("");
				$("#insert-contentSeason").focus();
				e.preventDefault();
			}
			else if(contentEpisode.length == 0 || contentEpisode.length>3){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("#insert-contentEpisode").val("");
				$("#insert-contentEpisode").focus();
				e.preventDefault();
			}
			else if(episodeInfo.length == 0 || episodeInfo.length>300){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("#insert-episodeInfo").val("");
				$("#insert-episodeInfo").focus();
				e.preventDefault();
			}
			else if(seriesPath.length == 0 || seriesPath.length>500){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("#insert-seriesPath").val("");
				$("#insert-seriesPath").focus();
				e.preventDefault();
			}
			else if(contentPlaytime.length == 0 || contentPlaytime.length>3){
				window.alert("잘못된 값입니다. 다시 입력하세요.");
				$("#insert-contentPlaytime").val("");
				$("#insert-contentPlaytime").focus();
				e.preventDefault();
			}
		});
		
		$(".delete-btn").click(function(e){
			if (!window.confirm("정말 삭제하시겠습니까?")) {
				e.preventDefault();
			}
		});
	});
</script>
<script>
	$(function(){
		$(document).on("click",".genre-btn-close",function(e){
			e.preventDefault();
			$(this).parents("span").remove();
			var no = $(this).prev("input").val();
			$("select[name='contentGenre'] option[value='"+no+"']").prop('disabled',false);
		});
		
		$(document).on("click",".feature-btn-close",function(e){
			e.preventDefault();
			$(this).parents("span").remove();
			var no = $(this).prev("input").val();
			$("select[name='contentFeature'] option[value='"+no+"']").prop('disabled',false);
		});
		
		$(document).on("click",".cast-btn-close",function(e){
			e.preventDefault();
			$(this).parents("span").remove();
		});
		
	});
</script>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>