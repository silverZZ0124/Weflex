<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
	<div class="modal" id="yes-Modal"> 
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-header">
                                <h4 class="modal-title">연작 컨텐츠 정보 입력</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col">

                                           <form class="form" id="content-form-yes">                                          

                                                <div class="form-group">
                                                    <label>시즌</label>
                                                    <input type="number" name="contentSeason" class="form-control" placeholder="시즌을 입력하세요(ex. 1 , 2 , 3 ...)" required>
                                                </div>

                                                <div class="form-group">
                                                    <label>몇화</label>
                                                    <input type="number" name="contentEpisode" class="form-control" placeholder="화를 입력하세요(ex. 1 , 2 , 3 ...)" required>
                                                </div>

                                                <div class="form-group">
                                                    <label>해당 화 소개글</label>
                                                    <textarea name="episodeInfo" class="form-control form-textarea" required></textarea>
                                                </div>

                                                <div class="form-group">
                                                    <label>영상길이</label>
                                                    <input type="number" name="contentPlaytime" class="form-control" placeholder="ex) 70(분) 형식으로 입력(숫자)" required min="0" max="999" maxlength="3">
                                                </div>

                                                <div class="form-group">
                                                    <label>컨텐츠 주소</label>
                                                    <input type="text" name="seriesPath" class="form-control" placeholder="url" required>
                                                </div>
                                           
                                       </div>
                                    </div>
                                </div>

                            </div>
	                            <div class="modal-footer">
	                                <button type="submit" class="btn btn-primary">등록</button>
	                                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	                            </div>
                        </form>
                        </div>
                    </div>
                </div>
                
                 <div class="modal" id="no-Modal"> 
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-header">
                                <h4 class="modal-title">비 연작 컨텐츠 정보 입력</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col">

                        		    <form class="form" id="content-form-no">

                                                <div class="form-group">
                                                    <label>영상길이</label>
                                                    <input type="number" name="contentPlaytime" class="form-control" value="122" placeholder="ex) 70(분) 형식으로 입력(숫자)" required min="0" max="999" maxlength="3">
                                                </div>

                                                <div class="form-group">
                                                    <label>컨텐츠 주소</label>
                                                    <input type="text" name="seriesPath" class="form-control" value="https://www.youtube.com/embed/sxr_0C3EYIk" placeholder="url" required>
                                                </div>
                                       </div>
                                    </div>
                                </div>

                                </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">등록</button>
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                                            </div>
                              </form>
                        </div>
                    </div>
                </div>
              
                
               </div>
               

            <!-- End of Main Content -->
            
            