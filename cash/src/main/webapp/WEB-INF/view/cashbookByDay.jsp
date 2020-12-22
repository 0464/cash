<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbookByDay</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container"><br>
	<div class="row">
		<div class="col-4">
		</div>
		<div class="col-4" style="text-align:center">
			<a class="btn btn-sm btn-outline-dark" href="${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}">이전</a>
			<label style="font-size:20pt">${currentYear}년 ${currentMonth}월 ${currentDay}일</label>
			<a class="btn btn-sm btn-outline-dark" href="${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}">다음</a>
		</div>
		<div class="col-4" style="text-align:right">
			<a class="btn btn-sm btn-outline-info" href="${pageContext.request.contextPath}/admin/addCashbook/${currentYear}/${currentMonth}/${currentDay}">수입/지출 입력</a>
		</div>
	</div><hr>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>cashbookId</th>
				<th>cashbookKind</th>
				<th>categoryName</th>
				<th>cashbookPrice</th>
				<th>cashbookContent</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${cashbookList}">
				<tr>
					<td>${c.cashbookId}</td>
					<td>${c.cashbookKind}</td>
					<td>${c.categoryName}</td>
					<td>${c.cashbookPrice}</td>
					<td>${c.cashbookContent}</td>
					<td>
						<a class="btn btn-sm btn-outline-warning" href="${pageContext.request.contextPath}/admin/modifyCashbookByDay/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">수정</a>
					</td>
					<td>
						<a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/admin/removeCashbookByDay/${c.cashbookId}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>