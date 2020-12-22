<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyCashbook</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container"><br>
	<h1>CASHBOOK MODIFY</h1><hr>
	<form method="post" action="${pageContext.request.contextPath}/admin/modifyCashbookByDay">
	<div class="form-group">
		<label>cashbook_id</label>
		<input class="form-control" type="text" name="cashbookId" value="${cashbook.cashbookId}" readonly="readonly">
	</div>
	<div class="form-group">
		<label>cashbook_date</label>
		<input class="form-control" type="text" name="cashbookDate" value="${currentYear}-${currentMonth}-${currentDay}" readonly="readonly">
	</div>
	<div class="form-group">
		<label>cashbook_kind</label>
		<div class="form-check">
			<label class="form-check-label">
				<input class="form-check-input" type="radio" name="cashbookKind" value="수입">수입
			</label>
		</div>
		<div class="form-check">
			<label class="form-check-label">
				<input class="form-check-input" type="radio" name="cashbookKind" value="지출">지출
			</label>
		</div>
	</div>
	<div class="form-group">
		<label>category_name</label>
		<select class="form-control" name="categoryName">
			<c:forEach var="c" items="${categoryList}">
				<option value="${c.categoryName}">${c.categoryName}</option>
			</c:forEach>
		</select>
	</div>
	<div class="form-group">
		<label>cashbook_price</label>
		<input class="form-control" type="text" name="cashbookPrice" value="${cashbook.cashbookPrice}">
	</div>
	<div class="form-group">
		<label>cashbook_content</label>
		<textarea class="form-control" rows="3" cols="50" name="cashbookContent">${cashbook.cashbookContent}</textarea>
	</div>
	<button class="btn btn-sm btn-outline-info" type="submit">수입/지출 수정</button>
	<button class="btn btn-sm btn-outline-dark" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${currentDay}'">취소</button>
	</form>
	</div>
</body>
</html>