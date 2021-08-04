<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>   


<style>
	.form-textarea{
           min-height: 150px;
           max-height: 400px;
       }
       label{
		color:#141414;
	}
</style>
	
	<script>
	
    $(function(){
        $("#form-regist").submit(function(e){
            e.preventDefault();
            
            var form = this;
            //console.log(form);
	            
	         if($("#season").val() == 'Y'){
		            $("#yes-Modal").modal("show");
		        
		            $("#content-form-yes").submit(function (e){
		            	 e.preventDefault();
		               
		            	 var formdata = $(this).serialize();
		                //console.log(formdata);
	
	                $.ajax({
	                        url : "${pageContext.request.contextPath}/data/admin/series/yes",
	                        type : "post",
	                        data:formdata,
	                        success:function(resp){
	                        	//console.log(resp)
	                            $("#yes-Modal").modal("hide");
	                        	//$(form).submit();//submit 이벤트를 발생시키는 명령(트리거)
	                        	form.submit();//form 객체를 전송시키는 명령
	                            }
	                        });
	                });
	        } 
	         else if($("#season").val() == 'N'){
	        	 	$("#no-Modal").modal("show");
	        	
		        	 $("#content-form-no").submit(function (e){
		            	 e.preventDefault();
		            	 
		            	 var formdata = $(this).serialize();
		            	 //console.log(formdata);
	        	
	            	 $.ajax({
	                     url : "${pageContext.request.contextPath}/data/admin/series/no",
	                     type : "post",
	                     data:formdata,
	                     success:function(resp){
	                     	//console.log(resp)
	                         $("#no-Modal").modal("hide");
	                     	//$(form).submit();//submit 이벤트를 발생시키는 명령(트리거)
	                     	form.submit();//form 객체를 전송시키는 명령
	                         }
	                     });
        	 
       				 });  
    		 }
		});
	});
    
    $(function(){
        $("input[name=contentPlaytime]").on("input",function(){
            var num = $(this).val();
            //console.log(num);
            //console.log(num.length);
            var maxlength = $(this).attr("maxlength");
           if(num.length > maxlength){  
              num = num.slice(0, maxlength);
              //console.log(num)
              $(this).val(num); 
           }
        });
    });
	</script>

	
<div class="container-fluid">
        <div class="row mt-3 mb-5">
            <div class="col-md-6 offset-md-3">
                <div class="text-center mb-3">
                    <h2 class="text-gray-800">컨텐츠 등록</h2>
                </div>
            <form action="contentRegist" method="post" class="form" id="form-regist">	
				<!--  <input type="text" name="contentNo" value="${contentNo}"> -->
                <div class="form-group">
                    <label>컨텐츠명</label>
                    <input type="text" name="contentName" class="form-control" value="월요일이 사라졌다" required>
                </div>

                <div class="form-group form-textarea">
                    <label>컨텐츠 소개</label>
                    <textarea name="contentInfo" class="form-control form-textarea" required>우리는 하나다! 엄격한 산아제한 정책을 시행하는 미래. 정부의 감시를 피해, 일곱 쌍둥이가 한 사람처럼 산다. 들킨 걸까? 사라진 자매 하나를 찾아, 여섯이 힘을 합친다.</textarea>
                </div>

                <div class="form-group">
                    <label>연령제한</label>
                    <select class="form-control" name="contentLimit" required>
                      <option value="" selected>선택하세요</option>
                      <option value="0">전체 이용가</option>
                      <option value="12">12세 이용가</option>
                      <option value="15" selected>15세 이용가</option>
                      <option value="18">18세 이용가</option>
                      <option value="19">19세 이용가</option>
                    </select>
                  </div>
                  
                  <div class="form-group">
                    <label>컨텐츠 타입</label>
                    <select class="form-control" name="contentType" required>
                   	  <option value="">선택하세요</option>
                      <option value="km">국내 영화</option>
                      <option value="fm" selected>해외 영화</option>
                      <option value="kd">국내 드라마</option>
                      <option value="fd">해외 드라마</option>
                      <option value="co">예능</option>
                      <option value="an">애니메이션</option>
                      <option value="do">다큐멘터리</option>
                    </select>
                  </div>

                  <div class="form-group">
                    <label>연작여부</label>
                    <select class="form-control" name="contentSeries" id="season" required>
                      <option value="" >선택하세요</option>
                      <option value="Y">Y(드라마,예능 시즌물등)</option>
                      <option value="N" selected>N (영화등)</option>
                    </select>
                  </div>
					
					
				<div class="form-group">
                    <label>개봉연도</label>
                    <select class="form-control" name="contentRelease" required>
                   	  <option value="" >선택하세요</option>
                      <option>2021</option><option>2020</option><option>2019</option> <option>2018</option><option selected>2017</option>
                      <option>2016</option><option>2015</option><option>2014</option><option>2013</option><option>2012</option> 
                      <option>2011</option><option>2010</option><option>2009</option><option>2008</option><option>2007</option>
                      <option>2006</option><option>2005</option><option>2004</option><option>2003</option><option>2002</option>
                      <option>2001</option><option>2000</option><option>1999</option><option>1998</option><option>1997</option>
                      <option>1996</option><option>1995</option>
                    </select>
                  </div>

                 <div class="form-group">
                    <label>컨텐츠 로고</label>
                    <input type="text" name="contentLogo" class="form-control" value="https://occ-0-988-395.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABXATi-osVlixyg3SfglJOQMTkSHH5uz6h-meqQvQ6hFUyGOB2QiCsbvUdsVALYSRWW9FWHCS53rI8AbvD3UQ06P4Z-J4j3Y-nYs.webp?r=798" required>
                </div>

                <div class="form-group">
                    <label>컨텐츠 썸네일</label>
                    <input type="text" name="contentThumbnail" class="form-control" value="https://occ-0-988-395.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABXwrx8C_KUf94NNn_H5_x3EnKb0vLO7ShJTqHJDfMoUdNZaQ0bXOFN2Ivz25xaUJ5KpDtxwu3FfAcE5TFd-MdpqUiVg.webp?r=8b2" required>
                </div>
                
                <div class="form-group">
                    <label>컨텐츠 예고편</label>
                    <input type="text" name="contentTrailer" class="form-control" value="https://www.youtube.com/embed/FYHkR4wfTAM" required>
                </div>

                <button type="submit" class="btn btn-danger btn-block">등록</button>
                <button type="reset" class="btn btn-secondary btn-block">초기화</button>

            </form>
        </div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/admin/seriesModal2.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>