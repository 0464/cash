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
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container"><br>
	<h1 style="text-align:center">NOTICE</h1>
	<table class="table table-bordered table-hover">
		<thead>
			<tr style="text-align:center; ">
				<th style="vertical-align:middle">notice_id</th>
				<th style="vertical-align:middle">notice_title</th>
				<th style="vertical-align:middle">notice_content</th>
				<th style="vertical-align:middle">notice_date</th>
				<th colspan="2" style="width:200px; text-align:center; vertical-align:middle">
					<button class="btn btn-sm btn-outline-info" onclick="location.href='${pageContext.request.contextPath}/admin/addNotice'" type="button">공지사항 추가</button>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="n" items="${noticeList}">
				<tr>
					<td style="vertical-align:middle">${n.noticeId}</td>
					<td style="vertical-align:middle"><a href="${pageContext.request.contextPath}/admin/noticeOne/${n.noticeId}/${currentPage}">${n.noticeTitle}</a></td>
					<td style="vertical-align:middle">${n.noticeContent}</td>
					<td style="vertical-align:middle">${n.noticeDate}</td>
					<td style="text-align:center; vertical-align:middle"><button class="btn btn-sm btn-outline-warning" onclick="location.href='${pageContext.request.contextPath}/admin/modifyNotice/${n.noticeId}'" type="button">수정</button></td>
					<td style="text-align:center; vertical-align:middle"><button class="btn btn-sm btn-outline-danger" onclick="location.href='${pageContext.request.contextPath}/admin/removeNotice/${n.noticeId}'" type="button">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
	<!-- 페이지 네비게이션 -->
		<ul class="pagination justify-content-center">
			<!-- 처음으로 버튼 -->
			<c:choose>
				<c:when test="${currentPage > 1}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/1">처음</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="#">처음</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			<!-- 이전 버튼 -->
			<c:choose>
				<c:when test="${currentPage > 1}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage - 1}">이전</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="#">이전</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			<!-- 현재 페이지 표시 -->
			<c:forEach var="i" begin="${navFirstPage}" end="${navLastPage}">
				<c:if test="${i <= lastPage}">
					<c:choose>
						<%-- 현재 페이지 --%>
						<c:when test="${i == currentPage}">
							<li class="page-item disabled">
								<a class="page-link" href="#">${i}</a>
							</li>
						</c:when>
						<%-- 현재 페이지가 아닌 선택 가능한 페이지 --%>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${i}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:choose>
				<c:when test="${currentPage < lastPage}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage + 1}">다음</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="#">다음</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			<!-- 마지막으로 버튼 -->
			<c:choose>
				<c:when test="${currentPage < lastPage}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${lastPage}">마지막</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="#">마지막</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	</div>
</body>
</html>