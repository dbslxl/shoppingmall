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

<title>/WEB-INF/views/client/board/list.jsp</title>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp"/>
	
	<div class='container' style='margin-top:100px'>
		
		<h1>${board_info_bean.board_info_name }</h1>
		
		<div style='margin-top:20px'></div>
		
		<table class='table table-hover text-center'>
			<thead>
				<tr>
					<th style='width:10%'>글번호</th>
					<th class='text-left'>제목</th>
					<th style='width:20%'>작성자</th>
					<th style='width:10%'>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='obj' items="${content_list }">
				<tr>
					<td>${obj.content_idx }</td>
					<c:url var='path' value='/board/read'>
						<c:param name="content_idx" value='${obj.content_idx }'/>
						<c:param name="board_info_idx" value='${board_info_idx }'/>
						<c:param name="page" value='${page_bean.currentPage }'></c:param>
					</c:url>
					<td class='text-left'><a href='${path}'>${obj.content_subject }</a></td>
					<td>${obj.content_writer_name }</td>
					<td>${obj.content_read_cnt }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<%-- pagination --%>
		
		<ul class='pagination justify-content-center' style='margin-top:50px'>
			
			<c:choose>
				<c:when test="${page_bean.minPage == 1 }">
					<li class='page-item disabled'>
						<c:url var='path' value='/board/list'/>
						<a href='${path }' class='page-link'>이전</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class='page-item'>
						<c:url var='path' value='/board/list'>
							<c:param name="board_info_idx" value='${board_info_idx }'/>
							<c:param name="page" value='${page_bean.minPage - 1 }'/>
						</c:url>
						<a href='${path }' class='page-link'>이전</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			
				
			<c:forEach var='i' begin='${page_bean.minPage }' end='${page_bean.maxPage }'>
			<c:url var='path' value='/board/list'>
				<c:param name="board_info_idx" value='${board_info_idx }'/>
				<c:param name="page" value='${i }'/>
			</c:url>
			
			<c:choose>
				<c:when test="${page_bean.currentPage == i}">
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
				<c:when test="${page_bean.maxPage >= page_bean.totalPage }">
					<li class='page-item disabled'>
						<a href='${path }' class='page-link'>다음</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class='page-item'>
						<c:url var='path' value='/board/list'>
							<c:param name="board_info_idx" value='${board_info_idx }'/>
							<c:param name="page" value='${page_bean.maxPage + 1 }'/>
						</c:url>
						<a href='${path }' class='page-link'>다음</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			
				
		</ul>
		
		
		<c:if test='${board_info_idx == 3 || board_info_idx == 4 }'>
		<div class='text-right'>
			<c:url var='path' value='/board/write'>
				<c:param name="board_info_idx" value='${board_info_idx }'/>
			</c:url>
			<a href='${path }' class='btn btn-primary'>글쓰기</a>
		</div>
		</c:if>
	</div>
</body>
</html>