<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">
	<ul class="navbar-nav">
		<li class="nav-item">
    		<a class="navbar-brand">Cashbook</a>
		</li>
	</ul>
	</div>
</nav>
<div class="container">
	<div class="row">
	<div class="col-4"></div>
	<div class="col-4"><br>
	<h1 style="text-align:center">LOGIN</h1>
		<form class="was-validated" action="${pageContext.request.contextPath}/login" method="post">
			<div class="form-group">
				<label>ID :</label>
				<input type="text" class="form-control" placeholder="Enter id" name="id" value="goodee" required>
				<div class="valid-feedback">Check</div>
    			<div class="invalid-feedback">아이디를 입력해주세요.</div>
			</div>
			<div class="form-group">
				<label>PW :</label>
				<input type="password" class="form-control" placeholder="1234" name="pw" required>
				<div class="valid-feedback">Check</div>
    			<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
			</div>
			<button style="width:100%" class="btn btn-sm btn-outline-dark" type="submit">Login</button>
		</form><hr>
	<h1 style="text-align:center">NOTICE</h1>
		<div>
			<table class="table table-sm table-bordered table-hover" style="text-align:center">
				<thead>
					<tr>
						<th style="width:100px">notice_id</th>
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
	</div>
	<div class="col-4"></div>
	</div>
</div>
</body>
</html>