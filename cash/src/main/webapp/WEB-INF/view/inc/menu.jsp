<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container">
			<ul class="navbar-nav">
				<li class="nav-item">
		    		<a class="navbar-brand" href="${pageContext.request.contextPath}/admin/index">Cashbook</a>
				</li>
				<li class="nav-item">
			    	<a class="nav-link" href="${pageContext.request.contextPath}/admin/cashbookByMonth/-1/-1">Calendar</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/admin/cashbookList/1">cashbookList</a>
				</li>
				<li class="nav-item">
			    	<a class="nav-link" href="${pageContext.request.contextPath}/admin/chart1.jsp">chart</a>
				</li>
				<li class="nav-item">
			    	<a class="nav-link" href="${pageContext.request.contextPath}/admin/addMember">addMember</a>
				</li>
				<li class="nav-item">
			    	<a class="nav-link" href="${pageContext.request.contextPath}/admin/logout">logout</a>
				</li>
			</ul>
		</div>
	</nav>