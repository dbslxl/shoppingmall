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
				<h5 class="text-primary">[커뮤니티]</h5>
				<hr/>
				<h2>제목입니다.</h2>
				<div style="margin-top:20px "></div>
				<div class="card">
					<div class="card-header d-flex justify-content-between"  >
					<div>작성자ID (192.108.192.204)</div>
					<div>  2020-08-10 09:20:20</div>
					</div>
					<div class="card-body">
												
						<div class="form-group" style="min-height:480px">
							<div>내용 입니다.</div>
						</div>
						<div class="text-center">
						<button type="button" class="btn btn-info">추&nbsp천&nbsp<span class="badge badge-light">4</span></button>
						<button class="btn btn-secondary">비추천</button>
						</div>
						
						<div style="margin-top:30px">
							<h5 >전체 댓글 3개</h5>	
							<hr/>	
							<div class="form-group">
								<div>여기는 관리자 답변이 나오는 부분입니다.</div>
								<hr/>
								<div>여기는 관리자 답변이 나오는 부분입니다.</div>
								<hr/>
								<div>여기는 관리자 답변이 나오는 부분입니다.</div>
							</div>
						</div>
						
					</div>	
					<div class="card-footer">
						<div class="form-group">
						<textarea class="form-control" rows="5" cols="100"></textarea>
						<div class="text-right mt-1"><button class="btn btn-primary">등록하기</button></div>
						</div>	
					</div>				
				</div>
				
													
				
				
				<div class="form-group text-right mt-4">
							<c:url var="path" value="/board/list">
								<%-- <c:param name="board_info_idx" value="${board_info_idx}"/>
								<c:param name="page" value="${page}"/> --%>
							</c:url>
							<a href="${path}" class="btn btn-info">목록보기</a>
							
							<c:url var="path" value="/board/modify">
								<%-- <c:param name="board_info_idx" value="${board_info_idx}"/>
								<c:param name="content_idx" value="${content_bean.content_idx}"/>
								<c:param name="page" value="${page}"></c:param> --%>
							</c:url>
							<a href="${path }" class="btn btn-primary">수정하기</a>
							
							<c:url var="path" value="/board/delete">
								<%-- <c:param name="board_info_idx" value="${board_info_idx}"/>
								<c:param name="content_idx" value="${content_bean.content_idx}"/> --%>
							</c:url>
							<a href="${path }" class="btn btn-danger">삭제하기</a>
						</div>
			</div>
			
			<div class="col-md-1"></div>
		</div>		
	</div>
	<div style="margin:50px"></div>
	<c:import url="/WEB-INF/views/client/include/footer.jsp"/>
</body>
</html>