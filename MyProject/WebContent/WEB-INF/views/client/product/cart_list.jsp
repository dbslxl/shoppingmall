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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script>

function check_all(){	
	$("input:checkbox").prop("checked",true)	
}
function uncheck_all(){	
	$("input:checkbox").prop("checked",false)	
}

function buy_all(){
	check_all()
	buy_checked()
}
	
function buy_checked(){
	var param = ''
		
	if($("input:checkbox:checked").length > 0){
		$("input:checkbox:checked").each(function(index){
			if(index == 0){
				param = '?buy_temp_product_idx=' + $(this).data('product-idx')
			} else {
				param += '&buy_temp_product_idx=' + $(this).data('product-idx')
			}
		})
		
		<c:url var='path' value='/product/add_temp'/>
		
		// 구매 페이지를 요청한다.
		location.href = '${path}' + param
		
	} else {
		alert("상품을 선택해주세요")
	}
}

function check_all(){
	if(document.getElementById("checkbox_all").checked){
		$("input:checkbox").prop("checked",true)
	}else{
		$("input:checkbox").prop("checked",false)	
	}
	
}
</script>

<title>/WEB-INF/views/client/cart/list.jsp</title>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp"/>
	
	<div class="container" style="margin-top:100px">
		<h1>장바구니</h1>
		
		<div style="margin-top:20px"></div>
		
		<form>
			<table class="table text-center">
				
				<thead>
					<tr>
						<th style="width:10%"><!-- <input type="checkbox" id="checkbox_all" onclick="check_all()"> --></th>
						<th style="width:10%">번호</th>
						<th>상품명</th>
						<th style="width:20%">날짜</th>
						<th style="width:20%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="obj" items="${cartList}" varStatus="idx">						
						<tr>
							<td><input type="checkbox" name="cart_idx"  value="${obj.cart_idx}" class="f-c" data-product-idx="${obj.cart_product_idx }"/></td>
							<td>${idx.index+1}</td>
							<td>${obj.cart_product_name}</td>
							<td>${obj.cart_date}</td>
							<td>
								<c:url var="path" value="/product/add_temp">
									<c:param name="buy_temp_product_idx" value="${obj.cart_product_idx }"/>
								</c:url>
								<a href="${path}" type="button" class="btn btn-primary">
								구매
								</a>
								
								<c:url var="path" value="/cart/delete_cart">
									<c:param name="cart_idx" value="${obj.cart_idx}"></c:param>
								</c:url>
								<a href="${path}" class="btn btn-danger">삭제 </a>
								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			
			</table>
			<hr/>
			<div class="text-center mt-5">
				<button type="button" class="btn btn-success" onclick="buy_all()">전체 구매</button>
				<button type="button" class="btn btn-info" onclick="buy_checked()">선택 구매</button>	
			</div>
					
			
			
		</form>
	</div>
	
	
</body>
</html>