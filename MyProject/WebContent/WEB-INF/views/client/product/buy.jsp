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

<script>
	function set_buyer_info(){
		//로그인한 사용자 정보를 담아준다.
		$("#buy_name").val("${user_bean.user_name}")
		$("#buy_post_code").val("${user_bean.user_postcode}")
		$("#buy_address1").val("${user_bean.user_address1}")
		$("#buy_address2").val("${user_bean.user_address2}")
		$("#buy_phone1").val("${user_bean.user_phone1}")
		$("#buy_phone2").val("${user_bean.user_phone2}")
		$("#buy_phone3").val("${user_bean.user_phone3}")
		
	}
</script>
<title>/WEB-INF/views/client/product/buy.jsp</title>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp"/>
	
	<div class="container" style="margin-top:100px">
	
		<h1>구매 리스트</h1>
		
		<div style="margin-top:20px"></div>
		
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th style="width:10%">번호</th>
					<th class="text-left">상품명</th>
					<th style="width:10%">가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${buy_list}">
					<tr>
						<td>${obj.buy_temp_idx}</td>
						<td class="text-left">${obj.buy_temp_product_name}</td>
						<fmt:formatNumber var="a1" value="${obj.buy_temp_product_price }"/>
						<td>${a1}원</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="container" style="margin-top:50px">
		<h3>구매 정보</h3>
		<div style="margin-top:20px"></div>
		<div class="row">
			<div class="col-md-6">
				<c:url var="path" value="/product/buy_pro"></c:url>
				<form action="${path }" method="post">
					<div class="form-group">
						<label for="buy_name">구매이름</label>
						<input type="text" id="buy_name" name="reciever_name" class="form-control">
					</div>		
					
					<div class="form-group">
						<label for="buy_name">우편번호</label>
						<div class="input-group">
							<input type="text" id="buy_post_code" name="reciever_post_code" class="form-control" readonly="readonly"/>
							<div class="input-group-append">
								<button type="button" class="btn btn-primary">우편번호 찾기</button>
							</div>
						</div>
					</div>	
					
					<div class="form-group">						
						<input type="text" id="buy_address1" name="reciever_address1" class="form-control" readonly="readonly">
					</div>	
					<div class="form-group">						
						<input type="text" id="buy_address2" name="reciever_address2" class="form-control">
					</div>
					<div class="form-group">						
						<label for="buy_phone1">연락처</label>
						<div class="row">
							<div class="col-md-4">
								<select id="buy_phone1" name="reciever_phone1" class="form-control">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>								
							</div>
							<div class="col-md-4">
								<input type="text" id="buy_phone2" name="reciever_phone2" class="form-control" maxlength="4"/>
							</div>	
							<div class="col-md-4">
								<input type="text" id="buy_phone3" name="reciever_phone3" class="form-control" maxlength="4"/>
							</div>								
						</div>
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary" onclick="set_buyer_info()">회원 정보와 동일</button>
						
						<button type="submit" class="btn btn-primary">구매</button>
					</div>				
				</form>
			</div>
			<div class="col-md-6">
				<div class="display-3">총 결제 금액</div>
				<fmt:formatNumber var="a1" value="${price_total}"/>
				<div class="display-1">${a1}원</div>
			</div>
		</div>
	</div>
</body>
</html>