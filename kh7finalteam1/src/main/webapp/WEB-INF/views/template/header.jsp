<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<link rel="stylesheet" href="res/css/help.css"/>
	<link rel="stylesheet" href="res/css/template.css"/>
	<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<!-- 	<link rel="stylesheet" type="text/css" href="/plugin/slick/slick.css"/> -->
	<!-- <link rel="stylesheet" type="text/css" href="https://slick/slick-theme.css"/> -->
 
	

	
	    
    <!-- Custom styles for this template -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!--     <script type="text/javascript" src="/plugin/slick/slick.js"></script> -->
    






<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Weflex</title>
</head>
<script>
	$(function(){
		$(document).ready(function() {
			
		      if (window.location.href == 'http://localhost:8080/finalteam1/tv') {
		          
		          $("#header").css("position","absolute");
		          /* $("#second-nav-bar").css("display","block");
		          $("#second-nav-bar").css("margin","block"); */
		          $("#second-nav-bar").addClass("show-second-nav-bar");
	          }
	      else{
	    	  $("#second-nav-bar").css("display","none");
	      } 
	    });
		
		$(window).on('scroll',function(){
			if($(window).scrollTop()){
				$('#header').removeClass('active-gradation').addClass('active-black'); 
				$('#second-nav-bar').removeClass('active-gradation2').addClass('active-black'); 
			}else{ 
			
				$('#header').removeClass('active-black').addClass('active-gradation');
				$('#second-nav-bar').removeClass('active-black').addClass('active-gradation2');
			}
		});
		
		$(window).on('scroll',function(){
			var windowTop=$(window).scrollTop();
			var contentTop=$("#second-nav-bar").offset().top;
			console.log(windowTop);
			console.log(contentTop);
			if(windowTop>contentTop){
				

				$('#second-nav-bar').css("margin-top","0"); 
				$('#second-nav-bar').css("position","fixed");
			}else{ 
				$('#second-nav-bar').css("margin-top","60px");  
				$('#second-nav-bar').css("position","absolute"); 
				
			} 
		});
		
		$("#search-icon").click(function(){
			if($("#input-box").css("display")=="none"){
				$("#input-box").show(500);
			}else{
				$("#input-box").hide(500);
			}
		});
		
		
		$("#profile-img").hover(function(){
			$(".dropdown-menu").show();
		});
		
		
	
	
		
	});
</script>
<style>

</style>
<body>
		<main>
		<div class="" >
		<nav class="navbar navbar-dark navbar-expand-sm nav-style" id="header">
			<ul class="navbar-nav" style="width: 8%; margin-left: 1%;">
				<li class="nav-item"> <a class="nav-link" href="../finalteam1/"><img src="res/img/weflex_logo.png" style="width: 100%;"></a> </li> 
			</ul>
			<ul class="navbar-nav" style="position: absolute;margin-left: 10%;" id="navbar1-ul">
				  <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/">홈</a> </li> 
				  <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/tv">TV프로그램</a> </li> 
				  <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/movie">영화</a> </li> 
				  <li class="nav-item"> <a class="nav-link" href="#">NEW! 요즘 대세 콘텐츠</a> </li>
				  <li class="nav-item"> <a class="nav-link" href="#">내가 찜한 콘텐츠</a> </li>	 
			</ul> 
			<ul class="navbar-nav" style="position: absolute;margin-left: 10%;">
				  <li class="nav-item dropdown"  id="navbar1-ul-dropdown">
         		 <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink1" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	메뉴
            	</a>       		
		          
		          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink1" id="react-dropdown-menu">
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/">홈</a></li>
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/tv">TV프로그램</a></li>
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/movie">영화</a></li>
		            <li><a class="dropdown-item" href="#">NEW! 요즘 대세 콘텐츠</a></li>
		            <li><a class="dropdown-item" href="#">내가 찜한 콘텐츠</a></li>
		          </ul>
		          
       		 	</li>
			</ul> 
			
			<div id="input-box" style="display:none; position:absolute; right:180px; margin-bottom:5px;">
				<form class="form-inline" action="">
					<input class="form-control mr-sm-3 search-box" type="text" placeholder="제목,사람,장르"> 
				</form> 
			</div>
			<ul class="navbar-nav nav-var-right" style="position:absolute; right:50px;">
				
			 	<li class="nav-item nav2-item"> <a class="nav-link" id="search-icon" href="#"><i class="fas fa-search fa-lg nav-emoji"></i></a> </li>
				<li class="nav-item nav2-item"> <a class="nav-link" href="#"><i class="fas fa-bell fa-lg nav-emoji"></i></a> </li>
				<li class="nav-item dropdown">
         		 <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            		<img src="res/img/profile.png" width="25px" height="25px" style="border-radius:15%;">
            	</a>       		
		          
		          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-dark dropdown-left" aria-labelledby="navbarDarkDropdownMenuLink">
		            <li><a class="dropdown-item" href="#">계정</a></li>
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/help">고객센터</a></li>
		            <li><a class="dropdown-item" href="#">로그아웃</a></li>
		          </ul>
		          
       		 	</li>		
  	
			</ul>
			

		</nav>
		
		


		

		
		</div>		
		<section>