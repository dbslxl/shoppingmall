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

<title>/WEB-INF/views/client/user/buy_history.jsp</title>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp"/>
	
	<div class="container" style="margin-top:100px">
		<h1>구매 이력</h1>
		<div style="margin-top:20px"></div>
		
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th style="width:10%">구매번호</th>
					<th class="text-left">상품명</th>
					<th style="width:20%">구매가격</th>
					<th style="width:20%">구매날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" begin="1" end="10">
					<tr>
						<td>${1}</td>
						<td class="text-left">구매상품</td>
						<td>100,000원</td>
						<td>2020-07-22</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<%--pagination --%>
		<ul class="pagination justify-content-center mt-3">
			<li class="page-item">
				<a href="#" class="page-link">이전</a>
			</li>
			<c:forEach var="i" begin="1" end="10">
				<li class="page-item">
				<a href="#" class="page-link">${i}</a>
			</li>
			</c:forEach>
			<li class="page-item">
				<a href="#" class="page-link">다음</a>
			</li>
		</ul>
	</div>
</body>
</html>