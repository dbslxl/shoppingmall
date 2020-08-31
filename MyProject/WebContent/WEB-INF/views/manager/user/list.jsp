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

<title>/WEB-INF/views/client/main.jsp</title>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp"/>
	<div style="margin-top:100px"></div>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th style="width:10%">회원 번호</th>
					<th style="width:10%">회원 아이디</th>
					<th style="width:10%">회원 이름</th>
					<th style="width:10%">회원 등급</th>
					<th style="width:10%">회원 상태</th>
					<th style="width:10%">가입 날짜</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${userList}">
					<tr>
					<%-- <form:form modelAttribute="${obj }">
						<td>13</td>
						<td>manager</td>
						<td>운영자</td>
						<td><form:select path="user_grade">
							<form:option value="1">일반회원</form:option>
							<form:option value="2">관리자</form:option>
						</form:select></td>
						<td><form:select path="user_status">
							<form:option value="1">정상</form:option>
							<form:option value="2">접속불가</form:option>
						</form:select></td>
						<td><button class="btn btn-success" type="submit">수정하기</button></td>
					</form:form> --%>
					<c:url var="path" value="/manager/user/modify_user"></c:url>
					<form action="${path}" method="post">
						<td>${obj.user_idx }</td>
						<td>${obj.user_id}</td>
						<td>${obj.user_name}</td>
						<td><select name="user_grade">
							<option value="1">일반회원</option>
							<option value="2">관리자</option>
						</select></td>
						<td><select name="user_status">
							<option value="1">정상</option>
							<option value="2">접속불가</option>
						</select></td>
						<input type="hidden" name="user_idx" value="${obj.user_idx}">						
						<td><button class="btn btn-success" type="submit">수정하기</button></td>
					</form>					
					<tr/>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
</body>
</html>