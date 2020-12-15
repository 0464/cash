<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashStats.html</title>
<!-- 부트스트랩  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4"></script>
<!-- jQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<!-- chart -->
	<div>
		<h3>연도별 수입/지출 통계</h3>
	</div>
	<div>
		<canvas id="dubleLineChart"></canvas>
	</div>
</body>
<script>
$.ajax({
	url:'${pageContext.request.contextPath}/admin/cashbookYearInOutList',
	type:'get',
	success:function(data) {
		let dubleLineChartCtx = $('#dubleLineChart');
		let dubleLineChart = new Chart(dubleLineChartCtx, {
			// chart 타입
			type:'line',
			// chart 데이터
			data:{
				// 데이터안의 속성들의 값
				labels:[data[0].year,data[1].year,data[2].year],
				datasets:[{
					// chart 제목
					label:'수입',
					// chart 데이터
					data:[data[0].수입,data[1].수입,data[2].수입],
					fill:'false',
					backgroundColor:[
						'rgba(110, 129, 255, 0.5)'
		            ],
					borderColor:[
						'rgba(110, 129, 255, 0.7)'
		            ],
		            pointBackgroundColor:[
						'rgba(131, 255, 112, 1)',
						'rgba(255, 143, 152, 1)',
						'rgba(255, 234, 166, 1)'
		            ],
		            pointBorderColor:[
		            	'rgba(0, 0, 0, 0.7)',
		            	'rgba(0, 0, 0, 0.7)',
		            	'rgba(0, 0, 0, 0.7)'
			        ]},
					{
					// chart 제목
					label:'지출',
					// chart 데이터
					data:[data[0].지출,data[1].지출,data[2].지출],
					type:'line',
					fill:'false',
					backgroundColor:[
		                'rgba(255, 99, 132, 0.5)'
		            ],
					borderColor:[
		                'rgba(255, 99, 132, 0.7)'
		            ],
		            pointBackgroundColor:[
						'rgba(131, 255, 112, 1)',
						'rgba(255, 143, 152, 1)',
						'rgba(255, 234, 166, 1)'
		            ],
		            pointBorderColor:[
		            	'rgba(0, 0, 0, 0.7)',
		            	'rgba(0, 0, 0, 0.7)',
		            	'rgba(0, 0, 0, 0.7)'
			        ]
				}],
				
			},
			options:{}
		});
	}
});
</script>
</html>