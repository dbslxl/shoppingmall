<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width; initial-scale=1'/>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<title>/WEB-INF/views/client/user/login.jsp</title>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp"/>
	
	<div class="container" style="margin-top:100px">
		<div class="row">
		
		<div class="col-md-3"></div>
		<div class="col-md-6">
			
			<div style="margin-top:150px"></div>
			<div class="card">
				<div class="card-body">
					<h1 class="text-center">로그인</h1>
					<c:url var="path" value="/user/login_pro"></c:url>
					<form  method="post" action="${path}" >
						<div class="form-group">
							<label >아이디</label>
							<input type="text" name="user_id" class="form-control"/>
							<!-- <form:errors  style="color:red"/>  -->
						</div>
						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" name="user_pw" class="form-control"/>
							
						</div>
						<div class="form-group" style="margin-top:50px">
							<button class="btn btn-primary btn-block">로그인</button>							
						</div>
						<div class="form-group" style="margin-top:10px">
							<c:url var="path" value="/user/join"></c:url>
							<a href="${path}" class="btn btn-info btn-block">회원가입</a>
						</div>
						
					</form>
				</div>
				
			</div>
		</div>
		<div class="col-md-3"></div>
		</div>	
	</div>
</body>
</html>