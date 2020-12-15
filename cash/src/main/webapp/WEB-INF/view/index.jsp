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
	<!-- 수입/지출 -->
	<br>
	<h2 style="text-align:center">최근 3개월 수입/지출</h2>
	<div>
		<div class="card-deck">
			<c:forEach var="io" items="${inOutList}">
			<div class="card">
				<div class="card-body text-center">
					<h5 class="card-text">${io["날짜"]}</h5>
				</div>
				<div class="card-body text-center">
					<h6 class="card-text">수입</h6>
					<h6 class="card-text" style="color:blue">${io["수입"]}</h6>
				</div>
				<div class="card-body text-center">
					<h6 class="card-text">지출</h6>
					<h6 class="card-text" style="color:red">${io["지출"]}</h6>
				</div>
				<div class="card-body text-center">
					<h6 class="card-text">합계</h6>
					<h6 class="card-text">${io["합계"]}</h6>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<!-- 공지 -->
	<br>
	<h2 style="text-align:center">NOTICE <button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList/${currentPage}'" type="button">more</button></h2>
	<div>
		<table class="table table-bordered table-hover" style="text-align:left">
			<thead>
				<tr>
					<th style="width:150px">notice_id</th>
					<th>notice_title</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.noticeId}</td>
						<td>${n.noticeTitle}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>