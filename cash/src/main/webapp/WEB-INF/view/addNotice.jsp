<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
<!-- 부트스트랩  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#addBtn').click(function(){
		let html = '<div><input type="file" name="noticefile" class="noticefile"></div>';
		$('#fileinput').append(html);
	});

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
	})

	$('#submitBtn').click(function(){
		let ck = true;
		$('.noticefile').each(function(index, item){
			console.log($(item).val());
			if($(item).val() == '') {
				ck = false;
			}
		})
		if(ck == false) { // if(ck)
			alert('선택하지 않은 파일이 있습니다');
		} else {
			$('#fileuploadFrom').submit();
		}
	});
});
</script>
</head>
<body class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<form id="fileuploadFrom" method="post" enctype="multipart/form-data"
	action="${pageContext.request.contextPath}/admin/addNotice">
		<div class="form-group">
			<label>notice_title</label>
			<input class="form-control" type="text" name="noticeTitle">
		</div>
		<div class="form-group">
			<label>notice_content</label>
			<textarea class="form-control" rows="3" cols="50" name="noticeContent"></textarea>
		</div>
		<div class="form-group">
			<label>notice_file</label>
			<button class="btn btn-outline-dark btn-sm" type="button" id="addBtn">파일추가</button>
			<button class="btn btn-outline-dark btn-sm" type="button" id="delBtn">파일삭제</button>
			<div id="fileinput">
			</div>
		</div>
	<button class="btn btn-sm btn-outline-dark" type="submit">확인</button>
	<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList/1'" type="button">취소</button>
	</form>
</body>
</html>