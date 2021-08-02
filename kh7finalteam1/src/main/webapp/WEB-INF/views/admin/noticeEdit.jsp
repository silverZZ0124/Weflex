<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>   

	<style>
		.form-textarea{
            min-height: 150px;
            max-height: 400px;
        }
	</style>
		<section class="ftco-section pt-5">
 			<div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">공지 신규 작성</h2>
                </div>
            </div>	</section>
<div class="container-fluid">
        <div class="row mt-3">
            <div class="col-md-6 offset-md-3">
            <form action="noticeEdit" method="post" class="form" id="form-regist">	
				<div class="form-group"> 
                    <label>제목</label>
                    <input type="text" name="noticeName" class="form-control" value="${noticeVo.noticeName}" required>
                    <label>내용</label>
                    <textarea rows="10" cols="50" name="noticeWrite" class="form-control" value="${noticeVo.noticeWrite}" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary btn-block">등록</button>
                <button type="reset" class="btn btn-secondary btn-block">취소</button>

            </form>
        </div>
	</div>
</div>
	
    <jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>