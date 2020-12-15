<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyNotice</title>
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
		});	
		$('#submitBtn').click(function(){
			let ck = true;
			$('.noticefile').each(function(index,item){
				if($(item).val()==''){
					ck=false;
				}
			});
			if(ck==false){
				alert('선택하지 않은 파일이 있습니다.');
			}else{
				$('#fileUpdateForm').submit();
			}
		});
	});
</script>
</head>
<body class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<form id="fileUpdateForm" method="post" enctype="multipart/form-data"
	action="${pageContext.request.contextPath}/admin/modifyNotice">
		<div class="form-group">
			<label>notice_id</label>
			<input class="form-control" type="text" name="noticeId" value="${notice.noticeId}" readonly="readonly">
		</div>
		<div class="form-group">
			<label>notice_title</label>
			<input class="form-control" type="text" name="noticeTitle" value="${notice.noticeTitle}">
		</div>
		<div class="form-group">
			<label>notice_content</label>
			<textarea class="form-control" rows="3" cols="50" name="noticeContent">${notice.noticeContent}</textarea>
		</div>
		<div class="form-group">
			<label>notice_date</label>
			<input class="form-control" type="text" value="${notice.noticeDate}" readonly="readonly">
		</div>
		<div class="form-group">
			<label>notice_file_add</label>
			<c:forEach var="nf" items="${notice.noticefile}">
			<c:if test="${nf.noticefileName != null}">
				<div class="form-group">
					<label>기존 파일</label>
					<a href="${pageContext.request.contextPath}/upload/${nf.noticefileName}">${nf.noticefileName}</a>
					<button class="btn btn-outline-dark btn-sm" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/removeNoticefile/${nf.noticeId}/${nf.noticefileId}'">파일삭제</button>
				</div>
			</c:if>
			</c:forEach>
			<div id="fileinput">
				<button class="btn btn-outline-dark btn-sm" type="button" id="addBtn">파일추가</button>
				<button class="btn btn-outline-dark btn-sm" type="button" id="delBtn">파일삭제</button>
			</div>
		</div>
	<button class="btn btn-sm btn-outline-dark" type="button" id="submitBtn">수정</button>
	<button class="btn btn-sm btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList/1'" type="button">취소</button>
	</form>
</body>
</html>