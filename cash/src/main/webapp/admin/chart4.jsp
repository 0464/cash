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
		<h3>연도별 지출 통계</h3>
	</div>
	<div>
		<canvas id="radarChart"></canvas>
	</div>
</body>
<script>
	$.ajax({
		url:'${pageContext.request.contextPath}/admin/cashbookYearlyOutList',
		type:'get',
		success:function(data) {
			console.log(data);
			let radarCtx = $('#radarChart');
			let radarChart = new Chart(radarCtx, {
				// chart 타입
				type:'radar',
				// chart 데이터
				data:{
					// 데이터안의 속성들의 값
					labels:[data[0].year,data[1].year,data[2].year],
					datasets:[{
						// chart 제목
						label:'연도별 지출',
						// chart 데이터
						data:[data[0].지출,data[1].지출,data[2].지출],
							fill:'false',
							backgroundColor:[
								'rgba(255, 255, 255, 0.5)'
			                ],
							borderColor:[
								'rgba(255, 82, 105, 0.5)'
				            ],
				            pointBorderColor:[
								'rgb(255, 255, 255)',
								'rgb(255, 255, 255)',
								'rgb(255, 255, 255)'
						    ],
				            pointBackgroundColor:[
				            	'rgb(0, 0, 0)',
				            	'rgb(0, 0, 0)',
				            	'rgb(0, 0, 0)'
					        ]
					}],
					
				},
				options:{}
			});
		}
	});
</script>
</html>