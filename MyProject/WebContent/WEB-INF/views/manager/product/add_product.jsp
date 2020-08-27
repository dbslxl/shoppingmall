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
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 card">
				<h1 class="text-center">상품 등록	</h1>
				<c:url var="path" value="/manager/product/add_product_pro"/>
				<form action="${path}" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="product_category1_idx">상품 카테고리</label>
						<select class="form-control" name="product_category1_idx" id="product_category1_idx">						
							<option value="1">남자</option>
							<option value="2">여자</option>
							<option value="3">어린이</option>						
						</select>
					</div>
					<div class="form-group">
						<label for="product_category1_idx">상품 종류</label>
						<select class="form-control" name="product_category2_idx" id="product_category2_idx">						
							<option value="1">상의</option>
							<option value="2">하의</option>
							<option value="3">기타</option>						
						</select>
					</div>
					
					상품명 : <input  type="text" name="product_name" class="form-control"/><br/>
					가  격  : <input type="text" name="product_price" class="form-control"/><br/>
					<div class="form-group">
						대표이미지 : <input type="file" accept="image/*" name="upload_file1" class="form-control-file border"><br/>
						상세이미지 : <input type="file" accept="image/*" name="upload_file2" class="form-control-file border"><br/>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block form-submit">저장하기</button> 
					</div>
										
				</form>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>