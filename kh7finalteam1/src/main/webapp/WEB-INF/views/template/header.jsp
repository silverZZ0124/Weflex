<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
    <script src="http://www.youtube.com/player_api"></script>
    <script src="https://www.youtube.com/iframe_api"></script>






<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Weflex</title>

   

</head>

<script>
	$(function(){
		
		
		$(window).on('scroll',function(){
			if($(window).scrollTop()){
				$('#header').removeClass('active-gradation').addClass('active-black'); 
				$(".second-header").removeClass("active-gradation2").addClass("active-black");
			}else{ 
			
				$('#header').removeClass('active-black').addClass('active-gradation');
				$(".second-header").removeClass("active-black").addClass("active-gradation2");
			}
		});
		
		if(location.href==="http://localhost:8080/finalteam1/tv"){

			$(".tv-nav-style").css("display","block");
		}
		else if(location.href==="http://localhost:8080/finalteam1/movie"){
			$(".movie-nav-style").css("display","block");

		}
		else if(location.href==="http://localhost:8080/finalteam1/wishlist"){
			$(".wishlist-nav-style").css("display","block");
		}
		
		$("#search-icon").click(function(){
			if($("#input-box").css("display")=="none"){
				$("#input-box").show(500);
				$("input[name=keyword]").focus();
			}else{
				$("#input-box").hide(500);
			}
		});
		
		
		$("html").click(function(e){
			var keyword = $("input[name=keyword]").val();

			if(!keyword){
				if(!$(e.target).hasClass("search-div")){
					$("#input-box").hide(500);
				}	
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
			<ul class="navbar-nav nav-logo-ul" style="width: 120px;">
				<li class="nav-item"> <a class="nav-link logo-wrapper" href="../finalteam1/home"><img src="res/img/weflex_logo.png" style="width: 100%;"></a> </li> 
			</ul>
			<ul class="navbar-nav" style="position: absolute;margin-left: 160px;" id="navbar1-ul">
				  <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/home">홈</a> </li> 
				  <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/tv">TV프로그램</a> </li> 
				  <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/movie">영화</a> </li> 
				  <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/wishlist">내가 찜한 콘텐츠</a> </li>
				  <c:if test="${gradeNo > 3 }">	 
				  	<li class="nav-item"> <a class="nav-link" href="admin/">관리자 페이지</a> </li>
				  </c:if>	 
			</ul> 
			<ul class="navbar-nav" style="position: absolute;margin-left: 130px;">
				  <li class="nav-item dropdown"  id="navbar1-ul-dropdown">
         		 <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink1" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	메뉴
            	</a>       		
		          
		          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink1" id="react-dropdown-menu">
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/home">홈</a></li>
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/tv">TV프로그램</a></li>
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/movie">영화</a></li>
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/wishlist">내가 찜한 콘텐츠</a></li>
		            <c:if test="${gradeNo > 3 }">	 
				  	 <li><a class="dropdown-item" href="admin/">관리자 페이지</a></li>
				  </c:if>	
		            
		           
		           
		          </ul>
		          
       		 	</li>
			</ul> 
			

			<ul class="navbar-nav nav-var-right" style="margin-left: auto;padding-right: 0;">

				<li id="input-box" class="search-div">
					<form class="form-inline search-div" action="search" method="get" id="form-search">

						<input class="form-control mr-sm-3 search-box search-div" type="text" placeholder="제목, 사람, 장르" name="keyword" style="width:100%;"> 
			
					</form> 
				</li>


			 	<li class="nav-item nav2-item"> <a class="nav-link search-div" id="search-icon" href="#"><i class="fas fa-search fa-lg nav-emoji search-div"></i></a> </li>





				<li class="nav-item dropdown">
         		 <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="margin-bottom:3px;">
            		<img src="res/img/profile.png" width="25px" height="25px" style="border-radius:15%;">
            	</a>       		
		          
		          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-dark dropdown-left" aria-labelledby="navbarDarkDropdownMenuLink">
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/yourAccount">계정</a></li>
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/help">고객센터</a></li>
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
		          </ul>
		          
       		 	</li>		
  	
			</ul>

		</nav>
		
		<nav class="navbar navbar-dark navbar-expand-sm nav-style tv-nav-style second-header"style="display:none;z-index: 1;">
			
			<ul class="navbar-nav" style="position: absolute;height:100%;">
				  <li class="nav-item second-nav-title-text"><div>TV 프로그램</div> </li> 
				  <li class="nav-item second-nav-select-box"> 
					  <select class="selectpicker main-color tv-page-title-select-box" id="tv-genre-selectbox">
					      <option>장르</option>
					  </select> 
				  </li> 
				 
			</ul> 

		</nav>
		
		<nav class="navbar navbar-dark navbar-expand-sm nav-style movie-nav-style second-header"  style="display:none;z-index: 1;">
			
			<ul class="navbar-nav" style="position: absolute;height:100%;">
				  <li class="nav-item second-nav-title-text"><div style="width:100%;">영화</div> </li> 
				  <li class="nav-item second-nav-select-box"> 
					  <select class="selectpicker main-color tv-page-title-select-box" id="movie-genre-selectbox">
					      <option>장르</option>
					  </select> 
				  </li> 
				 
			</ul> 

		</nav>
		
		<nav class="navbar navbar-dark navbar-expand-sm nav-style wishlist-nav-style second-header" style="display:none;z-index: 1;">
			
			<ul class="navbar-nav" style="position: absolute;height:100%;">
				  <li class="nav-item second-nav-title-text"><div>내가 찜한 콘텐츠</div> </li> 
				  
			</ul> 

		</nav>
		


		

		
		</div>		
		<section>