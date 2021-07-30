<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="${pageContext.request.contextPath }/res/js/main-event.js"></script>
<script>

var player;
var hoverPlayer;

window.onload = function(){			
	
	function onYouTubeIframeAPIReady() {
	    player = new YT.Player('player', {
	        events: {	  
	        	'onReady': onPlayerReady,
	            'onStateChange': onPlayerStateChange
	          }
	    });
	    
	    hoverPlayer = new YT.Player('hoverPlayer', {
	        events: {	  
	        	'onReady': onHoverPlayerReady,
	            'onStateChange': onPlayerStateChange
	          }
	    });
	}		
	
	function onPlayerReady(event) {
		if(event.target.getVideoUrl() == "https://www.youtube.com/watch?v=6qaW-KZpmjM"){
			return;
		}
		
		$("#player").css("visibility", "visible");		
    }
	
	function onHoverPlayerReady(event) {
		$("#hoverPlayer").css("visibility", "visible");		
    }
	
	function onPlayerStateChange(event) {
	}	
	
	onYouTubeIframeAPIReady();
}

</script>

<!-- tv프로그램 등록된 장르만 selectbox 옵션에 추가 -->
<script>
	$(function(){
		$("#tv-genre-selectbox").empty();
		
        $("#tv-genre-selectbox").append("<option value=''>장르</option>");
		
		var tvGenreList = new Array();
		<c:forEach items="${tvGenreList}" var="genreDto">
			tvGenreList.push({genreName:"${genreDto.genreName}",
							genreNo:"${genreDto.genreNo}"});
		</c:forEach>
	
		
		for(var i=0; i<tvGenreList.length;i++){
			var option = $("<option value="+tvGenreList[i].genreNo+">"+tvGenreList[i].genreName+"</option>");
            $("#tv-genre-selectbox").append(option);
		}
		
		
		
	});
</script>

<script id="episode-list-template" type="text/template">
<div class="trailer-series-section-box">
	<div class="trailer-series-section">
		<div class="trailer-series-section-index">{{index}}</div>
		<div class="trailer-series-section-thumbnail-box">
			<img src="{{contentThumbnail}}"
				class="trailer-series-section-thumbnail">
			<form action="play" >
		        <input type="hidden" name="contentNo" value="{{contentNo}}">
		        <input type="hidden" name="contentSeason" value="{{contentSeason}}">
		        <input type="hidden" name="contentEpisode" value="{{contentEpisode}}">
		        <button type="submit" class="btn btn-outline-light modal-etc-btn series-play-btn"	style="display: none;">
			        <i class="fas fa-play"></i>
		        </button>
	        </form>
		</div>

		<div class="trailer-series-section-info-box">
			<div class="trailer-series-section-info-title">
				<div>제 {{contentIndex}}화</div>
				<div style="margin-left: auto;">{{contentPlaytime}}분</div>
			</div>
			<div class="trailer-series-section-info-text">{{episodeInfo}}</div>
		</div>
	</div>
</div>
</script>

<script id="select-template-header" type="text/template">
<select class="selectpicker main-color series-select-box-title">
</script>	

<script id="select-template-footer" type="text/template">    
</select>
</script>

<script id="hover-modal-genre-template-start" type="text/template">
<span>{{genre_name}}</span>
</script>

<script id="hover-modal-genre-template" type="text/template">
<span style="color:rgb(100,100,100);">•</span>
<span>{{genre_name}}</span>
</script>

<script id="detail-modal-similar-template" type="text/template">
<div class="similar-contents-detail-box">
	<div class="similar-contents-detail-img-box">
		<img class="similar-contents-detail-img"src="{{thumbnail}}" >
		<form action="play" style="display: inline-block;">
			<input type="hidden" name="contentNo" value="{{contentNo}}">
			<input type="hidden" name="contentSeason" value="-1">
			<input type="hidden" name="contentEpisode" value="-1">			
			<button type="submit" class="btn btn-outline-light modal-etc-btn modal-wallpaper-play-btn" style="display:none;"><i class="fas fa-play"></i></button>
		</form>
	</div>
	<div class="similar-contents-detail-text-box">

		<div style="display:flex; justify-content: space-between; align-items: center;">
			<div>
				<div class="modal-feature-percent-text" style="margin-right: 5px; display: inline-block;"><span>{{correct}}%</span><span>일치</span></div>
				<div style="margin-right: 5px; display: inline-block;">
					<img src="res/img/content_limit_{{contentLimit}}.png" style="width: 20px;">
				</div>			
				<div style="margin-right: 5px; display: inline-block;">{{contentRelease}}</div>
			</div>			
			<div>
				<button class="btn btn-outline-light modal-etc-btn wish-insert-btn-inDetail" style="display: {{plusStyle}};" data-contentNo="{{contentNo}}" id="wish-insert-btn{{contentNo}}"><i class="fas fa-plus"></i></button>
				<button class="btn btn-outline-light modal-etc-btn wish-delete-btn-inDetail" style="display: {{checkStyle}};" data-contentNo="{{contentNo}}" id="wish-delete-btn{{contentNo}}"><i class="fas fa-check"></i></button>

			</div>
		</div>
		<div class="modal-wallpaper-text">
			{{contentInfo}}
		</div>
	</div>
</div>
</script>

<!-- 검색된 장르에 따라 컨텐츠 화면 출력 -->
<script>
	$(function(){
		$("#tv-genre-selectbox").on("change",function(){
			var tvGenre = $(this).val();
			
			//console.log(tvGenre);
			
			$.ajax({
    			url : "${pageContext.request.contextPath}/data/home/getTvGenreList",
    			type : "get",
    			dataType : "json",
    			data : {
    				genreNo:tvGenre
    			},
    			success:function(resp){
    				
					$("#tv-content").empty();	
					//console.log(resp);
					var searchCard = "";
					for(var i=0; i < resp.length; i++){
						searchCard += "<div class='search-page-card'>";
						searchCard += "<img src='"+resp[i].contentThumbnail+"' class='search-page-card-img' data-contentNo='"+resp[i].contentNo+"'>";
						searchCard += "</div>";
						
					}
					$("#tv-content").append(searchCard);
					
					searchCard = "";
					for(var j=0; j<5; j++){
						searchCard += '<div class="search-page-card" style="visibility:hidden;"><img src="res/img/slider_img1.jpeg" class="search-page-card-img"></div>';						
					}
					$("#tv-content").append(searchCard);
					
				}
    		}); 
		});
	});
</script>

<div class="main-color container-center search-page-body" id="tv-content">

	<c:forEach var="contentListVO" items="${tvProgramList }">
		<div class="search-page-card"><img src="${contentListVO.contentThumbnail }" class="search-page-card-img" data-contentNo="${contentListVO.contentNo }"></div>
	</c:forEach>
 
	<c:forEach begin="1" end="5" step="1">
		<div class="search-page-card" style="visibility:hidden;"><img src="res/img/slider_img1.jpeg" class="search-page-card-img"></div>
	</c:forEach> 
</div>
	

<jsp:include page="/WEB-INF/views/template/contentHover.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
