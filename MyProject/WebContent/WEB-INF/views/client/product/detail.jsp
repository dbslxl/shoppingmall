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

<title>/WEB-INF/views/client/product/detail.jsp</title>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp"/>
	
	<div class="container" style="margin-top:100px">
		<div class="row">
		
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-6" >
					<div class="card" style="margin:20px">
						<div style="padding:5px">
							<c:url var="path" value="/image/thumbnail.jpg"/>
							<img src="${path}" class="card-img-top" style="width:100%"/>	
									
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div style="margin:20px;" >
						<h1 class="card-title">상품명 </h1>
						<hr/>
						<h3 class="card-text">판매가  :  7,9000원</h3>
						
						
						<div style=" margin-top:300px">
							<c:url var="path" value="/cart/add_cart">
								<c:param name="cart_product_idx" value="${product_bean.product_info_idx}"/>
							</c:url>
							<a href="${path}" class="btn btn-danger" style="width:45%">장바구니 담기</a>	
												
							<c:url var="path" value="/product/add_temp">
								<c:param name="buy_temp_product_idx" value="${product_bean.product_info_idx }"/>
							</c:url>
							<a href="${path}" class="btn btn-primary" style="width:45%">구매 하기</a>						
						</div>
						
												
						<c:url var="path" value="/product/list">
							<c:param name="product_category_idx" value="${product_bean.product_info_category_idx}"/>
						</c:url>
						<a href="${path}" class="btn btn-dark" style="width:90%;margin-top:7px">목록 보기</a>
					</div>				
				</div>				
			</div>							
		</div>		
		</div>
		
		<hr style="margin:100px 0px"/>
		
		
		
		<div class="row" >
			<div class="col-md-1"></div>
			<div class="col-md-10">
			<c:url var="path" value="/image/detail.jpg"/>
			<img alt="jenny" src="${path}" width="100%">
			
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/client/include/footer.jsp"/>
</body>
</html>