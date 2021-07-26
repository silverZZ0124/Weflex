<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include> 
   <style>
        .form-control{
            display: inline-block;
            width: 80%;
        }

        .card-body{
          margin-bottom: -1rem;
          text-align: center;
        }

        .btn{
        vertical-align: baseline;
        margin-top : 5px;
        }

        .head-regist{
            margin-bottom: 0;
        }
    </style>

<script>
$(function(){
    
    $('.btnAdd').click(function () {                                        
        $('.buttons').append (                        
            '<input type="text" name="castName" class="form-control" required> <button type="button" class="btnRemove btn btn-outline-danger">삭제</button><br><br>'           
        ); 

        $('.btnRemove').on('click', function () { 
            $(this).prev().remove (); // remove the textbox
            $(this).next ().remove (); // remove the <br>
            $(this).next ().remove (); // remove the <br>
            $(this).remove (); // remove the button
		});
	});
});
</script>

<div class = "container-fluid">

        <div class="row mt-3">
            <div class="col-md-6 offset-sm-3">  
                <div class="card">
                    <form class="form" action="castRegist" method="post">
                    <div class="card-header"> 
                           <h5 class="head-regist">배우명 등록</h5>
                    </div>
                    
                        <div class="card-body">
                            <div class="buttons">            
                                <input type="text" name="castName" class="form-control" required> <button type="button" class="btnAdd btn btn-outline-success">추가</button><br><br>
                            </div>
                        </div>

                       <div class="card-footer text-right">
                            <button type="submit" class="btn btn-primary">등록</button>
                            <button type="reset" class="btn btn-secondary">Reset</button>
                        </div>    
                </form>
            </div>
            </div>
        </div>
    </div>




<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>