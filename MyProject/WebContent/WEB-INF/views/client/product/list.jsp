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

<title>/WEB-INF/views/client/product/list.jsp</title>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp"/>
	
	<%--세부 카테고리 --%>
	<div class="container-fluid navbar navbar-expand-md bg-light navbar-light" style="margin-top:56px; position:sticky; top:56px;z-index:1;" >
		<div class="container">	
			<ul class="nav-item  navbar-nav">
				<h3>men></h3>
				<c:url var="path" value="/product/list">
					<c:param name="product_category1_idx" value="${product_category1_idx }"/>					
				</c:url>
				<a href="${path}" class="nav-link">전체보기</a>
				<c:url var="path" value="/product/list">
					<c:param name="product_category1_idx" value="${product_category1_idx }"/>
					<c:param name="product_category2_idx" value="1"/>					
				</c:url>
				<a  href="${path}" class="nav-link">상의</a>
				<c:url var="path" value="/product/list">
					<c:param name="product_category1_idx" value="${product_category1_idx }"/>
					<c:param name="product_category2_idx" value="2"/>					
				</c:url>
				<a  href="${path}" class="nav-link">하의</a>
				<c:url var="path" value="/product/list">
					<c:param name="product_category1_idx" value="${product_category1_idx }"/>
					<c:param name="product_category2_idx" value="3"/>					
				</c:url>
				<a  href="${path}" class="nav-link">기타</a>
			</ul>				
									
		</div>
	</div>
	
	<%--상품 리스트--%>
	
	<div class="container" style="margin-top:30px">
		<h1>${category_bean.product_category_name}</h1>
		
		<div class="row">
			<c:forEach var="obj" items="${productList}">
				<div class="col-md-3">
					<div class="card" style="margin-top:15px">
						<div style="padding : 5px">
							<c:url var="path" value="/upload/${obj.product_image}" />
							<img src="${path}" style="width:100%" />
						</div>
						<div class="card-body">
							<h3 class="card-title">${obj.product_name}</h3>
							<fmt:formatNumber var="a1" value="${obj.product_price}"/>
							<p class="card-text">${a1}원</p>
							
							<c:url var="path" value="/product/detail">
								<c:param name="product_idx" value="${obj.product_idx}"></c:param>
							</c:url>
							<a href="${path}" class="btn btn-primary">자세히보기</a>
						</div>
					</div>
				</div>
			</c:forEach>
						
		</div>
		
		<%--pagination --%>
		<%-- <ul class="pagination justify-content-center" style="margin-top:50px">
			<li class="page-item">
				<c:url var="path" value="/product/list" />
				<a href="${path}" class="page-link">이전</a>			
			</li>
			
			<c:forEach var="i" begin="1" end="10">
				<li class="page-item">				
				<a href="${path}" class="page-link">${i}</a>
				</li>			
			</c:forEach>
			
			<li class="page-item">				
				<a href="${path}" class="page-link">다음</a>			
			</li>
		</ul> --%>
	</div>
	
	<div style="margin-top:70px"></div>
	<c:import url="/WEB-INF/views/client/include/footer.jsp" />
</body>
</html>