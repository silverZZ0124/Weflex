// Call the dataTables jQuery plugin
$(document).ready(function() {
	$('#contentTable').DataTable({
	  
		responsive: true,
	  	order: [ [ 0, "desc" ] ],
	  	//lengthMenu: [ 10, 20, 30, 40, 50 ], 
	  	//표시 건수 설정(lengthMenu/displayLength)
	  	
		language:{
			  decimal : "",
		      emptyTable : "데이터가 없습니다.",
		      infoEmpty : "0개",
			  info : "_START_ - _END_ (총 _TOTAL_ 개)",
			  infoFiltered : "(전체 _MAX_ 개 중 검색결과)",
			  lengthMenu : "_MENU_ 개씩 보기",
			  loadingRecords : "로딩중...",
		      processing : "처리중...",
			  search : "검색 : ",
		      zeroRecords : "검색된 컨텐츠가 없습니다.",
			  paginate : {
		        "first" : "첫 페이지",
		        "last" : "마지막 페이지",
		        "next" : "다음",
		        "previous" : "이전"
			  },
		},
	 
		ajax:{
	  		url : "http://www.sysout.co.kr/weflex/data/admin/content/list",
	  		type : "get",
	  		dataType : "json",
	  		dataSrc : '',
//	  		success:function(resp){
//	  			console.log(resp)
//	  		}	
	 	},
	 	columns : [
	         {data : "contentNo"},
	         {data : "contentName"},
	         {
             	/*컨텐츠 타입 들어갈 자리
             	- km : 국내 영화
             	- fm : 외국 영화
             	- kd : 국내 드라마
             	- fd : 외국 드라마
             	- co : 예능
             	- an : 애니메이션
             	- do : 다큐멘터리*/
             
	        	 data : "contentType",
        		 render : function (data, type, row){	    				
        			 if(data == "km"){
        				 return "국내 영화";
        			 }
        			 else if(data == "fm"){
        				 return "외국 영화";
        			 }
        			 else if(data == "kd"){
        				 return "국내 드라마";
        			 }
        			 else if(data == "fd"){
        				 return "해외 드라마";
        			 }
        			 else if(data == "co"){
        				 return "TV 예능";
        			 }
        			 else if(data == "an"){
        				 return "애니메이션";
        			 }
        			 else if(data == "do"){
        				 return "다큐멘터리";
        			 }
        			 else return "없음";
        		 }
	         },
			 {
	        	 data : "contentLimit",
	        	 render : function (data, type, row){	    				
        			 if(data == "0"){
        				 return "전체 이용가";
        			 }
        			 else if(data == "12"){
        				 return "12세 이용가";
        			 }
        			 else if(data == "15"){
        				 return "15세 이용가";
        			 }
        			 else if(data == "18"){
        				 return "18세 이용가";
        			 }
        			 else if(data == "19"){
        				 return "19세 이용가";
        			 }
        			 else return "없음";
	        	 }
	         },
			 {data : "contentViews"}
		]
		 
	});
	
	//console.log($("#contentTable").DataTable().data().row());
	
	$("#contentTable tbody").on('click', 'tr', function (){ 
		var data = $("#contentTable").DataTable().row(this).data(); // 선택된 Row에 대해 표시 
		//console.log(data);
		
		var contentNo = data.contentNo;
		//console.log(contentNo);
		
		location.href='contentDetail?contentNo='+contentNo;
		
	});

});