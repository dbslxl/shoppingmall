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
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h6>[${board_info_bean.board_info_name}] ${content_bean.content_subject}</h6>
				<div style="margin-top:20px "></div>
				<div class="card">
					<div class="card-body">
						<div class="from-group">
							<label for="board_writer_name">작성자 이름</label>							
							<input type="text" id="board_writer_name" class="form-control" value="${content_bean.content_writer_name}" disabled="disabled"/>							
						</div>
						<hr/>
						
						<div class="form-group" style="min-height:500px">
							<div>${content_bean.content_text}</div>
						</div>
						<hr/>
						
						<div class="form-group">
							<div>여기는 관리자 답변이 나오는 부분입니다.</div>
						</div>
						<hr/>
						
						<div class="form-group text-right">
							<c:url var="path" value="/board/list">
								<c:param name="board_info_idx" value="${board_info_idx}"/>
								<c:param name="page" value="${page}"/>
							</c:url>
							<a href="${path}" class="btn btn-info">목록보기</a>
							
							<c:url var="path" value="/board/modify">
								<c:param name="board_info_idx" value="${board_info_idx}"/>
								<c:param name="content_idx" value="${content_bean.content_idx}"/>
								<c:param name="page" value="${page}"></c:param>
							</c:url>
							<a href="${path }" class="btn btn-primary">수정하기</a>
							
							<c:url var="path" value="/board/delete">
								<c:param name="board_info_idx" value="${board_info_idx}"/>
								<c:param name="content_idx" value="${content_bean.content_idx}"/>
							</c:url>
							<a href="${path }" class="btn btn-danger">삭제하기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>		
	</div>
	<div style="margin:50px"></div>
	<c:import url="/WEB-INF/views/client/include/footer.jsp"/>
</body>
</html>