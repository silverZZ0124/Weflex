<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/node.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/help-footer.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css">
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/2.0.0/toastui-editor.min.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/res/js/help-footer.js"></script>  
	
	  
	<title>node title here</title>
	
</head>

<body>	
	<!-- 내용 부분 -->
	<div class="container-fluid global-container">
		<!-- global header 부분 -->
		<div class="global-header">
			<div class="d-flex inner-container">
				<div class="d-flex branding">
					<a class="logo" href="#">
						<img class="mainLogo" src="${pageContext.request.contextPath}/res/img/weflex_logo.png" >
						<img class="subLogo" src="${pageContext.request.contextPath}/res/img/n_logo.png" width="32px" height="32px">
					</a>
					
					<a class="custom-a-tag helpcenter-logo" href="${pageContext.request.contextPath}/help">고객 센터</a>
				</div>
				<div class="actions">
					<div class="ms-auto">
						<a class="custom-a-tag account-dropdown" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false" >
							${clientName } 							
						</a>
						<ul class="dropdown-menu dropdown-menu-end cumstom-help-dropdown" aria-labelledby="navbarDarkDropdownMenuLink" >
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/yourAccount">계정</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">넷플릭스에서 로그아웃</a></li>						
						</ul>
					</div>
				</div>
			</div>
			
			<div class="logo-wrapper">
				<a class="custom-a-tag" href="${pageContext.request.contextPath}/help">고객 센터</a>
			</div>
		</div>
		
		<!-- global content 부분 -->
		<div class="global-content">
			<div class="inner-container">
				<div class="breadcrumb-container">
					<ul class="help-center-breadcrumb">
						<li><a href="${pageContext.request.contextPath}/help">
							<i class="fas fa-arrow-left" 
								style="margin-right: 12px;
							    font-weight: 500;
							    font-size: 11px;
							    line-height: -253px;
							    top: -2px;
							    display: inline-block;
							    position: relative;">
						    </i>고객 센터 홈으로 돌아가기</a></li>
					</ul>
				</div>
				<h1 class="help-board-title"></h1>
				
				<div class="pane-wrapper">
					<div class="left-pane" id="left-pane">
						<div id="left-pane-content">
						</div>
						
						<div id="article-feedback-container">
							<div class="article-feedback">
								<div class="feedback-prompt">
									<div class="feedback-header">
										이 문서가 도움이 되었나요?
									</div>
									<div class="prompt-buttons">
										<button class="btn btn-secondary">예</button>
										<button class="btn btn-secondary">아니요</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="right-pane">
						<div class="wrapper page-block">
							<h3>추천 문서</h3>
							<ul class="related-articles">
								<li class="related-article">
									<a href="#">멤버십 변경 방법</a>
								</li>
								<li class="related-article">
									<a href="#">넷플릭스 소개</a>
								</li>
								<li class="related-article">
									<a href="#">청구 및 결제</a>
								</li>
								<li class="related-article">
									<a href="#">넷플릭스 요금을 결제하는 방법</a>
								</li>
								<li class="related-article">
									<a href="#">넷플릭스를 해지하려면 어떻게 해야 하나요?</a>
								</li>
							</ul>
						</div>
					</div>					
				</div>
			</div>
		</div>
			
		<div class="footer-push"></div>	
	</div>
	
	<script src="https://uicdn.toast.com/editor/2.0.0/toastui-editor-all.min.js"></script>
	
	<script>

        /* eslint-disable no-unused-vars */
        
        $(function(){
        	$(".help-board-title").text("${qnaBoardDto.qnaBoardTitle}");
        });
        
        var content= `${qnaBoardDto.qnaBoardContent}` || "";
        
        var viewer = toastui.Editor.factory({
            el: document.querySelector('#left-pane-content'),
            viewer: true,
            height: '500px',
            initialValue: content
        });
        
    </script>
	
<!-- 	 -->
	
<%@include file="help-footer.jsp" %>