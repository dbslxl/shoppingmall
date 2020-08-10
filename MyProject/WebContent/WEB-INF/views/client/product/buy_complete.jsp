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
	<div class="container" style="margin-top:100px">
		
		<h1>구매 완료</h1>
		
		<div style="margin-top:20px"></div>
		
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th style="width:10%">번호</th>
					<th class="text-left">상품명</th>
					<th style="width:20%">가격</th>					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" begin="1" end="7">
					<tr>
						<td>${i}</td>
						<td>상품 ${i}</td>
						<td>1,000,000</td>												
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<c:url var="path" value="/main"/>
		<a href="${path}"></a>		
		<div class="text-right">		
			<c:url var="path" value="/user/buy_history"/>
			<a href="${path}" class="btn btn-primary">구매 이력보기</a>	
			<c:url var="path" value="/main"/>	
			<a href="${path}" class="btn btn-primary">홈 으로</a>
		</div>
		
	</div>
</body>
</html>