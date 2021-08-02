<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WeFlex Setting</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/res/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/res/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Bootstrap core JavaScript(jQuery)-->
  	<script src="${pageContext.request.contextPath}/res/vendor/jquery/jquery.min.js"></script>
  	
	<!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/res/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">	
	
	<!-- Bootstrap core JavaScript-->
	<script src="${pageContext.request.contextPath}/res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/res/vendor/jquery-easing/jquery.easing.min.js"></script>
	
	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/res/js/sb-admin-2.min.js"></script>
	
 
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath }/admin/">
               
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-cogs"></i>
                </div>
                <div class="sidebar-brand-text mx-3">
					<img alt="weflex-logo" src="${pageContext.request.contextPath }/res/img/weflex_logo.png" style="width:100%;" id="weflex-logo">
				</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">
            
             <!-- Heading -->
            <div class="sidebar-heading">
                Admin
            </div>
            
             <!-- Nav Item - Dashboard -->
             <li class="nav-item active">	
             <a class="nav-link" href="${pageContext.request.contextPath}/home">
                   <i class="fas fa-fw fa-home"></i>
                    <span>메인 페이지</span></a>

            <li class="nav-item active">	
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/">
                    <i class="fas fa-fw fa-user-cog"></i>
                    <span>관리자</span></a>
            
            
            <li class="nav-item active">	
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-bullhorn"></i>
                    <span>공지사항</span></a>
                    
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseContent"
                    	aria-expanded="true" aria-controls="collapseContent">
                   		<i class="fas fa-fw fa-list-alt"></i>
                   		 <span>컨텐츠 관리</span>
                    </a>
                    <div id="collapseContent" class="collapse" aria-labelledby="headingContent" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Content:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/content/">컨텐츠 리스트</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/content/contentRegist">컨텐츠 추가</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/genre">장르 추가</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/feature">특징 추가</a>
                    </div>
                </div>
                    
                      <a class="nav-link" href="${pageContext.request.contextPath}/admin/clientAdmin">
                   <i class="fas fa-fw fa-user-cog"></i>
                    <span>회원 관리</span></a>
                    
                      <a class="nav-link" href="#">
                   <i class="fas fa-fw fa-user"></i>
                    <span>고객센터 관리</span></a>       
                    
                     <a class="nav-link" href="${pageContext.request.contextPath}/admin/homeSetting">
                   <i class="fas fa-fw fa-desktop"></i>
                    <span>홈 화면 설정</span></a>           
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline mt-5">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

           <%--  <!-- Sidebar Message   -->
            <div class="sidebar-card d-none d-lg-flex">
                <div style="padding:1em 2em 1em 2em"><img class="sidebar-card-illustration mb-2" src="${pageContext.request.contextPath }/res/img/weflex_logo.png" alt="..." style="width: 100%;"></div>
                <p class="text-center mb-2"><strong>위플랙스</strong>는 TV 프로그램과 영화를 인터넷 연결 지원 디바이스에서 광고 없이 시청할 수 있는 멤버십 기반 스트리밍 서비스입니다.</p>
                <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/">Go! Weflex</a>
            </div> --%>
         

        </ul>
        <!-- End of Sidebar -->
        