// Call the dataTables jQuery plugin
$(document).ready(function() {
	$('#dataTable').DataTable({
	  
		responsive: true,
	  	order: [ [ 0, "desc" ] ],
	  	//lengthMenu: [ 10, 20, 30, 40, 50 ], 
	  	//표시 건수 설정(lengthMenu/displayLength)
	  	
		language:{
			  decimal : "",
		      emptyTable : "데이터가 없습니다.",
		      infoEmpty : "0명",
			  info : "_START_ - _END_ (총 _TOTAL_ 명)",
			  infoFiltered : "(전체 _MAX_ 명 중 검색결과)",
			  lengthMenu : "_MENU_ 개씩 보기",
			  loadingRecords : "로딩중...",
		      processing : "처리중...",
			  search : "검색 : ",
		      zeroRecords : "검색된 데이터가 없습니다.",
			  paginate : {
		        "first" : "첫 페이지",
		        "last" : "마지막 페이지",
		        "next" : "다음",
		        "previous" : "이전"
			  },
		},
	 
		ajax:{
	  		url : "http://www.sysout.co.kr/finalteam1/data/admin/client/list",
	  		type : "get",
	  		dataType : "json",
	  		dataSrc : '',
//	  		success:function(resp){
//	  			console.log(resp)
//	  		}	
	 	},
	 	columns : [
	         {data : "clientNo"},
	         {data : "clientId"},
	         {data : "clientName"},
			 {data : "clientJoin"},
			 {data : "gradeName"},
			 {data : "clientExpire"}
		]	
		 
  });
});