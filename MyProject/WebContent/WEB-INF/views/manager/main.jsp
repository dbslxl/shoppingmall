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
	
	<div class="container" style="margin-top:250px" >
		<h1 class="text-center" style="margin:50px">관리자 페이지</h1>
		<div class="row">
			<div class="col-md-4">
				<div class="card" >
					<div class="card-header"><h3>회원 관리</h3></div>
					<div class="card-body">
						<div><a href="#">회원 목록</a></div>
						<div><a href="#">회원 목록</a></div>
						<div><a href="#">회원 목록</a></div>
					</div>
				</div>	
			</div>
			<div class="col-md-4">
				<div class="card" >
					<div class="card-header"><h3>게시판 관리</h3></div>
					<div class="card-body">
						<div><a href="#">공지사항 관리</a></div>
						<div><a href="#">FAQ 관리</a></div>
						<div><a href="#">QnA 관리</a></div>
						<div><a href="#">커뮤니티 관리</a></div>
					</div>
				</div>	
			</div>
			<div class="col-md-4">
				<div class="card" >
					<div class="card-header"><h3>상품 관리</h3></div>
					<div class="card-body">
						<div><a href="#">상품 등록</a></div>
						<div><a href="#">인기 상품 등록</a></div>	
						<div><a href="#">신상품 등록</a></div>
						<div><a href="#">구매상품 관리</a></div>								
					</div>
				</div>	
			</div>
		</div>
	</div>
	<div style="position:fixed;bottom:0px" class="container-fluid">
		<c:import url="/WEB-INF/views/client/include/footer.jsp"/>
	</div>
	
</body>
</html>