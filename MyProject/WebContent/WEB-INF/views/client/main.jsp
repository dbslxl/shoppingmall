<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width; initial-scale=1' />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<title>/WEB-INF/views/client/main.jsp</title>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp" />

	<%--슬라이드 쇼 --%>
	<div id="slideshow" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>
		<!-- The slideshow -->
		<div class="carousel-inner" style="margin-top: 56px">
			<div class="carousel-item active">
				<c:url var="path" value="/image/banner1.jpg" />
				<img width="100%" src="${path}" alt="Los Angeles">
			</div>
			<div class="carousel-item">
				<c:url var="path" value="/image/banner2.jpg" />
				<img width="100%" src="${path}" alt="Chicago">
			</div>
			<div class="carousel-item">
				<c:url var="path" value="/image/banner3.jpg" />
				<img width="100%" src="${path}" alt="New York">
			</div>
		</div>
		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#slideshow" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#slideshow" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>

	<%--인기 상품 목록 부분--%>
	<div class="container" style="margin-top: 50px">
		<h1>인기 상품</h1>
		<div style="margin-bottom:30px"></div>
		<div class="row" style="margin-bottom: 30px">
			<c:forEach var="obj" items="${bestProductList }">
				<div class="col-md-3" style="margin-bottom: 30px">
				<div class="card">
					<div style="padding: 5px">
						<c:url var="path" value="/upload/${obj.product_image}"></c:url>
						<img src="${path}" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">${obj.product_name}</h3>
						<fmt:formatNumber var="a1" value="${obj.product_price}"/>
						<p class="card-text">${a1}원</p>
						<c:url var="path" value="/product/detail">
							<c:param name="product_idx" value="${obj.product_idx }"/>
						</c:url>
						<a href="${path}" class="btn btn-sm btn-block btn-outline-secondary">자세히보기</a>
					</div>
				</div>
				</div>			
			</c:forEach>
		</div>
	</div>
	<%--신 상품 목록 부분--%>
	<div class="container" style="margin-top: 50px">
		<h1>신 상품</h1>
		
		<div class="row" style="margin-bottom: 30px; margin-top: 30px">
			<c:forEach var="obj" items="${newProductList }">
				<div class="col-md-3" style="margin-bottom: 30px">
				<div class="card">
					<div style="padding: 5px">
						<c:url var="path" value="/upload/${obj.product_image}"></c:url>
						<img src="${path}" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">${obj.product_name}</h3>
						<fmt:formatNumber var="a1" value="${obj.product_price}"/>
						<p class="card-text">${a1}원</p>
						<c:url var="path" value="/product/detail">
							<c:param name="product_idx" value="${obj.product_idx }"/>
						</c:url>
						<a href="${path}" class="btn btn-sm btn-block btn-outline-secondary">자세히보기</a>
					</div>
				</div>
				</div>			
			</c:forEach>
		</div>
	</div>	

	<%--커뮤니티 인기글 --%>
	<div class="container" style="margin-bottom:50px">
		<h1>커뮤니티</h1>
		<div style="margin-bottom:20px"></div>
		<table class='table table-hover text-center'>
			<thead>
				<tr>
					<th style='width:10%'>글번호</th>
					<th class='text-left'>제목</th>
					<th style='width:16%'>작성자</th>
					<th style='width:7%'>조회수</th>
					<th style="width:7%">공감</th>
					<th style="width:7%">비공감</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='obj' items="${contentList }">
				<tr>
					<td>${obj.content_idx}</td>
					<c:url var='path' value='/board/read'>
						<c:param name="content_idx" value='${obj.content_idx }'/>
						<c:param name="board_category_idx" value='4'/>						
					</c:url>
					<td class='text-left'><a class="link text-dark" href='${path}'>${obj.content_subject }&nbsp<span class="text-info">[${obj.content_comment_cnt}]</span></a></td>
					<td>${obj.content_writer_id} </td>
					<td>${obj.content_read_cnt }</td>
					<td>${obj.content_like_cnt }</td>
					<td>${obj.content_dislike_cnt }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<c:import url="/WEB-INF/views/client/include/footer.jsp"/>
	
</body>
</html>