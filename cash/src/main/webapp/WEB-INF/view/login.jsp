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
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<ul class="navbar-nav">
		<li class="nav-item">
    		<a class="nav-link">Cashbook</a>
		</li>
	</ul>
</nav>
<h1>NOTICE</h1>
	<div>
		<table class="table table-bordered table-hover">
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
<h1>LOGIN</h1>
	<form action="${pageContext.request.contextPath}/login" method="post">
		<div class="form-group">
			<label for="id">ID :</label>
			<input type="text" class="form-control" placeholder="Enter id" name="id" value="goodee">
		</div>
		<div class="form-group">
			<label for="pwd">PW :</label>
			<input type="password" class="form-control" placeholder="Enter pw" name="pw" value="1234">
		</div>
		<button class="btn btn-sm btn-outline-dark" type="submit">로그인</button>
	</form>
</body>
</html>