<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:set var="isYseries" value=""></c:set> --%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
var player;

window.onload = function(){			
	
	function onYouTubeIframeAPIReady() {
	    player = new YT.Player('player', {
	        events: {	  
	        	'onReady': onPlayerReady,
	            'onStateChange': onPlayerStateChange
	          }
	    });
	}		
	
	function onPlayerReady(event) {
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
					breakpoint: 1150,
					settings: {
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:5,
						slidesToScroll : 5
					} 
				},
				
				{  
					breakpoint: 960, //화면 사이즈 960px
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
			
			img = $(this);
			timeout=setTimeout(function(){
				$("#hoverModal").modal({backdrop: false});
				$("#hoverModal").modal("show");
				var imgX=img.offset().left;
				var imgY=img.offset().top;
				
				var imgMiddleX=imgX+(img.width()/2);
				var imgMiddleY=imgY+(img.height()/2);
				
				modalX=imgMiddleX-$("#hoverModal").width()/2;
				modalY=imgMiddleY-$("#hoverModal").height()/2;

				if(modalX<0) modalX=10;
				if((modalX+$("#hoverModal").width())>$(window).width()){
					modalX=$(window).width()-$("#hoverModal").width()-10;
				}
			
				
			$(".slider-img").mouseleave(function(){
				clearTimeout(timeout);
			});
			
		
			$("#hoverModal").css("transform","translate3d("+modalX+"px,"+modalY+"px,0px)"); 	
			$("body").removeClass("modal-open");
			},1000);
			
			
					
		});
		
		
		
		$(".slider-img").mouseleave(function(){
			$("#hoverModal").modal("hide");
		});
		
		$("#hoverModal").mouseleave(function(){
			$("#hoverModal").modal("hide");
	
		});
		
		$("#hoverModal").on("show.bs.modal",function(){
			$("body").addClass("overflow-scroll");
			/* $("#hoverModal").css("display", "none");
			$(".modal-backdrop").css("display","none"); */
		});

		$("#hoverModal").on("shown.bs.modal",function(){
			
			//$("#hoverModal").css("display", "block");
		});
		$("#hoverModal").on("hide.bs.modal",function(){
			$("body").removeClass("overflow-scroll");

			
		});
		
		
		
		//슬릭 호버 시 화살표 보임 
		 $(".slick-slider").hover(function(){
			var arrow=$(this).find(".arrow-img-left");
			 
			var X=$(this).offset().left;
			var Y=$(this).offset().top;

			
			var middleY=Y+$(this).height()/2;

			var arrowY=(middleY-arrow.height()/2)-Y;
			
			var minusX=(X/3)*2*(-1);
	
			arrow.offset().top=arrowY;
			arrow.css("left",minusX+"px");	
			arrow.css("top",arrowY+"px"); 
			arrow.css("width",(X/3)*2+"px");
			arrow.css("visibility","visible");

		},function(){
			 var arrow=$(this).find(".arrow-img");
			arrow.css("visibility","hidden");  
		}); 
		
		 $(".slick-slider").hover(function(){
				var arrow=$(this).find(".arrow-img-right");
				 
				var X=$(this).offset().left;
				var totalX=X+$(this).width();
				var Y=$(this).offset().top;

				var middleY=Y+$(this).height()/2;

				var arrowWidth=$(window).width()-totalX;
				var arrowY=(middleY-arrow.height()/2)-Y;
				var arrowRight=(arrowWidth/3)*2;

				arrow.offset().top=arrowY;
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
		$("#plus-btn").click(function(){
			$("#plus-btn").css("display","none");
			$("#check-btn").css("display","block");
		});
		
		//체크 누르면 +
		$("#check-btn").click(function(){
			$("#plus-btn").css("display","block");
			$("#check-btn").css("display","none");
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
			
			var el = $(e.relatedTarget);
			var contentNo = el.attr("data-contentno");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/data/home/getContent",
				type: "post",
				dataType: "json",
				data: {
					contentNo: contentNo	
				},
				success:function(resp){

				 	$("#player").css("visibility", "hidden");
				 	var youtubeId = resp.contentDto.contentTrailer.substring(30);
 					var url = resp.contentDto.contentTrailer + "?enablejsapi=1&start=00&autoplay=1&mute=1&controls=0&modestbranding=1&loop=1&playlist="+youtubeId;
 					$("#player").attr("src", url);
 					
 					$("#input-content-no").val(resp.contentDto.contentNo);
 					$("#content-logo").attr("src", resp.contentDto.contentLogo);
 					$("#content-info").text(resp.contentDto.contentInfo);
 					$("#content-release").text(resp.contentDto.contentRelease);
 					$(".content-limit").text(" "+resp.contentDto.contentLimit+"+");
 					
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

				}
			});
		});
		
		$("#detailModal").on("shown.bs.modal",function(e){
			$("#player").css("visibility", "visible");
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
		
		$(".hover-modal-play-btn").click(function(){
			location.href="play";
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

	});

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
	<div class="modal fade " id="detailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg detail-modal">
	    <div class="modal-content">
	     
	      <div class="modal-body main-color" style="padding:0px; border:none;">
			<button type="button" class="btn-close btn-close-white modal-close-btn" data-bs-dismiss="modal" aria-label="Close"></button>
			<div style="position:relative;" class="detail-modal-video-box">
	        	<!-- <video width="100%" height="80%"  autoplay loop muted  style="z-index:-5"> -->

	        	<iframe id="player" width="100%" height="100%" src="https://www.youtube.com/embed/6qaW-KZpmjM?enablejsapi=1&start=00&autoplay=1&mute=0&controls=1&modestbranding=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>

				<div class="modal-gradation-box">&ensp;&ensp;</div>
				
				  <div class="modal-trailer-over-box">	
					<div class="main-trailer-img">

						<img id="content-logo" src="" style="width:100%;">

					</div>
					<div class="modal-btn-box">
						<form action="play" style="display: inline-block;">
							<input type="hidden" id="input-content-no" name="contentNo">
							<button class="btn btn-light modal-play-btn" ><i class="fas fa-play"></i>&ensp;&ensp;재생</button>
						</form>										
						<button class="btn btn-outline-light modal-etc-btn" id="check-btn" style="display:none;"><i class="fas fa-check"></i></button>
						<button class="btn btn-outline-light modal-etc-btn" id="plus-btn"><i class="fas fa-plus"></i></button>
						<button class="btn btn-outline-light modal-etc-btn"><i class="far fa-thumbs-up"></i></button>
						<button class="btn btn-outline-light modal-etc-btn"><i class="far fa-thumbs-down"></i></button>
					</div>
				
			</div>
	        </div>
	        
	      
				
	        
	       <!--  <div class="modal-trailer-over-box">
				<div class="main-trailer-img">
				<img src="https://occ-0-988-1007.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABQf8iUunOQO0mlUgvOOACXLBSSb5VxGX1hOUMKP42LZ7XVzKWCJsHgCig5B4SYtgoaXqAqfPb1CnZMBEfvCF7GIu0jOzzACNGqtUb_l9xrJQQJGFjfVUJnQxp8cgtnhq9w3dvTlRKGYO6y5_OZm5mbP-NjwBQ5Q8qpwhAD1RUC1E.webp?r=034" style="width:100%;">
				</div>
				<div class="modal-btn-box">
				<button class="btn btn-light modal-play-btn" ><i class="fas fa-play"></i>&ensp;&ensp;재생</button>
				<button class="btn btn-outline-light modal-etc-btn" id="check-btn" style="display:none;"><i class="fas fa-check"></i></button>
				<button class="btn btn-outline-light modal-etc-btn" id="plus-btn"><i class="fas fa-plus"></i></button>
				<button class="btn btn-outline-light modal-etc-btn"><i class="far fa-thumbs-up"></i></button>
				<button class="btn btn-outline-light modal-etc-btn"><i class="far fa-thumbs-down"></i></button>
				</div>
			
			</div> -->
			
			<div class="modal-body-box">
					<div class="modal-trailer-info-box">
						<div style="max-width:60%;">
							<div class="modal-trailer-feature">
								<div class="modal-feature-percent-text modal-trailer-feature-box"><span>64%</span><span>일치</span></div>
								<div id="content-release" class="modal-trailer-feature-box "></div>
								<div class="modal-trailer-feature-box content-limit"></div>
								<div class="modal-trailer-feature-box">시즌 3개</div>
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
			        			
			        			<select class="selectpicker main-color series-select-box-title">
								    
								      <option>시즌1</option>
								      <option>시즌2</option>
								      <option>시즌3</option>
								  	  <option data-divider="true"></option>
								      <option>전체 회차 표시</option>
								      
								  
								  </select>
			        		</div>
			        	</div>
			        			<c:forEach var="i" begin="1" end="9" step="1"> <!-- 회차수만큼 반복 -->
			        				
									<div class="trailer-series-section-box" >
							        <div class="trailer-series-section">
							        	<div class="trailer-series-section-index">${i}</div>
							        	<div class="trailer-series-section-thumbnail-box">
							        		<img src="https://occ-0-988-1007.1.nflxso.net/dnm/api/v6/9pS1daC2n6UGc3dUogvWIPMR_OU/AAAABYlNPB0ZkssHuy-ssQNE9R7eqCObZ3Kb9Hbe3UhfSjm1W2_v4pBPQt45taoKeGYUVkB-CFqzP4tTwoordt3VPeBEJBK9Dn3OZmxa-GcwfQ1HxVW8.webp?r=9e5"  class="trailer-series-section-thumbnail">
							        		<button class="btn btn-outline-light modal-etc-btn series-play-btn" style="display:none;"><i class="fas fa-play"></i></button>
							        	</div>
							        	
							        	<div class="trailer-series-section-info-box">
							        		<div class="trailer-series-section-info-title">
							        			<div>제${i}장 어쩌구저쩌구</div>
							        			<div style="margin-left: auto;">(시간)분</div>
							        		</div>
							        		<div class="trailer-series-section-info-text">회차 설명 ddddddddd회차 설명 ddddddddd회차 설명 ddddddddd회차 설명 ddddddddd회차 설명 ddddddddd회차 설명 대충 두줄</div>
							        		
							        	</div>
							        </div>   
						        </div>
								</c:forEach>
					        	
				        </div>
				       <%--  </c:if> --%>
				       
				       <div class="similar-contents-box">
				       		<h3 style="margin-bottom:2%">비슷한 콘텐츠</h3>
				       		<c:set var="wallpaperNo" value="12" /> <!-- 비슷한 콘텐츠 수 받아오기(12개 고정) -->
				       		<div style="display:flex; flex-wrap:wrap;">
				       			
				       			<c:forEach var="i" begin="1" end="${wallpaperNo}" step="1">
				       				
											<div class="similar-contents-detail-box">
					       					<div class="similar-contents-detail-img-box">
					       						<img class="similar-contents-detail-img"src="https://occ-0-988-1007.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABWbhnfZaOzPIyEiVP-se8Ijsy4-W38jRqFzWQ_y9EXrd3iCyOlhsIJ1v30XBp_xdXQJTBo9TQeLs5iLJcHSN4SnqAZXshQnahJXpBwm_XsEJdrRmoRJDrGGd1biF.jpg?r=a95" >
					       						<button class="btn btn-outline-light modal-etc-btn modal-wallpaper-play-btn" style="display:none;"><i class="fas fa-play"></i></button>
					       					</div>
					       					<div class="similar-contents-detail-text-box">
					       						<div style="display:flex;">
					       							<div>
					       							<div class="modal-feature-percent-text"><span>64%</span><span>일치</span></div>
					       							<div>2020</div>
						       						</div>
						       						<button class="btn btn-outline-light modal-etc-btn modal-wallpaper-plus-btn"><i class="fas fa-plus"></i></button>
					       						</div>
					       						<div class="modal-wallpaper-text">
					       							세상을 차단하고 방 안에 틀어박힌 10대 소년. 현수가 세상 밖으로 나온다. 인간이 괴물로 변했다. 그래도 살아야 한다. 아직은 사람이니까. 이웃들과 함께 싸워야 한다.
					       						</div>
					       					</div>
					       				</div>
					       			
					       				
									
				       			</c:forEach>
				       			
				       		</div>
				       		
				       </div>
				       
				       <div style="position: absolute;width: 95%;">
				       <div class="modal-second-gradation-box">&ensp;&ensp;</div>
				       <div class="modal-contents-detail-info" >
				       		
				       		<div class="modal-cotents-detail-btn" style="display:flex;">
					       		<button class="btn btn-outline-light modal-etc-btn wallpaper-more-button "><i class="fas fa-chevron-down"></i></button>
					       		<button class="btn btn-outline-light modal-etc-btn wallpaper-less-button " style="display:none;"><i class="fas fa-chevron-up"></i></button>
					       	</div>
				       		<h3 style="margin-bottom:2%">작품이름 상세 정보</h3>
				       		<div >
				       			<!-- <div class="modal-contents-detail-info-text"><span style="color: #777;">감독:</span><span>aa</span></div> -->
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">출연:</span><span class="content-cast"></span></div>
				       			<!-- <div class="modal-contents-detail-info-text"><span style="color: #777;">각본:</span><span></span></div> -->
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">장르:</span><span class="content-genre"></span></div>
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">영화 특징:</span><span class="content-cast"></span></div>
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">관람 등급:</span><span class="content-limit"></span></div>				       			
	       			
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
               
                <div class="modal-header" style="padding:0;display:flex;border:none;">
                    <iframe class="hoverModalVideo" src="https://www.youtube.com/embed/6a3vhKbJKAE?autoplay=1&loop=1&mute=1&controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="modal-body " style=" border:none;">
                    <div class="hover-modal-btn-box">
                    	<button class="btn btn-outline-light modal-etc-btn hover-modal-play-btn"><i class="fas fa-play"></i></button>
	                    <button class="btn btn-outline-light modal-etc-btn" id="modal-check-btn" style="display:none;"><i class="fas fa-check"></i></button>
						<button class="btn btn-outline-light modal-etc-btn" id="modal-plus-btn"><i class="fas fa-plus"></i></button>
						<button class="btn btn-outline-light modal-etc-btn"><i class="far fa-thumbs-up"></i></button>
						<button class="btn btn-outline-light modal-etc-btn"><i class="far fa-thumbs-down"></i></button>
						<button class="btn btn-outline-light modal-etc-btn hover-modal-more-button "data-bs-toggle="modal" data-bs-target="#detailModal"><i class="fas fa-chevron-down"></i></button>
                    </div>
                </div>
                
            </div>
        </div>
    </div>


	

	<div style="position: relative;top: -12vw;">
	
		<div class="container-center slider-box">
			<div class="slider-title">보고 또 봐도 좋은 명작 TV 프로그램</div>
		
		  	 <div class="custom-img-slide">
	   			<!-- <div class="test2"><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
	   			<div class="test2"><img src="res/img/slider_img2.png" class="slider-img"></div>
	   			<div class="test2"><img src="res/img/slider_img3.png" class="slider-img"></div>
	   			<div class="test2"><img src="res/img/slider_img4.png" class="slider-img"></div>
	   			<div class="test2"><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
	   			<div class="test2"><img src="res/img/slider_img2.png" class="slider-img"></div>
	   			<div class="test2"><img src="res/img/slider_img3.png" class="slider-img"></div>
	   			<div class="test2"><img src="res/img/slider_img4.png" class="slider-img"></div>
	   			<div class="test2"><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
	   			<div class="test2"><img src="res/img/slider_img2.png" class="slider-img"></div>
	   			<div class="test2"><img src="res/img/slider_img3.png" class="slider-img"></div>
	   			<div class="test2"><img src="res/img/slider_img4.png" class="slider-img"></div>
	   			<div class="test2"><img src="res/img/slider_img1.jpeg" class="slider-img"></div> 
	   		 -->
		   		<c:forEach var="i" begin="1" end="10" step="1">
					<div><img src="res/img/slider_img${i}.png" class="slider-img"></div>
				</c:forEach> 
	  
	  		</div>
		</div>
		
		<div class="container-center slider-box">
			<div class="slider-title">회원이름 님이 시청중인 콘텐츠</div>
			 
	  	 <div class="custom-img-slide">
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			<div><img src="res/img/slider_img2.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img3.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img4.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			<div><img src="res/img/slider_img2.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img3.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img4.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			<div><img src="res/img/slider_img2.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img3.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img4.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			
   			
          
  		</div>
	
		</div>
		<div class="container-center slider-box">
			<div class="slider-title">보고 또 봐도 좋은 명작 TV 프로그램</div>
			 
	  	 <div class="custom-img-slide">
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			<div><img src="res/img/slider_img2.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img3.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img4.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			<div><img src="res/img/slider_img2.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img3.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img4.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			<div><img src="res/img/slider_img2.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img3.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img4.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			
   			
          
  		</div>
	
		</div>
		<div class="container-center slider-box">
			<div class="slider-title">회원이름 님이 시청중인 콘텐츠</div>
			 
	  	 <div class="custom-img-slide">
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			<div><img src="res/img/slider_img2.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img3.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img4.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			<div><img src="res/img/slider_img2.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img3.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img4.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			<div><img src="res/img/slider_img2.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img3.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img4.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			
   			
          
  		</div>
	
		</div>
		
		<div class="container-center slider-box">
			<div class="slider-title">회원이름 님이 시청중인 콘텐츠</div>
			 
	  	 <div class="custom-img-slide">
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			<div><img src="res/img/slider_img2.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img3.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img4.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			<div><img src="res/img/slider_img2.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img3.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img4.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			<div><img src="res/img/slider_img2.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img3.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img4.png" class="slider-img"></div>
   			<div><img src="res/img/slider_img1.jpeg" class="slider-img"></div>
   			
   			
          
  		</div>
	
		</div>
		
		
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

