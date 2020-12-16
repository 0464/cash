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
	<!-- chart -->
	<div class="container">
		<div>
			<h3>2019년 수입 통계</h3>
		</div>
		<div>
			<canvas id="pieChart"></canvas>
		</div><br>
		<!-- table -->
		<button class="btn btn-outline-dark btn-sm" id="cashbookYearTable" type="button">Table</button>
		<div>
			<label id="totalTable"></label>
		</div>
	</div>
<!--
!!!!!매우중요!!!!!
jsp에서 $ {}와 자바스크립트 백틱의 $ {}가 중복되기 때문에, jsp의 EL($ {})이 우선됨
따라서 jsp의 EL을 무시하기 위해 이스케이프 문자(\)를 추가함
$ {}은 주석처리할때도 적용될때가 있음! 스페이스바 붙이면 500번 에러
-->
</body>
<script>
	$.ajax({
		url:'${pageContext.request.contextPath}/admin/cashbookYearList',
		type:'get',
		success:function(data) {
			console.log(data);
			let pieCtx = $('#pieChart');
			let pieChart = new Chart(pieCtx, {
				// chart 타입
				type:'pie',
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
	$('#cashbookYearTable').click(function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/cashbookYearList',
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
	});
</script>
</html>