<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<table class="table" style="text-align:center">
		<tr class="row">
			<td class="col-4" ></td>
			<td class="col-4">
				<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}'" type="button">이전</button>
				<span style="font-size:20pt">${currentYear}년 ${currentMonth}월 ${currentDay}일</span>
				<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}'" type="button">다음</button>
			</td>
			<td class="col-4">
				<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/addCashbook/${currentYear}/${currentMonth}/${currentDay}'" type="button">수입/지출 입력</button>
			</td>
		</tr>
	</table>
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
						<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/modifyCashbookByDay/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}'" type="button">수정</button>
					</td>
					<td>
						<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/removeCashbookByDay/${c.cashbookId}'" type="button">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>