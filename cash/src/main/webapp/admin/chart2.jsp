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
		<h3>2019년 지출 통계</h3>
	</div>
	<div>
		<canvas id="lineChart"></canvas>
	</div><br>
	<!-- table -->
	<div>
		<label id="totalTable"></label>
	</div>
</body>
<script>
	$.ajax({
		url:'${pageContext.request.contextPath}/admin/cashbookYearOutList',
		type:'get',
		success:function(data) {
			let lineCtx = $('#lineChart');
			let lineChart = new Chart(lineCtx, {
				// chart 타입
				type:'line',
				// chart 데이터
				data:{
					// 데이터안의 속성들의 값
					labels:['january', 'february', 'march', 'april', 'may', 'june',
						'july', 'august', 'september', 'october', 'november', 'december'],
					datasets:[{
						// chart 제목
						label:data.year+'년도 지출',
						// chart 데이터
						data:[data.january, data.february, data.march, data.april, data.may, data.june,
							data.july,data.august, data.september, data.october, data.november, data.december],
						borderColor:[
							'rgb(125, 255, 71)'
			                ],
						backgroundColor:[
							'rgba(185, 255, 156, 0.1)'
			                ],
			            pointBorderColor:[
							'rgb(255, 255, 255)',
							'rgb(255, 255, 255)',
							'rgb(255, 255, 255)',
							'rgb(255, 255, 255)',
							'rgb(255, 255, 255)',
							'rgb(255, 255, 255)',
							'rgb(255, 255, 255)',
							'rgb(255, 255, 255)',
							'rgb(255, 255, 255)',
							'rgb(255, 255, 255)',
							'rgb(255, 255, 255)',
							'rgb(255, 255, 255)'
					        ],
			            pointBackgroundColor:[
			            	'rgb(0, 0, 0)',
			            	'rgb(0, 0, 0)',
			            	'rgb(0, 0, 0)',
			            	'rgb(0, 0, 0)',
			            	'rgb(0, 0, 0)',
			            	'rgb(0, 0, 0)',
			            	'rgb(0, 0, 0)',
			            	'rgb(0, 0, 0)',
			            	'rgb(0, 0, 0)',
			            	'rgb(0, 0, 0)',
			            	'rgb(0, 0, 0)',
			            	'rgb(0, 0, 0)'
				            ],
			            lineTension:'0.2',
					}],
					
				},
				options:{}
			});
		}
	});
	$.ajax({
		url:'${pageContext.request.contextPath}/admin/cashbookYearOutList',
		type:'get',
		success: function(data) {
			let html = `
				<table class="table table-bordered table-hover">
					<tr>
						<th>january</th>
						<th>february</th>
						<th>march</th>
						<th>april</th>
						<th>may</th>
						<th>june</th>
						<th>july</th>
						<th>august</th>
						<th>september</th>
						<th>october</th>
						<th>november</th>
						<th>december</th>
					</tr>
					<tr>
						<td>\${data.january}</td>
						<td>\${data.february}</td>
						<td>\${data.march}</td>
						<td>\${data.april}</td>
						<td>\${data.may}</td>
						<td>\${data.june}</td>
						<td>\${data.july}</td>
						<td>\${data.august}</td>
						<td>\${data.september}</td>
						<td>\${data.october}</td>
						<td>\${data.november}</td>
						<td>\${data.december}</td>
					</tr>
				</table>
			`;	
			$('#totalTable').html(html);
		}
	});
</script>
</html>