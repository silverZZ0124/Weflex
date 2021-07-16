<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/style.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<div class="container-fluid">

    <div class="container-fluid">

        <section class="ftco-section pt-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">컨텐츠 리스트</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-wrap">
                            <table class="table table-responsive-md">
                                <thead>
                                    <tr class="text-center">
                                        <th>컨텐츠 번호</th>
                                        <th>제목</th>
                                        <th>분류</th>
                                        <th>연령제한</th>
                                        <th>조회수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="alert" role="alert">
                                
                                        <!-- 컨텐츠 번호 들어갈 자리 -->
                                        <td>
                                            <span>${contentList.contentNo}</span>
                                        </td>
                                        
                                        <!-- 제목 들어갈 자리 -->
                                        <td class="d-flex align-items-center">
                                            <div>
                                                <img src="https://via.placeholder.com/120x60?text=P" width="100%"> 
                                            </div>
                                            <div class="pl-3 email">
                                                <span>블랙위도우</span>
                                                <span>개봉 : 2021-07-07</span>
                                            </div>
                                        </td>
                                        
                                        <!-- 컨텐츠 타입 들어갈 자리 -->
                                        <td>2021-07-07</td>
                                        
                                        <!-- 연령 제한  -->
                                        <!-- <td class="status"><span class="active">Active</span></td> -->
                                        <td class="status">15+</td>
                                        
                                        <!-- 조회수 -->
                                        <td>
                                            <!-- <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true"><i class="fa fa-close"></i></span>
                                            </button> -->
                                            ????
                                        </td>
                                      
                                    </tr>
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
    </div>
</div>
<!-- /.container-fluid -->


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>