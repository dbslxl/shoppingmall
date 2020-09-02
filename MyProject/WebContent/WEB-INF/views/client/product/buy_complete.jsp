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
					<th >상품명</th>
					<th style="width:20%">가격</th>
					<th style="width:20%">날짜</th>						
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${buyList}">
					<tr>
						<td>${obj.buy_idx}</td>
						<td>${obj.buy_product_name}</td>
						<fmt:formatNumber var="a1" value="${obj.buy_product_price }"/>
						<td>${a1}</td>	
						<td>${obj.buy_date }											
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<c:url var="path" value="/main"/>
		<a href="${path}"></a>		
		<div class="text-right">		
			
			<c:url var="path" value="/main"/>	
			<a href="${path}" class="btn btn-lg btn-info">홈 으로</a>
		</div>
		
	</div>
</body>
</html>