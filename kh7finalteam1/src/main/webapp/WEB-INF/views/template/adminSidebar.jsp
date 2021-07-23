<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>NetFlix Setting</title>

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
                	<img alt="weflex-logo" src="${pageContext.request.contextPath }/res/img/weflex_logo.png" style="width: 100%;">
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
                        <a class="collapse-item" href="forgot-password.html">배우 추가</a>
                    </div>
                </div>
                    
                    <a class="nav-link" href="#">
                   <i class="fas fa-fw fa-user"></i>
                    <span>고객센터 관리</span></a>
                    
                      <a class="nav-link" href="${pageContext.request.contextPath}/admin/clientAdmin">
                   <i class="fas fa-fw fa-user-cog"></i>
                    <span>회원 관리</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Components</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="buttons.html">Buttons</a>
                        <a class="collapse-item" href="cards.html">Cards</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Utilities</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message   -->
            <div class="sidebar-card d-none d-lg-flex">
                <div style="padding:1em 2em 1em 2em"><img class="sidebar-card-illustration mb-2" src="${pageContext.request.contextPath }/res/img/weflex_logo.png" alt="..." style="width: 100%;"></div>
                <p class="text-center mb-2"><strong>위플랙스</strong>는 TV 프로그램과 영화를 인터넷 연결 지원 디바이스에서 광고 없이 시청할 수 있는 멤버십 기반 스트리밍 서비스입니다.</p>
                <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/">Go! Weflex</a>
            </div>
         

        </ul>
        <!-- End of Sidebar -->