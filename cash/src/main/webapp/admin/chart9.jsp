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
		<h3>계절별 수입/지출 통계</h3>
	</div>
	<div>
		<canvas id="dubleradarChart"></canvas>
	</div>
</body>
<script>
$.ajax({
	url:'${pageContext.request.contextPath}/admin/cashbookAllOutInList',
	type:'get',
	success:function(data) {
		let dubleradarChartCtx = $('#dubleradarChart');
		let dubleradarChart = new Chart(dubleradarChartCtx, {
			// chart 타입
			type:'radar',
			// chart 데이터
			data:{
				// 데이터안의 속성들의 값
				labels:['Spring', 'Summer', 'Fall', 'Winter'],
				datasets:[{
					// chart 제목
					label:'계절별 '+data[0].kind,
					// chart 데이터
					data:[data[0].january+data[0].february+data[0].march,
						data[0].april+data[0].may+data[0].june,
						data[0].july+data[0].august+data[0].september,
						data[0].october+data[0].november+data[0].december],
					backgroundColor:[
						'rgba(255, 250, 250, 0.2)'
		            ],
					borderColor:[
						'rgba(110, 129, 255, 0.7)'
		            ],
		            pointBackgroundColor:[
						'rgba(131, 255, 112, 1)',
						'rgba(255, 143, 152, 1)',
						'rgba(255, 234, 166, 1)',
						'rgba(156, 225, 255, 1)'
		            ],
		            pointBorderColor:[
		            	'rgba(0, 0, 0, 0.7)',
		            	'rgba(0, 0, 0, 0.7)',
		            	'rgba(0, 0, 0, 0.7)',
		            	'rgba(0, 0, 0, 0.7)'
			        ]},
					{
					// chart 제목
					label:'계절별 '+data[1].kind,
					// chart 데이터
					data:[data[1].january+data[1].february+data[1].march,
						data[1].april+data[1].may+data[1].june,
						data[1].july+data[1].august+data[1].september,
						data[1].october+data[1].november+data[1].december],
					type:'radar',
					backgroundColor:[
		                'rgba(255, 250, 250, 0.2)'
		            ],
					borderColor:[
						'rgba(255, 99, 132, 0.7)'
		            ],
		            pointBackgroundColor:[
						'rgba(131, 255, 112, 1)',
						'rgba(255, 143, 152, 1)',
						'rgba(255, 234, 166, 1)',
						'rgba(156, 225, 255, 1)'
		            ],
		            pointBorderColor:[
		            	'rgba(0, 0, 0, 0.7)',
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