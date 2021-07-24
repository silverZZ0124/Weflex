<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<link rel="stylesheet" href="res/css/help.css"/>
	<link rel="stylesheet" href="res/css/play.css"/>
	<link rel="stylesheet" href="res/css/template.css"/>
	<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="/plugin/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="https://slick/slick-theme.css"/>
 
	

	
	    
    <!-- Custom styles for this template -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script type="text/javascript" src="/plugin/slick/slick.js"></script>
    <script src="http://www.youtube.com/player_api"></script>
    <script src="https://www.youtube.com/iframe_api"></script>






<meta charset="UTF-8">

<title>Weflex</title>
</head>
<script>
	var player;
	var endFlag = false;
	
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
			var totalTime = player.getDuration() / 100 * 98; 
			var curTime = player.getCurrentTime();

			if(curTime >= totalTime){
				endFlag = true;
			}
			
		}
	
		onYouTubeIframeAPIReady();
	}
	
	window.onbeforeunload = function(){
		var curTime;
		
		if(endFlag)
			$.fn.insertWatchLog(0);
		else
			$.fn.insertWatchLog(parseInt(player.getCurrentTime()));
	}
 $(function(){
	 
	 var video=$("#page-video");
	 var videoDomObj = video.get(0);
	 var timer;
	 
	 $(document).ready(function() {
		 videoDomObj.muted=false;
		 
		 /* $(document).mousemove(function(event){
			 $("#go-back").css("display","block");
		 }); */
     });
	 
	 $("#playButton").click(function(){
		 videoDomObj.play();
		 $("#playButton").css("display","none");
		 $("#stopButton").css("display","block");
	 });
	 
	 $("#stopButton").click(function(){
		 videoDomObj.pause();
		 $("#playButton").css("display","block");
		 $("#stopButton").css("display","none");
	 });
	 
	//소리 재생 
	$("#sound-on").click(function(){
		videoDomObj.muted=true;
		$("#sound-off").css("display","block");
		$("#sound-on").css("display","none");
	});
	
	//음소거 
	$("#sound-off").click(function(){
		videoDomObj.muted=false;
		$("#sound-off").css("display","none");
		$("#sound-on").css("display","block");
	});
	
	 $("#video-top-nav").hover(function(){
		$("#go-back").css("display","block");
		$("#video-bottom-nav").css("display","block");
		

	},function(){
		$("#go-back").css("display","none");
		$("#video-bottom-nav").css("display","none");
	}); 
	 
	$("#video-bottom-nav").hover(function(){
			$(".video-bottom-nav-box").css("display","block");
			
	
		},function(){
			$(".video-bottom-nav-box").css("display","none");
		});  
	
	$("#full-screen").click(function(){
		videoDomObj.webkitRequestFullscreen();

	});
	 
	
	$("#go-back").click(function(){
		window.history.back();
	});

	$.fn.insertWatchLog = function(curTime){	
		
		$.ajax({
			url : "${pageContext.request.contextPath}/data/home/insertWatchLog",
			type : "post",
			dataType : "json",
			data : {clientNo: '${playlistVO.clientNo}',
					contentNo: '${playlistVO.contentNo}',
					watchLogSeason: '${playlistVO.contentSeason}',
					watchLogEpisode: '${playlistVO.contentEpisode}',
					watchLogPlaytime: curTime}							
		});
	};
		
 });
</script>


<body class="main-color fade-in no-scroll">
<div class="main-color play-video-box">
		<div class=" play-top-div">
			<button class="btn play-btn" id="go-back"><i class="fas fa-arrow-left fa-2x" style="color:white;"></i></button>
		</div>
		<div style="widht:100%;height:100%;">
			<iframe id="player" width="100%" height="100%" src="${playlistVO.contentUrl }?enablejsapi=1&start=${playlistVO.lastPlaytime }&autoplay=1&mute=0&controls=1&modestbranding=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
		<div class="main-color play-bottom-div" style="display:none;">
			<button class="btn play-btn" id="go-back"><i class="fas fa-arrow-left fa-2x" style="color:white;"></i></button>
		</div>
		
		<!-- <nav class="navbar navbar-dark navbar-expand-sm video-nav-style" id="video-bottom-nav">
            
            <div class="video-bottom-nav-box">
            <div style="display:flex;">
            <button type="button" id="playButton" class="btn play-btn" style="display:none;"><i class="fas fa-play fa-2x" style="color:white;"></i></button>
           	<button type="button" id="stopButton" class="btn play-btn"><i class="fas fa-pause fa-2x" style="color:white;"></i></button>
           	<button type="button" id="sound-on" class="btn play-btn"  ><i class="fas fa-volume-up fa-2x" style="color:white;"></i></button>
           	<button type="button" id="sound-off" class="btn play-btn" style="display:none;"><i class="fas fa-volume-mute fa-2x" style="color:white;"></i></button>
           	<button type="button" id="full-screen" class="btn play-btn"  ><i class="fas fa-expand fa-2x" style="color:white;"></i></button>
            </div>
            </div>
            
            <div id="defaultBar">
                <div id="progressBar"> </div>
            </div>
                
        </nav> -->
</div>
</body>














