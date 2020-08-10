<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<%-- 다음 주소 검색 js 라이브러리 --%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:url var='path' value='/js/daum_address.js'/>
<script src='${path }'></script>

<script>
	function checkNewId(){
		//사용자가 입력한 아이디를 가져온다.
		var user_id = $("#user_id").val()
		
		//입력한 값이 없다면
		if(user_id.trim().length == 0){
			alert("아이디를 입력해주세요")
			$("#user_id").focus()
			return
		}
		<c:url var='path' value="/user/check_user_join_id"/>
		var data = {
				new_id : user_id
		}
		$.ajax({
			url:"${path}",
			type : "get",
			dataType : "text",
			data : data,
			success : function(result){
				if(result.trim()=="true"){
					alert("사용할수 있는 아이디 입니다.")
					$("#check_user_id").val("OK")
					$("#user_id").attr("readonly", "true")
				}else{
					alert("사용할수 없는 아이디 입니다.")
					$("#check_user_id").val("")
				}
			}
		})
	}
</script>
<title>/WEB-INF/views/client/user/join.jsp</title>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp"/>
	
	<%-- 다음 주소 검색 HTML --%>
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:100;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	
	<div class='container' style='margin-top:100px'>
		
		<div class='row'>
			<div class='col-md-3'></div>
			<div class='col-md-6'>
			
				
				<div style='margin-top:20px'></div>
				<div class='card'>
					<div class='card-body'>
					<h1 class="text-center">회원가입</h1>					
					<c:url var="path" value="/user/join_pro"/>
					<form action="${path}">
						
						
						<div class='form-group'>
							<label for="user_name">이름</label>
							<input id="user_name" class='form-control'/>
							
						</div>
						<div class='form-group'>
							<label for="user_id">아이디</label>
							<div class='input-group'>
								<input type="text" id="user_id" class='form-control'/>
								<div class='input-group-append'>
									<button type='button' class='btn btn-primary' onclick="checkNewId()">
										중복확인
									</button>
								</div>
							</div>
							
						</div>
						
						<div class='form-group'>
							<label for='user_pw'>비밀번호</label>
							<input type="text" id='user_pw' class='form-control'/>
							
						</div>
						<div class='form-group'>
							<label for='user_pw2'>비밀번호 확인</label>
							<form type="text" path='user_pw2' class='form-control'/>
							
						</div>
						<div class='form-group'>
							<label for="sample2_postcode">우편번호</label>
							<div class='input-group'>
								<input type="text" id='sample2_postcode' path="user_postcode" class='form-control' readonly="true"/>
								<div class='input-group-append'>
									<button type='button' class='btn btn-primary' onclick="sample2_execDaumPostcode()">
										주소검색
									</button>
								</div>								
							</div>
							
						</div>
						
						<div class='form-group'>
							<input type="text" id='sample2_address'  class='form-control' readonly="true"/>
							
						</div>						
						<div class='form-group'>
							<input type="text"  id='sample2_detailAddress'  class='form-control'/>
							
						</div>
						
						<div class='form-group'>
							<label for='user_phone1'>휴대폰 번호</label>
							<div class='row'>
								<div class='col-md-4'>
									<select path='user_phone1' class='form-control'>
										<option value='010'>010</option>
										<option value='011'>011</option>
										<option value='017'>017</option>
										<option value='018'>018</option>
										<option value='019'>019</option>
									</select>
								</div>
								<div class='col-md-4'>
									<input type="text" id='user_phone2' class='form-control' maxlength="4"/>
								</div>
								<div class='col-md-4'>
									<input type="text" id='user_phone3' class='form-control' maxlength="4"/>
								</div>
								
							</div>
							
						</div>
						
						<div class='form-group' style="margin:30px 10px">
							<button type="submit" class='btn btn-info' style="width:100%;">가입완료</button>							
						</div>
					</form>
					</div>
				</div>
			</div>
			<div class='col-md-3'></div>
		</div>
		
	</div>
</body>
</html>






















