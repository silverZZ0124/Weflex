<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:set var="isYseries" value=""></c:set> --%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>history.scrollRestoration = "auto"</script>
<script>


var player;
var hoverPlayer;
var detailModalPlayerReady = true;
var seriesArray = new Array();
var contentThumbnail;
var curContentNo;

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

$(function(){
	var video=$("#main-video");
	var videoDomObj = video.get(0);
	var numSlick=0;
	$('.custom-img-slide').each( function() {
        numSlick++;

        
        $(this).addClass( 'slider-' + numSlick).slick({
        	slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
			infinite : true, 	//무한 반복 옵션	 
			slidesToShow : 6,		// 한 화면에 보여질 컨텐츠 개수
			slidesToScroll : 6,		//스크롤 한번에 움직일 컨텐츠 개수
			speed : 1000,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)//ㅇㄹㄴㅇㄹㄴㅇ
			arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
			//centerMode: true,
			//dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
			//pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
			vertical : false,		// 세로 방향 슬라이드 옵션
			//prevArrow : "<button type='button' class='slick-prev slick-btn'>p</button>",		// 이전 화살표 모양 설정
			prevArrow : "<img src='res/img/arrow_left.png' class='arrow-img arrow-img-left'>",		// 이전 화살표 모양 설정
			nextArrow : "<img src='res/img/arrow_right.png' class='arrow-img arrow-img-right'>",		// 다음 화살표 모양 설정
			//dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
			draggable : false, 	//드래그 가능 여부 
			responsive: [ // 반응형 웹 구현 옵션
				
				{  
					breakpoint: 1300,
					settings: {
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:5,
						slidesToScroll : 5
					} 
				},
				
				{  
					breakpoint: 1100, //화면 사이즈 960px
					settings: {
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:4,
						slidesToScroll : 4
					} 
				},
				{  
					breakpoint: 830,
					settings: {
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:3,
						slidesToScroll : 3
					} 
				},
				{ 
					breakpoint: 600, //화면 사이즈 768px
					settings: {	
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:2,
						slidesToScroll : 2
					} 
				}
			]
        });
         
      }); 
      
	
		var timeout;
		var modalX;
		var modalY;
		var img;
		//마우스 호버 시 모달 팝업 	
		$(".slider-img").mouseenter(function(){		
			curContentNo = $(this).attr("data-contentNo");			
			img = $(this);
			
			timeout=setTimeout(function(){
				
				var modalWidth=img.width()*1.4;
				var modalVideoHeight=img.height()*1.4*1.05;

				$("#modal-header").css("height",modalVideoHeight+"px");
				$("#hoverModal").css("width",modalWidth+"px");
				/* $("#hoverModal").css("height",modalHeight+"px"); */
				

				$("#hoverModal").modal({backdrop: false});
				
				$("#hoverModal").modal("show");
				var imgX=img.offset().left;
				var imgY=img.offset().top;
				
				
				var imgMiddleX=imgX+(img.width()/2);
				var imgMiddleY=imgY+(img.height()/2);

				var modalHeight=$("#hoverModal").height();
				modalX=imgMiddleX-modalWidth/2;
				modalY=imgMiddleY-modalHeight/2;

				if(modalX<0) modalX=10;
				if((modalX+$("#hoverModal").width())>$(window).width()){
					modalX=$(window).width()-$("#hoverModal").width()-10;
				}
								
				$(".slider-img").mouseleave(function(){
					clearTimeout(timeout);
				});
		
				$("#hoverModal").css("transform","translate3d("+modalX+"px,"+modalY+"px,0px)"); 	
				$("body").removeClass("modal-open");
			},800);					
		});
		
		
		 $(".slider-img").mouseleave(function(){
			$("#hoverModal").modal("hide");
		});
		
		 $("#hoverModal").mouseleave(function(){
			$("#hoverModal").modal("hide");
	
		});  
		
		$("#hoverModal").on("show.bs.modal",function(){
			$("body").addClass("overflow-scroll");
			$("#hoverPlayer").css("visibility", "hidden");
			$("#hoverModal").css("display", "none");
			$("#hover-modal-play-btn").val(curContentNo);
			
			$.ajax({
				url: "${pageContext.request.contextPath}/data/home/getHoverModalItem",
				type: "post",
				dataType: "json",
				data: {
					contentNo: curContentNo	
				},
				success:function(resp){					
					var youtubeId = resp.contentTrailer.substring(30);
					var videoUrl = resp.contentTrailer + "?enablejsapi=1&start=00&autoplay=1&mute=1&controls=0&modestbranding=1&loop=1&playlist="+youtubeId;
					$(".hoverModalVideo").attr("src", videoUrl);
					
					$("#hover-content-limit").attr("src", "res/img/content_limit_"+resp.contentLimit+".png")
					
					if(resp.wish){
						$("#modal-plus-btn").css("display", "none");
						$("#modal-check-btn").css("display", "block");
					}
					else{
						$("#modal-plus-btn").css("display", "block");
						$("#modal-check-btn").css("display", "none");
					}	
					
					if(resp.like){
						$(".like-insert-btn").css("display", "none");
						$(".like-delete-btn").css("display", "block");
					}
					else{
						$(".like-insert-btn").css("display", "block");
						$(".like-delete-btn").css("display", "none");
					}	
										
					$("#hover-content-season").empty();
					if(resp.contentSeries === "Y"){
						$("#hover-content-season").text("시즌 "+resp.seasonCount+"개");
					}
					else{
						$("#hover-content-season").text(resp.contentPlayTime+" 분");
					}
					
					$(".hover-modal-genre").empty();
					for(var i=0; i<resp.genreList.length; i++){
						var template;												
						
						if(i == 0){
							template = $("#hover-modal-genre-template-start").html();
						}
						else{
							template = $("#hover-modal-genre-template").html();
						}
						
						template = template.replace("{{genre_name}}", resp.genreList[i].genreName);
						$(".hover-modal-genre").append(template);
					}
					
					$(".hover-modal-more-button").attr("data-contentno", curContentNo);
				}	
			});
		});
		
		$("#hoverModal").on("shown.bs.modal", function(){
			$("#hoverModal").css("display", "block");
		});
		
		$("#hoverModal").on("hide.bs.modal",function(){
			$("body").removeClass("overflow-scroll");
		});		
		
		
		//슬릭 호버 시 화살표 보임 
		 $(".custom-img-slide-box").hover(function(){
			
			var arrow=$(this).find(".arrow-img-left");
			var slidebox=$(this).find(".custom-img-slide");
			
			var X=$(slidebox).offset().left;
			var Y=$(slidebox).offset().top;
			

			
			var middleY=Y+$(slidebox).height()/2;
			

			var arrowY=(middleY-arrow.height()/2)-Y;
			
			var minusX=(X/3)*2*(-1);
	
			arrow.css("left",minusX+"px");	
			arrow.css("top",arrowY+"px"); 
			arrow.css("width",(X/3)*2+"px");
			arrow.css("visibility","visible");

		},function(){
			 var arrow=$(this).find(".arrow-img");
			arrow.css("visibility","hidden");  
		}); 
		
		 $(".custom-img-slide-box").hover(function(){
				var arrow=$(this).find(".arrow-img-right");
				var slidebox=$(this).find(".custom-img-slide");
				 
				var X=$(slidebox).offset().left;
				var totalX=X+$(slidebox).width();
				var Y=$(slidebox).offset().top;

				var middleY=Y+$(slidebox).height()/2;

				var arrowWidth=$(window).width()-totalX;
				var arrowY=(middleY-arrow.height()/2)-Y;
				var arrowRight=(arrowWidth/3)*2;

				arrow.css("left",(totalX-arrowWidth)+"px");	
				arrow.css("top",arrowY+"px"); 
				arrow.css("width",arrowRight+"px");
				arrow.css("visibility","visible"); 

			},function(){
				  var arrow=$(this).find(".arrow-img");
				arrow.css("visibility","hidden");  
			}); 
		
		 $(document).mouseup(function (e){

				var container = $('#detailModal');

				if( container.has(e.target).length === 0){

				container.modal("hide");

				}

			});
		
		 
		//화살표 호버 시 커짐 
		$(".arrow-img").hover(function(){
			$(this).addClass("arrow-hover");
			$(this).css("cursor","pointer");
		},function(){
			$(this).removeClass("arrow-hover");
		});
		
		//버튼 누르면(모달 팝업 시) 영상 일시정지
		$(".main-btn").click(function(){	
			videoDomObj.pause();
		});
		
		//모달이 닫히면 영상 재생 
		$("#detailModal").on("hidden.bs.modal",function(){
			videoDomObj.play();
			$(".similar-contents-box").css("height","700px");
			$(".wallpaper-less-button").css("display","none");
			$(".wallpaper-more-button").css("display","block");
    	});
				
		//소리 재생 
		$("#sound-on").click(function(){
			videoDomObj.muted=false;
			$("#sound-off").css("display","block");
			$("#sound-on").css("display","none");
		});
		
		//음소거 
		$("#sound-off").click(function(){
			videoDomObj.muted=true;
			$("#sound-off").css("display","none");
			$("#sound-on").css("display","block");
		});
		
		//시리즈 호버시 재생버튼 
		$(".trailer-series-section-box").hover(function(){
			var playBtn=$(this).find(".series-play-btn");
			playBtn.addClass("show-play-btn");
			$(this).css("cursor","pointer");
		},function(){
			var playBtn=$(this).find(".series-play-btn");
			playBtn.removeClass("show-play-btn");
			$(this).css("cursor","default");
		});
		//시리즈 클릭시 영상 재생 페이지 이동 
		$(".trailer-series-section-box").click(function(){
			location.href="play";
		});
		
		//월페이퍼 호버시 재생버튼 
		$(".similar-contents-detail-box").hover(function(){
			var playBtn=$(this).find(".modal-wallpaper-play-btn");
			playBtn.css("display","block");
			$(this).css("cursor","pointer");
		},function(){
			var playBtn=$(this).find(".modal-wallpaper-play-btn");
			playBtn.css("display","none");
			$(this).css("cursor","default");
		});
		
		//+누르면 체크
		$(".wish-insert-btn").click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/data/home/insertWishList",
				type: "post",
				dataType: "json",
				data: {
					contentNo: curContentNo	
				},
				success:function(resp){
					$("#plus-btn").css("display","none");
					$("#check-btn").css("display","block");					
				}						
			});
		});
		
		//체크 누르면 +
		$(".wish-delete-btn").click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/data/home/deleteWishList",
				type: "post",
				dataType: "json",
				data: {
					contentNo: curContentNo	
				},
				success:function(resp){
					$("#plus-btn").css("display","block");
					$("#check-btn").css("display","none");					
				}						
			});
		});
		
		$(".like-insert-btn").click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/data/home/insertLikeList",
				type: "post",
				dataType: "json",
				data: {
					contentNo: curContentNo	
				},
				success:function(resp){
					$(".like-insert-btn").css("display","none");
					$(".like-delete-btn").css("display","block");					
				}						
			});
		});
		
		$(".like-delete-btn").click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/data/home/deleteLikeList",
				type: "post",
				dataType: "json",
				data: {
					contentNo: curContentNo	
				},
				success:function(resp){
					$(".like-insert-btn").css("display","block");
					$(".like-delete-btn").css("display","none");					
				}						
			});
		});
		
		//영상 재생 버튼
		$("#main-play-btn").click(function(){
			location.href="play";
		});
				
		//모달 버튼 누르면 wallpaper 출력
		$("#detailModal").on("show.bs.modal",function(e){
			var index=$(".similar-contents-box").find("var")
			if(index>6){
				$(".similar-contents-detail-box").css("display","none");
			}
			$("#player").css("visibility", "hidden");
			var el = $(e.relatedTarget);
			curContentNo = el.attr("data-contentno");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/data/home/getContent",
				type: "post",
				dataType: "json",
				data: {
					contentNo: curContentNo	
				},
				success:function(resp){						
				 	detailModalPlayerReady = false;
				 	
				 	var youtubeId = resp.contentDto.contentTrailer.substring(30);
 					var url = resp.contentDto.contentTrailer + "?enablejsapi=1&start=00&autoplay=1&mute=1&controls=0&modestbranding=1&loop=1&playlist="+youtubeId;
 					$("#player").attr("src", url);
 					
 					$("#input-content-no").val(resp.contentDto.contentNo);
 					$("#content-logo").attr("src", resp.contentDto.contentLogo);
 					$("#content-info").text(resp.contentDto.contentInfo);
 					$("#content-release").text(resp.contentDto.contentRelease);
 					$("#detail-modal-contentName").text(resp.contentDto.contentName);
 					var imgSrc = "res/img/content_limit_"+resp.contentDto.contentLimit+".png";
 					$(".content-limit").attr("src", imgSrc);
 					
 					if(resp.wishListDto == null){
 						$("#plus-btn").css("display","block");
 						$("#check-btn").css("display","none");	
 					}
 					else{
 						$("#plus-btn").css("display","none");
 						$("#check-btn").css("display","block");	
 					}
 					
 					if(resp.likeListDto == null){
 						$(".like-insert-btn").css("display","block");
 						$(".like-delete-btn").css("display","none");	
 					}
 					else{
 						$(".like-insert-btn").css("display","none");
 						$(".like-delete-btn").css("display","block");
 					}
 					
 					$(".content-genre").empty();
 					for(var i=0; i < resp.genreList.length; i++){
 						if(i==0)
 							$(".content-genre").append(" "+resp.genreList[i]);
 						else
 							$(".content-genre").append(","+resp.genreList[i]);
 					}
 					
 					$(".content-feature").empty();
 					for(var i=0; i < resp.featureList.length; i++){
 						if(i==0)
 							$(".content-feature").append(" "+resp.featureList[i]);
 						else
 							$(".content-feature").append(", "+resp.featureList[i]);
 					}
 					
 					$(".content-cast").empty();
 					for(var i=0; i < resp.castList.length; i++){
 						if(i==0)
 							$(".content-cast").append(" "+resp.castList[i]);
 						else
 							$(".content-cast").append(", "+resp.castList[i]);
 					}
 					
					//연작 없는 content일 경우 회차 div를 숨긴다
 					if(resp.contentDto.contentSeries == "N"){
 						$(".modal-series").css("display", "none"); 						
 					}
					//연작 있는 content일 경우 회차 div를 block으로
 					else if(resp.contentDto.contentSeries == "Y"){
 						//season이 몇 까지 있는지 파악 후 시즌 별로 배열에 나누기
 						seriesArray = new Array();
 						var array = new Array();
 						var season = 1;
 						
 						for(var i=0; i<resp.seriesList.length; i++){
 							if(resp.seriesList[i].contentSeason == season){
 								array.push(resp.seriesList[i]);
 							}else{
 								seriesArray.push(array);
 								season++;
 								array = new Array();
 								array.push(resp.seriesList[i]);
 							}
 						}
 						
 						seriesArray.push(array); 
 						$(".contentSeason").text("시즌 " + season + "개");
 						
 						//select 박스 동적 생성
 						$(".series-select-box").empty();
 						var selectTemplate = $("#select-template-header").html();
 						for(var i=1; i<=season; i++){
 							selectTemplate += '<option value='+i+'>시즌'+i+'</option>';	
 						}
 						if(season != 1)
 							selectTemplate += '<option data-divider="true"></option><option value="allSeason">전체 회차 표시</option>';
 							
 						selectTemplate += $("#select-template-footer").html();						
 						$(".series-select-box").append(selectTemplate);
 						
 						//contentThumbnail 변수에 Thumbnail url 할당
 						contentThumbnail = resp.contentDto.contentThumbnail;
  						 				
 						$.fn.initTrailerSeriesSection(1);
 						
 						$(".modal-series").css("display", "block");
 					}
					
 					$("#similar-content-wrapper").empty();
					for(var i in resp.similarList){
						var correct = resp.similarList[i].matchingCount / resp.genreList.length * 100;
						var template = $("#detail-modal-similar-template").html();
						template = template.replace("{{thumbnail}}", resp.similarList[i].contentThumbnail);
						template = template.replace("{{correct}}", parseInt(correct));
						template = template.replace("{{contentRelease}}", resp.similarList[i].contentRelease);
						template = template.replace("{{contentInfo}}", resp.similarList[i].contentInfo);
						template = template.replace("{{contentLimit}}", resp.similarList[i].contentLimit);
						
						if(resp.similarList[i].clientNo === 0){
							template = template.replace("{{plusStyle}}", "block");
							template = template.replace("{{checkStyle}}", "none");
						}
						else{
							template = template.replace("{{plusStyle}}", "none");
							template = template.replace("{{checkStyle}}", "block");
						}
						
						template = template.replaceAll("{{contentNo}}", resp.similarList[i].contentNo);
						
						$("#similar-content-wrapper").append(template);
					} 
					
					$.fn.initSimilarContent();
				}		
					
			});
		});
				
		$(".wallpaper-more-button").click(function(){
			$(".similar-contents-box").css("height","1600px");
			$(this).css("display","none");
			$(".wallpaper-less-button").css("display","block");
		});
		
		$(".wallpaper-less-button").click(function(){
			$(".similar-contents-box").css("height","700px");
			$(this).css("display","none");
			$(".wallpaper-more-button").css("display","block");
		});
				
		$(".hover-modal-more-button").click(function(){
			$("#hoverModal").modal("hide");
		});
		
		$(".slider-img").hover(function(){
			$(this).css("cursor","pointer");
		});
		
		$("#modal-plus-btn").click(function(){
			$(this).css("display","none");
			$("#modal-check-btn").css("display","block")
		});
		$("#modal-check-btn").click(function(){
			$(this).css("display","none");
			$("#modal-plus-btn").css("display","block")
		});
		
		$(".series-select-box-title").change(function(){
			console.log($(this).val());
		});
		
		$("#thumbs-up-empty").click(function(){
			$(this).hide();
			$("#thumbs-up-full").show();
			
			
		});
		 $("#thumbs-up-full").click(function(){
			$(this).hide();
			$("#thumbs-up-empty").show();
		}); 
		
		
		$("#thumbs-up-empty2").click(function(){
			$(this).hide();
			$("#thumbs-up-full2").show();
			
			
		});
		 $("#thumbs-up-full2").click(function(){
			$(this).hide();
			$("#thumbs-up-empty2").show();
		}); 
		
		
		$.fn.initEvent = function(){
			$(".series-select-box-title").change(function(){
				if($(this).val() == "allSeason")
					$.fn.initTrailerAllSeriesSection();
				else
					$.fn.initTrailerSeriesSection($(this).val());
			});
			
			$(".trailer-series-section-box").hover(function(){
				var playBtn=$(this).find(".series-play-btn");
				playBtn.addClass("show-play-btn");
				$(this).css("cursor","pointer");
			},function(){
				var playBtn=$(this).find(".series-play-btn");
				playBtn.removeClass("show-play-btn");
				$(this).css("cursor","default");
			});
		}
		
		$.fn.initTrailerSeriesSection = function(season){
			//season에 맞게 section 동적 생성 
			var index = season - 1;
			$(".trailer-series-section-box-wrapper").empty();
			$(".trailer-series-section-box-wrapper").css("border-top", "1px solid #404040");
			
			for(var i=0; i<seriesArray[index].length; i++){
				var template = $("#episode-list-template").html();
				
				template = template.replace("{{index}}", i+1);
				template = template.replace("{{contentThumbnail}}", contentThumbnail);
				template = template.replace("{{contentNo}}", seriesArray[index][i].contentNo);
				template = template.replace("{{contentSeason}}", seriesArray[index][i].contentSeason);				
				template = template.replace("{{contentEpisode}}", seriesArray[index][i].contentEpisode);
				template = template.replace("{{contentIndex}}", seriesArray[index][i].contentEpisode);
				template = template.replace("{{contentPlaytime}}", String(seriesArray[index][i].contentPlaytime));
				template = template.replace("{{episodeInfo}}", seriesArray[index][i].episodeInfo);
				
				$(".trailer-series-section-box-wrapper").append(template);	
			}
			
			$.fn.initEvent();
		}
		
		$.fn.initTrailerAllSeriesSection = function(){

			//모든 episode section 동적 생성 
			$(".trailer-series-section-box-wrapper").empty();
			$(".trailer-series-section-box-wrapper").css("border-top", "none");
			
			
			for(var i in seriesArray){
				var template;
				if(i == 0)
					template = '<div><h5 style="margin:0; font-weight: bold;">시즌 '+(Number(i)+1)+"</h5>";
				else
					template = '<div style="margin-top:20px;"><h5 style="margin:0; font-weight: bold;">시즌 '+(Number(i)+1)+"</h5>";
				var index = 1;
				for(var j in seriesArray[i]){
					template += $("#episode-list-template").html();
					
					template = template.replace("{{index}}", String(index));
					template = template.replace("{{contentThumbnail}}", contentThumbnail); 							
					template = template.replace("{{contentEpisode}}", seriesArray[i][j].contentEpisode);
					template = template.replace("{{contentIndex}}", String(seriesArray[i][j].contentEpisode));
					template = template.replace("{{contentPlaytime}}", String(seriesArray[i][j].contentPlaytime));
					template = template.replace("{{episodeInfo}}", seriesArray[i][j].episodeInfo);					
						
					index++;
				}
				template += "</div>";
				$(".trailer-series-section-box-wrapper").append(template);
			}
			
			$.fn.initEvent();
		}
		
		$.fn.initSimilarContent = function(){
			$(".wish-insert-btn-inDetail").click(function(){
				var contentNo = $(this).attr("data-contentNo");
				var insertBtn = $("#wish-insert-btn"+contentNo);
				var deleteBtn = $("#wish-delete-btn"+contentNo);

				$.ajax({
					url: "${pageContext.request.contextPath}/data/home/insertWishList",
					type: "post",
					dataType: "json",
					data: {
						contentNo: contentNo	
					},
					success:function(resp){
						insertBtn.css("display","none");
						deleteBtn.css("display","block");					
					}						
				});
			});
			
			//체크 누르면 +
			$(".wish-delete-btn-inDetail").click(function(){
				var contentNo = $(this).attr("data-contentNo");
				var insertBtn = $("#wish-insert-btn"+contentNo);
				var deleteBtn = $("#wish-delete-btn"+contentNo);
				
				$.ajax({
					url: "${pageContext.request.contextPath}/data/home/deleteWishList",
					type: "post",
					dataType: "json",
					data: {
						contentNo: contentNo	
					},
					success:function(resp){
						insertBtn.css("display","block");
						deleteBtn.css("display","none");					
					}						
				});
			});
			
			//월페이퍼 호버시 재생버튼 
			$(".similar-contents-detail-box").hover(function(){
				var playBtn=$(this).find(".modal-wallpaper-play-btn");
				playBtn.css("display","block");
				$(this).css("cursor","pointer");
			},function(){
				var playBtn=$(this).find(".modal-wallpaper-play-btn");
				playBtn.css("display","none");
				$(this).css("cursor","default");
			});			
		};
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

<div class="main-color">
	<div class="main-trailer-video">
		<video width="100%" height="80%"  id="main-video" autoplay loop muted>
    		<source src="${mainTrailerList.trailerUrl }" type="video/mp4">
		</video>
		<div class="main-trailer-over-box">
	<div class="main-trailer-img">
		<img src="${mainTrailerList.trailerLogo }" style="width:100%;">
	</div>
	
	<div class="main-trailer-text">
		${mainTrailerList.trailerInfo }
	</div>
	<div class="main-btn-box">
		<div>
			<form action="play" style="display: inline-block;">
				<input type="hidden" name="contentNo" value="${mainTrailerList.contentNo }">
				<input type="hidden" name="contentSeason" value="-1">
				<input type="hidden" name="contentEpisode" value="-1">
				<button class="btn btn-light main-btn" id="main-play-btn" ><i class="fas fa-play"></i>&ensp;&ensp;재생</button>
			</form>
			<button class="btn btn-secondary main-btn" data-bs-toggle="modal" data-bs-target="#detailModal" data-contentno="${mainTrailerList.contentNo }" style="margin-left:10px;opacity:0.7;"><i class="fas fa-info-circle"></i>&ensp;상세 정보</button>
		</div>
		<div class="main-btn-etc-box">
			<button class="btn btn-outline-light modal-etc-btn" id="sound-off" style="display:none;"><i class="fas fa-volume-up"></i></button>
			<button class="btn btn-outline-light modal-etc-btn"  id="sound-on"><i class="fas fa-volume-mute"></i></button>
		
		</div>
	</div>
	
	</div>
		<div class="gradation-box">&ensp;&ensp;</div>
	</div>
	
	<!-- 상세 정보 클릭시 팝업 모달 -->
	<div class="modal fade " id="detailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg detail-modal">
	    <div class="modal-content">
	     
	      <div class="modal-body main-color" style="padding:0px; border:none;">
			<button type="button" class="btn-close btn-close-white modal-close-btn" data-bs-dismiss="modal" aria-label="Close"></button>
			<div style="position:relative;" class="detail-modal-video-box">
	        	<!-- <video width="100%" height="80%"  autoplay loop muted  style="z-index:-5"> -->

	        	<iframe id="player" width="100%" height="100%" src="https://www.youtube.com/embed/6qaW-KZpmjM?enablejsapi=1&start=00&mute=0&controls=1&modestbranding=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>

				<div class="modal-gradation-box">&ensp;&ensp;</div>
				
				  <div class="modal-trailer-over-box">	
					<div class="main-trailer-img">
						<img id="content-logo" src="" style="width:100%;">
					</div>
					<div class="modal-btn-box">
						<form action="play" style="display: inline-block;">
							<input type="hidden" id="input-content-no" name="contentNo">
							<input type="hidden" name="contentSeason" value="-1">
							<input type="hidden" name="contentEpisode" value="-1">
							<button class="btn btn-light modal-play-btn" ><i class="fas fa-play"></i>&ensp;&ensp;재생</button>
						</form>										
						<button class="btn btn-outline-light modal-etc-btn wish-delete-btn" id="check-btn" style="display:none;"><i class="fas fa-check"></i></button>
						<button class="btn btn-outline-light modal-etc-btn wish-insert-btn" id="plus-btn"><i class="fas fa-plus"></i></button>
						<button class="btn btn-outline-light modal-etc-btn like-insert-btn" id="thumbs-up-empty"><i class="far fa-thumbs-up"></i></button>
						<button class="btn btn-outline-light modal-etc-btn like-delete-btn" id="thumbs-up-full" style="display:none;"><i class="fas fa-thumbs-up"></i></button>
					</div>
				
			</div>
	        </div>      
			
			<div class="modal-body-box">
					<div class="modal-trailer-info-box">
						<div style="max-width:60%;">
							<div class="modal-trailer-feature">
								<div class="modal-feature-percent-text modal-trailer-feature-box"><span>64%</span><span>일치</span></div>
								<div id="content-release" class="modal-trailer-feature-box "></div>
								<div class="modal-trailer-feature-box "><img class="content-limit" width="25px" height="25px"></div>
								<div class="modal-trailer-feature-box contentSeason"></div>
								<div class="modal-feature-border modal-trailer-feature-box">HD</div>
							</div>

							<div id="content-info" class="modal-trailer-text">
								

							</div>
						</div>
						<div class="modal-trailer-etc"> 
							<div class="modal-contents-detail-info-text"><span style="color: #777;">출연:</span><span class="content-cast"></span></div>
				       		<div class="modal-contents-detail-info-text"><span style="color: #777;">장르:</span><span class="content-genre"></span></div>
				       		<div class="modal-contents-detail-info-text"><span style="color: #777;">영화 특징:</span><span class="content-feature"></span></div>
						</div>
					</div>
			
					<div style="position: relative;">
					<!-- 드라마 콘텐츠일 경우 회차 정보 표시 -->
					<%-- <c:if test="${isYseries}"> --%>
			        <div class="modal-series">
			        	<div class="modal-series-title">
			        		<h3>회차</h3>
			        		<div class="series-select-box">
			        		</div>
			        	</div>
			        	<div class="trailer-series-section-box-wrapper"></div>	        								        	
				        </div>
				       <%--  </c:if> --%>
				       
				       <div class="similar-contents-box">
				       		<h3 style="margin-bottom:2%">비슷한 콘텐츠</h3>
				       		<c:set var="wallpaperNo" value="4" /> <!-- 비슷한 콘텐츠 수 받아오기(12개 고정) -->
				       		<div id="similar-content-wrapper">				       			
				       		</div>
				       		
				       </div>
				       
				       <div style="position: absolute;width: 100%;">
				       <div class="modal-second-gradation-box">&ensp;&ensp;</div>
				       <div class="modal-contents-detail-info" >
				       		
				       		<div class="modal-contents-detail-btn" style="display:flex;">
					       		<button class="btn btn-outline-light modal-etc-btn wallpaper-more-button "><i class="fas fa-chevron-down"></i></button>
					       		<button class="btn btn-outline-light modal-etc-btn wallpaper-less-button " style="display:none;"><i class="fas fa-chevron-up"></i></button>
					       	</div>
				       		<h3 style="margin-bottom:2%"><span id="detail-modal-contentName"></span> 상세 정보</h3>
				       		<div style="font-size:0.8rem;">
				       			<!-- <div class="modal-contents-detail-info-text"><span style="color: #777;">감독:</span><span>aa</span></div> -->
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">출연:</span><span class="content-cast"></span></div><br>
				       			<!-- <div class="modal-contents-detail-info-text"><span style="color: #777;">각본:</span><span></span></div> -->
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">장르:</span><span class="content-genre"></span></div><br>
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">영화 특징:</span><span class="content-cast"></span></div><br>
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">관람 등급: </span><img class="content-limit" width="25px" height="25px"></div>				       				       			
				       		</div>
				       </div>
				      </div>
				       
			      </div>
		      </div>
		     
		     
	      </div>
	    </div>
	  </div>
	</div>


	<!-- 호버시 팝업될 창 -->
  <!--   <div class="modal fade hoverModal" id="hoverModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
    <div class="modal fade hoverModal" id="hoverModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content hoverModalBox ">
               
                <div class="modal-header" id="modal-header" style="padding:0;display:flex;border:none;">
                    <iframe class="hoverModalVideo" id="hoverPlayer" src="https://www.youtube.com/embed/6a3vhKbJKAE?autoplay=1&loop=1&mute=1&controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="modal-body " id="modal-body"style=" border:none;">
                    <div class="hover-modal-btn-box">
                    	<form action="play" style="display: inline-block;">
                    		<input type="hidden" name="contentNo" id="hover-modal-play-btn">
                    		<input type="hidden" name="contentSeason" value="-1">
                    		<input type="hidden" name="contentEpisode" value="-1">
                    		<button type="submit" class="btn btn-outline-light hover-modal-etc-btn hover-modal-play-btn"><i class="fas fa-play"></i></button>
                    	</form>
	                    <button class="btn btn-outline-light hover-modal-etc-btn wish-delete-btn" id="modal-check-btn" style="display:none;"><i class="fas fa-check"></i></button>
						<button class="btn btn-outline-light hover-modal-etc-btn wish-insert-btn" id="modal-plus-btn"><i class="fas fa-plus"></i></button>
						<button class="btn btn-outline-light hover-modal-etc-btn like-insert-btn modal-thumbs-up" id="thumbs-up-empty2"><i class="far fa-thumbs-up"></i></button>
						<button class="btn btn-outline-light hover-modal-etc-btn like-delete-btn modal-thumbs-up" id="thumbs-up-full2" style="display:none;"><i class="fas fa-thumbs-up"></i></button>
						<button class="btn btn-outline-light hover-modal-etc-btn hover-modal-more-button" data-bs-toggle="modal" data-bs-target="#detailModal"><i class="fas fa-chevron-down"></i></button>
                    </div>
                    <div>
                    	<div class="modal-trailer-feature" style="margin-top:2%;">
								<div class="modal-feature-percent-text modal-trailer-feature-box"><span>64%</span><span>일치</span></div>
								<div id="content-release" class="modal-trailer-feature-box "></div>
								<div class="modal-trailer-feature-box"><img id="hover-content-limit" src="" width="25" height="25"> </div>
								<div class="modal-trailer-feature-box" id="hover-content-season"></div>
								<div class="modal-feature-border modal-trailer-feature-box">HD</div>
							</div>
                    	<div class="hover-modal-genre">
                    		
                    	</div>
                    	
                    </div>
                </div>
                
            </div>
        </div>
    </div>


	

	<div style="position: relative;top: -12vw;">
		<c:forEach var="sliderVO" items="${sliderList }" varStatus="status">
		<div class="slider-title container-center">${sliderVO.sliderTitle }</div>		
		<div class="custom-img-slide-box">
			<div class="container-center slider-box" id="slider1">
			  	<div class="custom-img-slide">
			   		<c:forEach var="contentListVO" items="${sliderList[status.index].contentList }" varStatus="stat">
						<div><img class="slider-img" src="${contentListVO.contentThumbnail }" data-contentNo="${contentListVO.contentNo }"></div>
					</c:forEach> 	  
		  		</div>
		  		</div>
			</div>
		</c:forEach> 	
	</div>	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>