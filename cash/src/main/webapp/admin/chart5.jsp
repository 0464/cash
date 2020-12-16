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
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<div class="container">
	<!-- chart -->
	<div>
		<h3>2018년도 수입 통계</h3>
	</div>
	<div>
		<canvas id="doughnutChart"></canvas>
	</div>
	</div>
</body>
<script>
	$.ajax({
		url:'${pageContext.request.contextPath}/admin/cashbook2018List',
		type:'get',
		success:function(data) {
			let doughnutCtx = $('#doughnutChart');
			let doughnutChart = new Chart(doughnutCtx, {
				// chart 타입
				type:'doughnut',
				// chart 데이터
				data:{
					// 데이터안의 속성들의 값
					labels:['january', 'february', 'march', 'april', 'may', 'june',
						'july', 'august', 'september', 'october', 'november', 'december'],
					datasets:[{
						// chart 데이터
						data:[data.january, data.february, data.march, data.april, data.may, data.june,
							data.july,data.august, data.september, data.october, data.november, data.december],
						backgroundColor:[
							'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)',
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			                ],
						borderColor:[
							'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)',
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
			                ],
			            borderWidth:1
					}],
					
				},
				options:{}
			});
		}
	});
</script>
</html>