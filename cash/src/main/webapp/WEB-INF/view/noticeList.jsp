<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
<!-- 부트스트랩  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
				<th>notice_content</th>
				<th>notice_date</th>
				<th colspan="2" style="width:200px">
					<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/addNotice'" type="button">공지사항 추가</button>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="n" items="${noticeList}">
				<tr>
					<td>${n.noticeId}</td>
					<td><a href="${pageContext.request.contextPath}/admin/noticeOne/${n.noticeId}/${currentPage}">${n.noticeTitle}</a></td>
					<td>${n.noticeContent}</td>
					<td>${n.noticeDate}</td>
					<td><button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/modifyNotice/${n.noticeId}'" type="button">수정</button></td>
					<td><button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/removeNotice/${n.noticeId}'" type="button">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
	<c:if test="${currentPage!=1}">
		<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList/${currentPage-1}'" type="button">이전</button>
	</c:if>
	<c:if test="${currentPage<lastPage}">
		<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList/${currentPage+1}'" type="button">다음</button>
	</c:if>
	</div>
</body>
</html>