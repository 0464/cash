<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbookListByMonth</title>
<!-- 부트스트랩  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.sunday {color : #FF0000;}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<!-- 다이어리 -->
	<div class="container"><br>
	<div class="row" style="text-align:center">
		<div class="col-4">
			<span>이번달 수입 합계</span><hr>
			<span style="color:blue">${sumIn}</span>
		</div>
		<div class="col-4">
			<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/cashbookByMonth/${currentYear}/${currentMonth - 1}'" type="button">이전달</button>
			<label style="font-size:20pt"> ${currentYear}년 ${currentMonth}월 </label>
			<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/cashbookByMonth/${currentYear}/${currentMonth + 1}'" type="button">다음달</button>
		</div>
		<div class="col-4">
			<span>이번달 수입 합계</span><hr>
			<span style="color:red">${sumOut}</span>
		</div>
	</div>
	<div><br>
		<table class="table table-bordered table-hover">
			<thead>
				<tr style="text-align:center">
					<th class="sunday" style="width:100px">SUN</th>
					<th style="width:100px">MON</th>
					<th style="width:100px">TUE</th>
					<th style="width:100px">WED</th>
					<th style="width:100px">THU</th>
					<th style="width:100px">FRI</th>
					<th style="width:100px">SAT</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
						<c:if test="${i-(firstDayOfWeek-1) < 1}">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i-(firstDayOfWeek-1) > 0}">
							<td>
								<div><!-- 날짜 -->
									<a style="color:gray" href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
										${i-(firstDayOfWeek-1)}
									</a>
								</div>
								<!-- 지출/수입 목록이 있는 날짜를 cashList에서 검색 -->
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1) == c.dDay}">
										<c:if test="${c.cashbookKind == '수입'}">
											<div style="font-family:'돋움'; font-size:9pt; color:blue">수입 : ${c.cashbookPrice}</div>
										</c:if>
										<c:if test="${c.cashbookKind == '지출'}">
											<div style="font-family:'돋움'; font-size:9pt; color:red">지출 : ${c.cashbookPrice}</div>
										</c:if>
									</c:if>
								</c:forEach>
							</td>
						</c:if>
						<c:if test="${i%7 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					
					<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
						<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
</body>
</html>