<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
$(function(){
	
	$('.multiple-items').slick({
		slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
		infinite : true, 	//무한 반복 옵션	 
		slidesToShow : 6,		// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 6,		//스크롤 한번에 움직일 컨텐츠 개수
		speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
		//dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
		pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : false,		// 세로 방향 슬라이드 옵션
		//prevArrow : "<button type='button' class='slick-prev slick-btn'>p</button>",		// 이전 화살표 모양 설정
		prevArrow : "<img src='res/img/arrow_left.png'>",		// 이전 화살표 모양 설정
		nextArrow : "<img src='res/img/arrow_right.png'>",		// 다음 화살표 모양 설정
		//dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
		draggable : false, 	//드래그 가능 여부 
		
		responsive: [ // 반응형 웹 구현 옵션
			{  
				breakpoint: 960, //화면 사이즈 960px
				settings: {
					//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
					slidesToShow:3 
				} 
			},
			{ 
				breakpoint: 768, //화면 사이즈 768px
				settings: {	
					//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
					slidesToShow:2 
				} 
			}
		]
 
	});
	
		//마우스 호버 시 모달 팝업 	
		$(".slider-img").hover(function(){
			$(".hoverModal").show();
		},function(){
			$(".hoverModal").hide();    
		});

	});
	
		
		
	

</script>

<div class="main-color">
	<div class="main-trailer-video">
		<video width="100%" height="80%"  autoplay loop muted>
    		<source src="res/video/main_trailer1.mp4" type="video/mp4">
		</video>
	</div>
	<div>
	<div class="main-trailer-img">
	<img src="res/img/main_trailer_logo.png" style="width:70%;">
	</div>
	
	<div class="main-trailer-text">
	인디애나주의 작은 마을에서 행방불명된 소년. 이와 함께 미스터리한 힘을 가진 소녀가 나타나고, 마을에는 기묘한 현상들이 일어나기 시작한다. 아들을 찾으려는 엄마와 마을 사람들은 이제 정부의 일급비밀 실험의 실체와 무시무시한 기묘한 현상들에 맞서야 한다.
	</div>
	
	<div class="main-btn-box">
	<button class="btn btn-light main-btn" ><i class="fas fa-play"></i>&ensp;&ensp;재생</button>
	<button class="btn btn-secondary main-btn" data-bs-toggle="modal" data-bs-target="#detailModal" style="margin-left:10px;opacity:0.7;"><i class="fas fa-info-circle"></i>&ensp;상세 정보</button>
	</div>
	
	</div>

	<!-- 상세 정보 클릭시 팝업 모달 -->
	<div class="modal fade " id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="detailModalLabel">Modal title</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        
	      </div>
	    </div>
	  </div>
	</div>


	<div style="margin-top:3%;">
		<div class="container-center slider-box">
			<div class="slider-title">보고 또 봐도 좋은 명작 TV 프로그램</div>
			 
	  	 <div class="multiple-items">
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
  		
	  		<!-- 호버시 팝업될 창 -->
		<div class="hoverModal modal" >
			<div class="modalBox modal-dialog modal-dialog-centered modal-sm" style="background-color:gray; ">
				호버 모달 내용 . . .
				해당이미지 위에 모달 띄우기 
			</div>
		</div>
  		
	
		</div>
		<div class="container-center slider-box">
			<div class="slider-title">회원이름 님이 시청중인 콘텐츠</div>
			 
	  	 <div class="multiple-items">
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
			 
	  	 <div class="multiple-items">
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
			 
	  	 <div class="multiple-items">
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
		
		<div>00님이 시청 중인 콘텐츠</div>
		<div>보고 또 봐도 좋은 명작 TV 프로그램</div>
		<div>00님이 시청 중인 콘텐츠</div>
		<div>보고 또 봐도 좋은 명작 TV 프로그램</div>
		<div>00님이 시청 중인 콘텐츠</div>
		<div>보고 또 봐도 좋은 명작 TV 프로그램</div>
		<div>00님이 시청 중인 콘텐츠</div>
		<div>보고 또 봐도 좋은 명작 TV 프로그램</div>
		<div>00님이 시청 중인 콘텐츠</div>
		<div>보고 또 봐도 좋은 명작 TV 프로그램</div>
		<div>00님이 시청 중인 콘텐츠</div>
		
		<div>보고 또 봐도 좋은 명작 TV 프로그램</div>
		<div>00님이 시청 중인 콘텐츠</div>
		<div>보고 또 봐도 좋은 명작 TV 프로그램</div>
		<div>00님이 시청 중인 콘텐츠</div>
		<div>보고 또 봐도 좋은 명작 TV 프로그램</div>
		<div>00님이 시청 중인 콘텐츠</div>
		<div>보고 또 봐도 좋은 명작 TV 프로그램</div>
		<div>00님이 시청 중인 콘텐츠</div>
		<div>보고 또 봐도 좋은 명작 TV 프로그램</div>
		<div>00님이 시청 중인 콘텐츠</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>