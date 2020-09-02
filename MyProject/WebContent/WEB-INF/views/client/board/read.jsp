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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	
		
<title>/WEB-INF/views/client/main.jsp</title>

<script>

	function like_button(){
		<c:choose>
		<c:when test="${loginUserBean.user_name==null }">
			alert("로그인 해주세요")
			return;
		</c:when>
		<c:otherwise>
			<c:url var='path' value="/board/like_pro"/>
			var data = {			
				like_user_idx: ${loginUserBean.user_idx},
			    like_content_idx: ${contentBean.content_idx},
			    like_or_dislike:1
			}
			$.ajax({
				url:"${path}",
				type : "post",
				dataType : "text",
				data : data,
				success : function(result){
					if(result.trim()=="up"){
						document.getElementById("like-badge").innerHTML=parseInt(document.getElementById("like-badge").innerHTML)+1
					}else if(result.trim()=="down"){
						document.getElementById("like-badge").innerHTML=parseInt(document.getElementById("like-badge").innerHTML)-1
					}else{
						alert("이미 비공감한 글입니다");
					}
				}
			})
		</c:otherwise>
		</c:choose>
	}
</script>
<script>

	function dislike_button(){
		<c:choose>
		<c:when test="${loginUserBean.user_name==null }">
			alert("로그인 해주세요")
			return;
		</c:when>
		<c:otherwise>
			<c:url var='path' value="/board/like_pro"/>
			var data = {			
				like_user_idx: ${loginUserBean.user_idx},
			    like_content_idx: ${contentBean.content_idx},
			    like_or_dislike:2
			}
			$.ajax({
				url:"${path}",
				type : "post",
				dataType : "text",
				data : data,
				success : function(result){
					if(result.trim()=="up"){
						document.getElementById("dislike-badge").innerHTML=parseInt(document.getElementById("dislike-badge").innerHTML)+1
					}else if(result.trim()=="down"){
						document.getElementById("dislike-badge").innerHTML=parseInt(document.getElementById("dislike-badge").innerHTML)-1
					}else{
						alert("이미 공감한 글입니다");
					}
				}
			})
		</c:otherwise>
		</c:choose>
	}
</script>
	<%--  function check_login(){
		<c:choose>
			<c:when test='${loginUserBean.user_name == null}'> 
				alert("로그인 해주세요")
				return false;
			</c:when>
			<c:otherwise>
				return true;
			</c:otherwise>
		</c:choose>	
	}   --%>


<script>	
	function check_login(){
		if(${loginUserBean.user_name==null}){
			alert("로그인 해주세요")
			return false;
		}else{
			return true;
		}
	}
</script>
<c:choose>
	<c:when test="${message!=null}">
		<script>alert("${message}")</script>
	</c:when>
</c:choose>
</head>
<body>
	<c:import url="/WEB-INF/views/client/include/top_menu.jsp"/>
	
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h5 class="text-primary">${boardCategoryBean.board_category_name }</h5>
				<hr/>
				<h2>${contentBean.content_subject}</h2>
				<div style="margin-top:20px "></div>
				<div class="card">
					<div class="card-header d-flex justify-content-between"  >
						<div><span class="mr-3 font-weight-bold">${contentBean.content_writer_id}님</span><span>${contentBean.content_date}</span></div>
						<div>
							<span class="mr-1">조회수&nbsp${contentBean.content_read_cnt}</span>
							<sapn class="mr-1">공감&nbsp${contentBean.content_like_cnt}</sapn>
							<sapn>비공감&nbsp${contentBean.content_dislike_cnt}</sapn>
						</div>
					</div>
					<div class="card-body">
												
						<div class="form-group" style="min-height:480px">
							<div>${contentBean.content_text}</div>
						</div>
						<div class="text-center">
						<button type="button" id="like-button" onclick="like_button()" class="btn btn-info">공&nbsp감&nbsp<span id="like-badge" class="badge badge-light">${contentBean.content_like_cnt}</span></button>
						<button type="button" id="dislike-button" onclick="dislike_button()" class="btn btn-secondary">비공감<span id="dislike-badge" class="badge badge-light">${contentBean.content_dislike_cnt}</span></button>
						</div>
						
						<div style="margin-top:30px">
							<h5 >전체 댓글 ${contentBean.content_comment_cnt}개</h5>							
							<div class="mt-3">								
								<c:forEach var="obj" items="${commentList}">									
									<table class="table">									
										<tbody>
											<td style='width:15%' class=" font-weight-bold" >${obj.comment_user_id}</td>
											<td style="width:50%" class="">${obj.comment_text}</td>
											<td style="width:20%" class="">${obj.comment_date}</td>
											<c:url var="path" value="/board/delete_comment">
												<c:param name="comment_idx" value="${obj.comment_idx }"/>
												<c:param name="comment_user_idx" value="${loginUserBean.user_idx}"/>
												<c:param name="board_category_idx" value="${boardCategoryBean.board_category_idx}"/>
												<c:param name="content_idx" value="${contentBean.content_idx}"/>
												<c:param name="page" value="${page}"/>												
											</c:url>
											<c:if test="${loginUserBean.user_name!=null}">
												<td style="width:2%"><a class="text-danger" href="${path }">x</a></td>
											</c:if>
											
										</tbody>										
									</table>									
								</c:forEach>								
							</div>
						</div>
						
					</div>	
					<div class="card-footer">
						<c:url var="path" value="/board/add_comment"/>
						<form action="${path}" method="post" onsubmit="return check_login()">						
							<div class="form-group">
							<input type="hidden" name="board_category_idx" value="${boardCategoryBean.board_category_idx}">
							<input type="hidden" name="content_idx" value="${contentBean.content_idx}">
							<input type="hidden" name="page" value="${page}">
							<textarea name="comment_text" class="form-control" rows="5" cols="100"></textarea>
							<div class="text-right mt-1"><button class="btn btn-primary">등록하기</button></div>
							</div>	
						</form>
						
					</div>				
				</div>
				
													
				
				
				<div class="form-group text-right mt-4">
							<c:url var="path" value="/board/list">
								<c:param name="board_category_idx" value="${boardCategoryBean.board_category_idx}"/>
								<c:param name="page" value="${page}"/>
							</c:url>
							<a href="${path}" class="btn btn-info">목록보기</a>
							
							<c:url var="path" value="/board/modify">
								<c:param name="board_info_idx" value="${boardCategoryBean.board_category_idx}"/>
								<c:param name="content_idx" value="${contentBean.content_idx}"/>
								<c:param name="page" value="${page}"></c:param>
							</c:url>
							<a href="${path }" class="btn btn-primary">수정하기</a>
							
							<c:url var="path" value="/board/delete">
								<c:param name="board_info_idx" value="${boardCategoryBean.board_category_idx}"/>
								<c:param name="content_idx" value="${contentBean.content_idx}"/>
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