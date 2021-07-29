// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
$(function(){
	var ctx = $("#myPieChart");
	
	$.ajax({
		url : "../data/client/age",
		type:"get",
		dataType:"json",
		success:function(count){
			console.log(count);

	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: ["10대", "20대", "30대", "40대이상"],
	    datasets: [{
//	      data: [count.ten, count.twenty, count.thirty, count.forty], 	//DB 
	      data: [55, 25, 10, 10],//임시 데이터
	      backgroundColor: ['#2e80de', '#ff7f50', '#d10914', '#6e7286'],//4e82be db835c AA4643 5a5c69
	      hoverBackgroundColor: ['#1e90ff', '#ff9f40', '#f51b27', '#9193a0'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: true,
	      caretPadding: 10,
	    },
	    legend: {
	      display: false,
	    },
	    cutoutPercentage: 80,
	  },
	});
	
		}
	});
});