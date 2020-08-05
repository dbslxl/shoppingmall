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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
	$(function(){
		$("#input_box").summernote({
			height : 300
		})
		
		$("#input_box").summernote('code', '${content_bean.content_text}')
	})
	
	function set_text(){
		var str=$("#input_box").summernote("code")
		$("#content_text").val(str)
		return true
	}
</script>

<title>/WEB-INF/views/client/board/modify.jsp</title>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp"/>
	
	<div class='container' style='margin-top:100px'>
		
		<div class='row'>
			<div class='col-md-3'></div>
			<div class='col-md-6'>
			
				<h1>수정하기</h1>
				<div style='margin-top:20px'></div>
				<div class='card'>
					<div class='card-body'>
					
					<c:url var='path' value="/board/modify_pro"/>
					<form action='${path }' method='post' onsubmit="return set_text()">
						<input type="hidden" name="content_idx" value="${content_idx}">
						<input type="hidden" name="board_info_idx" value="${board_info_idx}">
						<input type="hidden" name="page" value="${page}">
						
						<div class='form-group'>
							<label for="board_name">게시판명</label>
							<input type='text' id='board_name' class='form-control' 
								   value='${board_info_bean.board_info_name }' disabled="disabled"/>
						</div>
						<div class='form-group'>
							<label for='board_subject'>제목</label>
							<input type='text' id='board_subject' name="content_subject" class='form-control'
								   value='${content_bean.content_subject }'/>
						</div>
						<div class='form-group'>
							<label for='board_text'>내용</label>
							<div id='input_box'></div>
							<input type="hidden" id="content_text" name="content_text"/>
						</div>
						<div class='form-group'>
							<c:url var='path' value='/board/read'/>
							<button class='btn btn-primary'>수정완료</button>
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