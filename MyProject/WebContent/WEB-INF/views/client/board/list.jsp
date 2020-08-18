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


<style>
	a{
		color:black;
		text-decoration:none;
	}
	
</style>
<title>/WEB-INF/views/client/board/list.jsp</title>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp"/>
	
	<div class='container' style='margin-top:100px'>
		<div class="d-flex justify-content-between">
		<h2 class="ml-2" style="color:rgb(10,20,100)">${boardCategoryBean.board_category_name}</h2>
		<div>
			<button class="btn btn-danger">추천순</button>
			<button class="btn btn-info ml-1">최신순</button>
		</div>
		</div>
		<div style='margin-top:20px; margin-bottom:20px'>
			
			minPage:${pageBean.minPage }<br/>
			maxPage:${pageBean.maxPage }<br/>
			totalPage:${pageBean.totalPage }
			
		</div>
		
		
		<table class='table table-hover text-center'>
			<thead>
				<tr>
					<th style='width:10%'>글번호</th>
					<th class='text-left'>제목</th>
					<th style='width:16%'>작성자</th>
					<th style='width:7%'>조회수</th>
					<th style="width:7%">추천수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='obj' items="${contentList }">
				<tr>
					<td>${obj.content_idx}</td>
					<c:url var='path' value='/board/read'>
						<c:param name="content_idx" value='${obj.content_idx }'/>
						<c:param name="board_category_idx" value='${boardCategoryBean.board_category_idx }'/>
						<c:param name="page" value='${pageBean.currentPage }'/> 
					</c:url>
					<td class='text-left'><a class="link" href='${path}'>제목입니다.</a></td>
					<td>${obj.content_writer_id} </td>
					<td>${obj.content_read_cnt }</td>
					<td>10</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class='text-right' style='margin-top:10px' >
		<c:url var='path' value='/board/write'/>
		<a href='${path }' class='btn btn-primary'>글쓰기</a>
		</div>
		
		<%-- pagination --%>
		
		<ul class='pagination justify-content-center' style='margin-top:10px'>
			
			<c:choose>
				<c:when test="${pageBean.minPage==1}">
					<li class='page-item disabled'>
						<c:url var='path' value='/board/list'/>
						<a href='${path }' class='page-link'>이전</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class='page-item'>
						<c:url var='path' value='/board/list'>
							<c:param name="board_category_idx" value='${boardCategoryBean.board_category_idx }'/>
							<c:param name="page" value='${pageBean.minPage - 1 }'/> 
						</c:url>
						<a href='${path }' class='page-link'>이전</a>
					</li>
				</c:otherwise>
			</c:choose>		
			
				
			<c:forEach var='i' begin='${pageBean.minPage}' end='${pageBean.maxPage}'>
			<c:url var='path' value='/board/list'>
				<c:param name="board_category_idx" value="${boardCategoryBean.board_category_idx}"/>
				<c:param name="page" value="${i }"/>
			</c:url>			
			<c:choose>
				<c:when test="${pageBean.currentPage == i}">
					<li class='page-item active'>							
						<a href='${path }' class='page-link'>${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class='page-item'>							
						<a href='${path }' class='page-link'>${i }</a>
					</li>
				</c:otherwise>
			</c:choose>		
			
			</c:forEach>
			
			<c:choose>
				<c:when test="${pageBean.maxPage>=pageBean.totalPage}">
					<li class='page-item disabled'>
						<a href='${path }' class='page-link'>다음</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class='page-item'>
						<c:url var='path' value='/board/list'>
							<c:param name="board_category_idx" value='${boardCategoryBean.board_category_idx }'/>
							<c:param name="page" value='${pageBean.minPage - 1 }'/> 
						</c:url>
						<a href='${path }' class='page-link'>다음</a>
					</li>
				</c:otherwise>
			</c:choose>
						
		</ul>		
			
	</div>		
	
	<div style="margin-top:70px"></div>
	<c:import url="/WEB-INF/views/client/include/footer.jsp"/>
	
</body>
</html>