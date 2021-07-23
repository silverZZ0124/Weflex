<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<div class="container-fluid">
	
	
	<div class="row">
	    <div class="col-md-10 offset-md-1">
	
	        <div class="card shadow mb-4">
	        
	            <div class="card-header py-3" >
	            	<div>
	                	<h6 class="m-0 font-weight-bold text-primary">YES 컨텐츠 상세보기</h6>
	                </div>
	            </div>
	            
	            <div class="card-body row">
	            	<div class="thumnail-img col-md-6 text-left">
	            		<div style="position:relative">
		            		<img alt="${contentDto.contentName }" src="${contentDto.contentThumbnail }" style="width:100%;"><br>
		            		<img alt="${contentDto.contentName }" src="${contentDto.contentLogo }" style="width:40%; position:absolute; top:0; left:0; transform:translateY(100%);">
	            		</div>
	            		
	            	</div>
	            	
	            	<div class="col-md-6">
	            		<div>컨텐츠 번호 : ${contentDto.contentNo }</div>
	            		<div class="mt-3">컨텐츠명 : ${contentDto.contentName }</div>
	            		<div class="mt-3">
	            			컨텐츠 타입 : 
		            		<c:choose>
								<c:when test="${contentDto.contentType eq 'km'}"> 한국 영화 </c:when>
								<c:when test="${contentDto.contentType eq 'fm'}"> 외국 영화 </c:when>
								<c:when test="${contentDto.contentType eq 'kd'}"> 한국 드라마 </c:when>
								<c:when test="${contentDto.contentType eq 'fd'}"> 외국 드라마 </c:when>
								<c:when test="${contentDto.contentType eq 'co'}"> TV 예능 </c:when>
								<c:when test="${contentDto.contentType eq 'an'}"> 애니메이션  </c:when>
								<c:when test="${contentDto.contentType eq 'do'}"> 다큐멘터리 </c:when>
							</c:choose>
						</div>
						<div class="mt-3">${contentDto.contentLimit}세 이상</div>
						<div class="mt-3">연작 여부 : ${contentDto.contentSeries}</div>
						<div class="mt-3">개봉년도 : ${contentDto.contentRelease}</div>
						<div class="mt-3">좋아요 : ${contentDto.contentLikes}</div>
						<div class="mt-3">조회수 : ${contentDto.contentViews}</div>
	            	</div>
	            	
                    <div class="col-md-6 offset-md-6 pt-3">
                        <div class="row">
                            <div class="col-md-6 p-1">
                                <button type="button" class="btn btn-block btn-outline-primary" data-toggle="modal" data-target="#edit-content-modal">수정</button>
                            </div>
                            <div class="col-md-6 p-1">
                                <a href="contentDelete?contentNo=${contentDto.contentNo }" class="btn btn-block btn btn-outline-danger" id="delete-btn">삭제</a>
                            </div>
                        </div>
                    </div>
	            </div>             
	     	 </div>
	     	 
   	 		
	     	 <div class="card shadow mb-4">
	     	 	<div class="card-header py-3">
	     	 		<div class="row">
		     	 		<div class="col-md-4">
				     	 	<div class="dropdown">
							  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
							    시즌 1
							  </a>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							  	<c:forEach var="seasonSize" items="${seasonSize }">
								    <li class="dropdown-item">시즌 ${seasonSize }</li>							  	
							  	</c:forEach>
							  </ul>
							</div>
		     	 		</div>
		                <div class="col-md-2 offset-md-6">
		                	<button class="btn btn-block btn-primary" data-toggle="modal" data-target="#insert-episode-modal">에피소드 추가</button>
		                </div>
	                </div>
	            </div>
	            <div class="card-body row">
	            	<table class="table">
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
				            			<td>${yesSeriesDto.contentSeason }</td>
				            			<td>${yesSeriesDto.contentEpisode }</td>
				            			<td>${yesSeriesDto.episodeInfo }</td>
				            			<td>${yesSeriesDto.contentPlaytime }</td>
				            			<td>
				            				<div class="row">
					                            <div class="col-md-6 p-1">
					                                <button class="btn btn-block btn-outline-primary episode-modal-btn" data-toggle="modal" 
					                                data-target="#edit-series-modal"">수정</button>
					                            </div>
					                            <div class="col-md-6 p-1">
					                                <a href="episodeDelete?contentNo=${yesSeriesDto.contentNo}&contentSeason=${yesSeriesDto.contentSeason}&contentEpisode=${yesSeriesDto.contentEpisode}" class="btn btn-block btn btn-outline-danger">삭제</a>
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
		     	<a href="${pageContext.request.contextPath}/admin/content/" class="btn btn-primary">목록으로</a>
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
					                    <label>컨텐츠명</label>
					                    <input type="text" name="contentName" class="form-control" value="${contentDto.contentName}">
					                </div>
					
					                <div class="form-group form-textarea">
					                    <label>컨텐츠 소개</label>
					                    <textarea name="contentInfo" class="form-control form-textarea">${contentDto.contentInfo}</textarea>
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
					                    <button type="submit" class="btn btn-primary">확인</button>                        
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
					                    <p id="modal-contentSeason"></p>
					                    <p id="modal-contentEpisode"></p>
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
					                    <button type="submit" class="btn btn-primary">확인</button>                        
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
					                    	<input type="text" name="contentSeason" class="form-control">
					                </div>
					                
					                <div class="form-group">
					                    <label>회차</label>
					                    	<input type="text" name="contentEpisode" class="form-control">
					                </div>
					                
					                <div class="form-group form-textarea">
					                    <label>에피소드 소개</label>
					                    	<textarea name="episodeInfo" class="form-control form-textarea"></textarea>
					                </div>
					                
					                <div class="form-group">
					                    <label>url</label>
					                    	<input type="text" name="seriesPath" class="form-control">
					                </div>
					                
					                <div class="form-group">
					                    <label>영상 길이(분)</label>
					                    	<input type="text" name="contentPlaytime" class="form-control">
					                </div>
					
					                 
					                <div class="modal-footer">
					                    <button type="submit" class="btn btn-primary">확인</button>                        
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
	    <td>{{contentSeason}}</td>
	    <td>{{contentEpisode}}</td>
	    <td>{{EpisodeInfo}}</td>
	    <td>{{contentPlaytime}}</td>
	    <td>
	        <div class="row">
	            <div class="col-md-6 p-1">
	                <button class="btn btn-block btn-outline-primary" id="episode-modal-btn" data-toggle="modal" data-target="#edit-series-modal">수정</button>
	            </div>
	            <div class="col-md-6 p-1">
	                <a href="episodeDelete?contentNo=#no&contentSeason=#season&contentEpisode=#episode" class="btn btn-block btn btn-outline-danger">삭제</a>
	            </div>
	        </div>
	    </td>
	</tr>
</script>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>