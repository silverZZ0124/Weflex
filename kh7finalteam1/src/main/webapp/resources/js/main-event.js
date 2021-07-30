$(function(){
	
	var detailModalPlayerReady = true;
	var seriesArray = new Array();
	var contentThumbnail;
	var curContentNo;
	
	$(document).on("hover",".search-page-card-img",function(){
		$(this).css("cursor","pointer");
	}); 
	
	var timeout;
	var modalX;
	var modalY;
	var img;
	//마우스 호버 시 모달 팝업 	
	$(document).on("mouseenter",".search-page-card-img",function(){
		curContentNo = $(this).attr("data-contentNo");	
		img = $(this); 
		timeout=setTimeout(function(){
			
			var modalWidth=img.width()*1.4;
			var modalVideoHeight=img.height()*1.4*1.05;
			

			$("#hoverModal").css("width",modalWidth+"px");
			$("#modal-header").css("height",modalVideoHeight+"px");
			
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
			
		$(".search-page-card-img").mouseleave(function(){
			clearTimeout(timeout);
		});
		
	
		$("#hoverModal").css("transform","translate3d("+modalX+"px,"+modalY+"px,0px)"); 	
		$("body").removeClass("modal-open");
		},1000);
				
	});
	

	
	
	$(".search-page-card-img").mouseleave(function(){
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
			url: "data/home/getHoverModalItem",
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
	
	$(document).mouseup(function (e){

		var container = $('#detailModal');
		if( container.has(e.target).length === 0){
		container.modal("hide");
		}
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
			url: "data/home/insertWishList",
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
			url: "data/home/deleteWishList",
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
			url: "data/home/insertLikeList",
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
			url: "data/home/deleteLikeList",
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
			url: "data/home/getContent",
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
					url: "data/home/insertWishList",
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
					url: "data/home/deleteWishList",
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