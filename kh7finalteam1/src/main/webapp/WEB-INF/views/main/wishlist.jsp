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
  <script>
  	$(function(){  		
  		var hoverImg;  		  		
  		var isCheck=0;	
  		var contentList;
  		var fakeImgCount;
  		var rowCount;
  		var initFlag = false;
  		
  		$(window).resize(function(){
  			var width = $(window).width();
  			var tempCount = 0;
  			
  			if(width > 1300)
  				tempCount = 6;
  			else if(width <= 1300 && width > 1100)
  				tempCount = 5;
  			else if(width <= 1100 && width > 830)
  				tempCount = 4;
  			else if(width <= 830 && width > 600)
  				tempCount = 3;
  			else
  				tempCount = 2;
  			
  			if(tempCount != rowCount){
  				rowCount = tempCount;
  				if(initFlag)
  					$.fn.initFakeImageCard();
  			}  			
  		});
  		
  		$.fn.removeContent = function(contentNo){
  			for(var i in contentList){
  				if(contentList[i].contentNo == contentNo){
  					contentList.splice(i);
  					break;
  				}
  			}
  		}
  		
  		$.fn.addFakeImageCard = function(){
  			if(fakeImgCount == rowCount - 1){
  				fakeImgCount = 0;
  				$("div").remove(".fake-img");
  				return;
  			}
  			
  			var template = $("#fake-img-cards").html();
			$(".wishlist-page-body").append(template);
			fakeImgCount++;
  		}
		
		$.fn.toHideEvent = function(){
			$(".search-page-card-img-tohide").mouseenter(function(){
	  			hoverImg=$(this);
	  		});
			
			$("#modal-check-btn").click(function(){  				
  				var contentNo = hoverImg.find("img").attr("data-contentNo");
  				$.fn.removeContent(contentNo);
  				
  				hoverImg.fadeOut(500);
				setTimeout(function(){
					$.fn.addFakeImageCard();	
				}, 500);
  				  				
  				$(".hoverModal").hide();
  			});
			
			$("#check-btn").click(function(){
				isCheck=1;				
	  		});
			
			$("#detailModal").on("hidden.bs.modal",function(){
				if(isCheck==1){
					var contentNo = hoverImg.find("img").attr("data-contentNo");
	  				$.fn.removeContent(contentNo);
					hoverImg.fadeOut(500);
					setTimeout(function(){
						$.fn.addFakeImageCard();	
					}, 500);
					
					ischeck=0;
				}
			});
		};
		
		$.fn.initFakeImageCard = function(){
			$("div").remove(".fake-img");
			
			var count = rowCount - (contentList.length % rowCount);
			
			if(count == rowCount)
				return;
			
			for(var i=0; i<count; i++){
				var template = $("#fake-img-cards").html();
				$(".wishlist-page-body").append(template);
			}
			
			fakeImgCount = count;
		};
		
		$.fn.initImageCard = function(){
			
			$.ajax({
				url: "${pageContext.request.contextPath}/data/home/getWishlist",
				type: "post",
				dataType: "json",
				data: {
				},
				success:function(resp){
					contentList = resp;
					
					$(".wishlist-page-body").empty();
					
					for(var i in resp){						
						var template = $("#img-cards").html();
						template = template.replace("{{contentThumbnail}}", resp[i].contentThumbnail);
						template = template.replace("{{contentNo}}", resp[i].contentNo);
						$(".wishlist-page-body").append(template);
					}
					
					$.fn.initFakeImageCard();
					$.fn.toHideEvent();
					initFlag = true;
				}	
			});
		};
		
		$(window).resize();
		$.fn.initImageCard();
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

<script id="img-cards" type="text/template">
<div class="search-page-card  search-page-card-img-tohide"><img src="{{contentThumbnail}}" class="search-page-card-img" data-contentNo="{{contentNo}}"></div>
</script>

<script id="fake-img-cards" type="text/template">
<div class="search-page-card  fake-img" style="visibility:hidden;"><img src="res/img/slider_img1.jpeg" class="search-page-card-img" ></div>
</script>

<style>
.wishlish-page-body{
	width: 90%;
    padding-top: 150px;
    display: flex;
    flex-wrap: wrap;
    /* margin-bottom: 0%; */
    /* min-height: 1000px; */
    height: 100%;
    /* align-items: flex-start; */
    align-content: flex-start;
}
</style>
<div class="main-color container-center search-page-body wishlist-page-body">

<%-- 	<c:forEach var="contentDto" items="${contentList}"> --%>
<%-- 		<div class="search-page-card  search-page-card-img-tohide"><img src="${contentDto.contentThumbnail }" class="search-page-card-img" data-contentNo="${contentDto.contentNo }"></div> --%>

<%-- 	</c:forEach>  --%>
	
	
	<%-- <c:forEach var="j" begin="1" end="5" step="1">
		<div class="search-page-card" style="visibility:hidden;"><img src="res/img/slider_img1.jpeg" class="search-page-card-img"></div>
	</c:forEach>  --%>
	
</div>
	
<jsp:include page="/WEB-INF/views/template/contentHover.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
