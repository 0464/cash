<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbookList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div>
	<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/cashbookListExcel'" type="button">전체 cashbookList Excel파일 다운로드</button>
	</div>
	<table class="table table-sm table-bordered table-hover" style="font-family:'돋움'; font-size:9pt">
		<thead>
			<tr>
				<th>cashbook_id</th>
				<th>cashbook_kind</th>
				<th>category_name</th>
				<th>cashbook_price</th>
				<th>cashbook_content</th>
				<th>cashbook_date</th>
				<th>create_date</th>
				<th>update_date</th>
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
					<td>${c.cashbookDate}</td>
					<td>${c.createDate}</td>
					<td>${c.updateDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
	<c:if test="${currentPage!=1}">
		<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/cashbookList/${currentPage-1}'" type="button">이전</button>
	</c:if>
	<c:if test="${currentPage<lastPage}">
		<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/cashbookList/${currentPage+1}'" type="button">다음</button>
	</c:if>
	</div>
</body>
</html>