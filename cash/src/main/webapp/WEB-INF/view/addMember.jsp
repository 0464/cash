<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMember</title>
<!-- 부트스트랩  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('#id').focus();
	$('#id').blur(function() {
		// 비동기 요청으로 #id값을 서버에 보내고 #id값이 중복인지 아닌지 확인
		if($('id').val() == '') {
			alert('ID를 입력해 주세요.');
			$('#id').focus();
			return;
		}
		$.ajax({
			url:'/admin/idCheck',
			type:'post',
			data:{id:$('#id').val()},
			success:function(data) {
				if(data == 'yes') {
					alert($('#id').val()+'는 사용가능한 ID 입니다.');
					$('#pw').focus();
				} else {
					alert($('#id').val()+'는 사용중인 ID 입니다.');
					$('#id').select();
					$('#id').focus();
				}
			}
		});
	});
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container"><br>
	<h1>MEMBER ADD</h1><hr>
	<div class="row">
		<div class="col-4">
			<form class="was-validated" method="post" action="${pageContext.request.contextPath}/admin/addMember">
				<div class="form-group">
					<label for="id">ID :</label>
					<input type="text" class="form-control" placeholder="Enter id" name="id" id="id" required>
					<div class="invalid-feedback">아이디를 입력해주세요.</div>
				</div>
				<div class="form-group">
					<label for="pw">PW :</label>
					<input type="password" class="form-control" placeholder="Enter pw" name="pw" id="pw" required>
					<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				</div>
				<button type="submit" class="btn btn-sm btn-outline-info" id="addMember">회원가입</button>
			</form>
		</div>
	</div>
	</div>
</body>
</html>