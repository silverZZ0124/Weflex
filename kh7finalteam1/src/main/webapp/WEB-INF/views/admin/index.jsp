<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<style>
	.card-header{
	font-size : 2rem;
	}
	
	.fa-sm {
    font-size: .6em;
}



	.our-story-card{
		position: relative;
	    padding: 50px 5%;
	    margin-bottom: 0;
	        background: 0 0;
    color: #fff;
	}
	
	
	.animation-card .animation-card-container {
    max-width: 1100px;
    margin: 0 auto;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -moz-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -moz-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
}

	.animation-card.watchOnTv .our-story-card-text {
    margin: -5% 0;
    }
	
	.animation-card .our-story-card-text {
		width: 52%;
	    height: 100%;
	    -webkit-box-flex: 0;
	    -webkit-flex: 0 1 auto;
	    -moz-box-flex: 0;
	    -ms-flex: 0 1 auto;
	    flex: 0 1 auto;
	    padding: 0 3rem 0 0;
	    z-index: 3;
	
	}
	
	.our-story-card-subtitle, .our-story-card-text {
    font-size: 1.625rem;
    font-weight: 400;
	}
	
	.our-story-card-title {
    font-size: 3.125rem;
    line-height: 1.1;
    margin-bottom: .5rem;
    }
    
    .animation-card .our-story-card-img-container {
    width: 48%;
    height: 100%;
    -webkit-box-flex: 0;
    flex: 0 1 auto;
    box-sizing: border-box;
}

.animation-card .our-story-card-animation-container {
    position: relative;
    overflow: hidden;
    }

.animation-card.watchOnTv .our-story-card-animation-container {
    margin: -10% -5% -5% 0;
	}
	
	.animation-card.watchOnDevice .our-story-card-img, .animation-card.watchOnTv .our-story-card-img {
    position: relative;
    z-index: 2;
    }
    
    img {
    max-width: 100%;
    height: auto;
    border: 0;
    }
    
    .animation-card.watchOnTv .our-story-card-animation {
    width: 100%;
    height: 100%;
    max-width: 73%;
    max-height: 54%;
    position: absolute;
    top: 48.3%;
    left: 49.2%;
    transform: translate(-50%,-50%);
    }
    
    .animation-card.watchOnDevice .our-story-card-video, .animation-card.watchOnTv .our-story-card-video {
    width: 100%;
    height: 100%;
    }
    
    audio, canvas, progress, video {
    display: inline-block;
    vertical-align: baseline;
    }
    
</style>


                <!-- Begin Page Content -->
                <div class="container-fluid">
                
                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                              이번달 회원 증가 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${clientMonth}명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-user-plus fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-dark shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-uppercase mb-1" style="color:#5a5c69;">
                                                 올해 회원 증가 수(2021년)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${clientYear}명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-users fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

<!-- Earnings (Monthly) Card Example
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Tasks
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
 -->					
 						 <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                이번달 추가 된 컨텐츠 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${contentMonth}개</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-play fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
 					
 			
                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-danger shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-uppercase mb-1" style="color: #ea5f52;">
                                                올해 추가 된 컨텐츠 수(2021년)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${contentYear}개</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-video fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">매 월 회원 증가 수(2021년)</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">회원 연령별 분포도</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle" style="color:#4e82be;"></i> 10대
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle" style="color: #1cc88a"></i> 20대
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle" style="color:#36b9cc;"></i> 30대
                                        </span>
                                         <span class="mr-2">
                                            <i class="fas fa-circle" style="color:#db835c;"></i> 40대 이상
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                   <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">매 월 결제 수(2021년)</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
 
                 <!-- Content Row -->
                    <div class="row">
                    	<div class="col">
                        	<div class="card shadow mb-4">
				             <!--  
				             	<div class="card-header py-3">
											
				                     <h6 class="m-0 font-weight-bold text-primary">Top 5</h6>
				                </div>
				                -->
				             	<div class="card-body" style="background-color: black">
											
				             		<div class="our-story-card animation-card watchOnTv">
									<div class="animation-card-container">
										<div class="our-story-card-text">
											<h3 class="our-story-card-title">TV로 즐기세요.</h1>
											<h5 class="our-story-card-subtitle">스마트 TV, PlayStation, Xbox, Chromecast, Apple TV, 블루레이 플레이어 등 다양한 디바이스에서 시청하세요.</h2>
										</div>
									
									
									<div class="our-story-card-img-container">
										<div class="our-story-card-animation-container">
												<img alt class="our-story-card-img" src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/tv.png">
											<div class="our-story-card-animation">
											<video class="our-story-card-video" autoplay muted loop>
												<source src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/video-tv-0819.m4v" type="video/mp4">
											</video>
												<div class=""class="our-story-card-animation-text"></div>
											</div>
										</div>
				             		
	               				</div>
									<div class="center-pixel" style="position: absolute;"></div>
									
								</div>
	             		</div>
	             	</div>
	             	</div>

               	 </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

    <jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>