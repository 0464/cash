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
		<h3>카테고리별 지출 통계</h3>
	</div>
	<div>
		<canvas id="polarAreaChart"></canvas>
	</div>
	</div>
</body>
<script>
	$.ajax({
		url:'${pageContext.request.contextPath}/admin/cashbookCategoryOutList',
		type:'get',
		success:function(data) {
			console.log(data);
			let polarAreaCtx = $('#polarAreaChart');
			let polarAreaChart = new Chart(polarAreaCtx, {
				// chart 타입
				type:'polarArea',
				// chart 데이터
				data:{
					// 데이터안의 속성들의 값
					labels:[data[0].categoryName, data[1].categoryName, data[2].categoryName, data[3].categoryName, data[4].categoryName, data[5].categoryName],
					datasets:[{
						// chart 제목
						label:'카테고리별 지출',
						// chart 데이터
						data:[data[0].지출, data[1].지출, data[2].지출, data[3].지출, data[4].지출, data[5].지출],
						backgroundColor:[
							'rgba(255, 173, 173, 0.2)',
			                'rgba(255, 230, 148, 0.2)',
			                'rgba(130, 255, 155, 0.2)',
			                'rgba(112, 131, 255, 0.2)',
			                'rgba(193, 77, 255, 0.2)',
			                'rgba(255, 173, 255, 0.2)'
			               
			                ],
						borderColor:[
							'rgba(255, 173, 173, 1)',
			                'rgba(255, 230, 148, 1)',
			                'rgba(130, 255, 155, 1)',
			                'rgba(112, 131, 255, 1)',
			                'rgba(193, 77, 255, 1)',
			                'rgba(255, 173, 255, 1)'
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