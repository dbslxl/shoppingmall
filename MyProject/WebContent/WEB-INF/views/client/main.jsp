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
		<div style="margin-bottom:20px"></div>
		<div class="row" style="margin-bottom: 30px; margin-bottom: 30px">
			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/222.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<c:url var="path" value="/product/detail"></c:url>
						<a href="${path}" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/222.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<a href="${path}" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/222.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<a href="${path}" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/222.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<a href="${path}" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="margin-bottom: 30px">
			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/222.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<c:url var="path" value="/product/detail"></c:url>
						<a href="${path}" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/222.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<a href="#" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/222.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<a href="#" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/222.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<a href="#" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>
		</div>

	</div>

	<%--신 상품 목록 부분--%>
	<div class="container" style="margin-top: 50px">
		<h1>신 상품</h1>
		
		<div class="row" style="margin-bottom: 30px; margin-top: 30px">
			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/111.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<c:url var="path" value="/product/detail"></c:url>
						<a href="${path}" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/111.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<a href="#" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/111.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<a href="#" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/111.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<a href="#" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="margin-bottom: 30px">
			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/111.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<c:url var="path" value="/product/detail"></c:url>
						<a href="${path}" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/111.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<a href="#" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/111.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<a href="#" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div style="padding: 5px">
						<img src="image/111.jpg" style="width: 100%" />
					</div>
					<div class="card-body">
						<h3 class="card-title">상품1</h3>
						<p class="card-text">100,000원</p>
						<a href="#" class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>
		</div>

	</div>

	<%--커뮤니티 인기글 --%>
	<div class="container" style="margin-bottom:50px">
		<h1>커뮤니티</h1>
		<div style="margin-bottom:20px"></div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>					
					<th>조회수</th>
					<th>추천수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>john@example.com</td>
					<td>Doe</td>
					<td>100</td>
					<td>200</td>
				</tr>
				<tr>
					<td>2</td>
					<td>mary@example.com</td>
					<td>Moe</td>
					<td>100</td>
					<td>200</td>
					
				</tr>
				<tr>
					<td>3</td>
					<td>july@example.com</td>
					<td>Dooley</td>
					<td>100</td>
					<td>200</td>
				</tr>
				<tr>
					<td>4</td>
					<td>john@example.com</td>
					<td>Doe</td>
					<td>100</td>
					<td>200</td>
				</tr>
				<tr>
					<td>5</td>
					<td>mary@example.com</td>
					<td>Moe</td>
					<td>100</td>
					<td>200</td>
					
				</tr>
				<tr>
					<td>6</td>
					<td>july@example.com</td>
					<td>Dooley</td>
					<td>100</td>
					<td>200</td>
				</tr>
				<tr>
					<td>7</td>
					<td>john@example.com</td>
					<td>Doe</td>
					<td>100</td>
					<td>200</td>
				</tr>
				<tr>
					<td>8</td>
					<td>mary@example.com</td>
					<td>Moe</td>
					<td>100</td>
					<td>200</td>
					
				</tr>
				<tr>
					<td>9</td>
					<td>july@example.com</td>
					<td>Dooley</td>
					<td>100</td>
					<td>200</td>
				</tr>
			</tbody>
		</table>
	</div>

	<c:import url="/WEB-INF/views/client/include/footer.jsp" />
</body>
</html>