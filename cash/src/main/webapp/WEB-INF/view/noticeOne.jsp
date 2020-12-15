<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<!-- 부트스트랩  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<!-- 공지사항 테이블 -->
	<table class="table table-bordered table-hover">
		<tr>
			<td style="width:200px">notice_id</td>
			<td>${notice.noticeId}</td>
		</tr>
		<tr>
			<td style="width:200px">notice_title</td>
			<td>${notice.noticeTitle}</td>
		</tr>
		<tr>
			<td style="width:200px">notice_content</td>
			<td>${notice.noticeContent}</td>
		</tr>
		<tr>
			<td style="width:200px">notice_date</td>
			<td>${notice.noticeDate}</td>
		</tr>
	</table>
	<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/modifyNotice/${notice.noticeId}'" type="button">수정</button>
	<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/removeNotice/${notice.noticeId}'" type="button">삭제</button>
	<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList/1'" type="button">목록</button>
	<br>
	<!-- 첨부파일 테이블 -->
	<h3>첨부파일</h3>
	<table class="table table-bordered table-hover">
		<c:forEach var="nf" items="${noticefile.noticefile}">
		<c:if test="${nf.noticefileName != null}">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/upload/${nf.noticefileName}">${nf.noticefileName}</a>
			</td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	<!-- 댓글 테이블 -->
	<h3>댓글목록</h3>
	<table class="table table-sm table-bordered table-hover">
		<c:forEach var="c" items="${notice.commentList}">
		<c:if test="${c.commentContent != null}">
		<tr>
			<td>${c.commentContent}</td>
			<td style="width:100px">
				<button class="btn btn-outline-dark btn-sm" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/removeComment/${c.commentId}/${notice.noticeId}'">삭제</button>
			</td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	<!-- 댓글 목록 페이징 -->
	<c:if test="${currentPage>1}">
	<button class="btn btn-outline-dark btn-sm" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/noticeOne/${notice.noticeId}/${currentPage-1}'">이전</button>
	</c:if>
	<c:if test="${currentPage<lastPage}">
	<button class="btn btn-outline-dark btn-sm" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/noticeOne/${notice.noticeId}/${currentPage+1}'">다음</button>
	</c:if>
	<!-- 댓글 작성 -->
	<h3>댓글작성</h3>
	<form method="post" action="${pageContext.request.contextPath}/admin/addComment">
		<div class="form-group">
		<input class="form-control" type="hidden" name="noticeId" value="${notice.noticeId}">
		<textarea class="form-control" name="commentContent" rows="3" cols="50"></textarea>
		<button class="btn btn-outline-dark btn-sm" type="submit">작성</button>
		</div>
	</form>
</body>
</html>