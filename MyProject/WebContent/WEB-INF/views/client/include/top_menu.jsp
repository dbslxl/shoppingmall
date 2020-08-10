<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WEB-INF/views/client/include/top_menu.jsp --%>
<%-- 상단 메뉴 부분 --%>
<style>
.logo {
	border: 2px solid teal;
	border-radius: 10px;
	padding: 5px;
	color: black;
}

.community{
	color:rgb(50,50,150,0.9)
}

</style>
<nav class='navbar bg-dark navbar-dark navbar-expand-md fixed-top'>
<div class="container">
	<%-- 로고 --%>
	<c:url var="path" value="/main"/>
	<a href='${path }' class="btn  btn-outline-info mr-3 ">Hyun</a>

	<%-- 버튼 --%>
	<button class='navbar-toggler' type='button' data-toggle='collapse'
	        data-target='#navMenu'>
		<span class='navbar-toggler-icon'></span>        
	</button>
	<%-- 메뉴 --%>
	<div class='collapse navbar-collapse ' id='navMenu'>
		
		<%-- 좌측 메뉴 --%>
		<ul class='navbar-nav'>
			<li class='nav-item'>
				<c:url var='path' value='/product/list'/>
				<a href='${path }' class='nav-link'>Men</a>
			</li>
			<li class='nav-item'>
				<c:url var='path' value='/product/list'/>
				<a href='${path }' class='nav-link'>Women</a>
			</li>
			<li class='nav-item'>
				<c:url var='path' value='/product/list'/>
				<a href='${path }' class='nav-link'>Kids</a>
			</li>
			
			<li class='nav-item dropdown'>
				<a href='#' class='nav-link dropdown-toggle' 
							data-toggle='dropdown'>Board</a>							
				<div class='dropdown-menu'>
					<c:url var='path' value='/board/list'/>
					<a href="${path }" class='dropdown-item'>공지사항</a>
					<a href="${path }" class='dropdown-item'>FAQ</a>
					<a href="${path }" class='dropdown-item'>Q&A</a>			
				</div>
			</li>
			
			<li class='nav-item'>
				<c:url var='path' value='/board/list'/>
				<a href='${path }' class='nav-link community' style="color:rgb(75,150,255)">Community</a>
			</li>									
		</ul>
		
		<%-- 우측 메뉴 --%>
		<ul class='navbar-nav ml-auto'>
			
			<c:choose>
				<c:when test="${loginUserBean.user_login_value == true }">
					<li class='nav-item'>
						<c:url var='path' value='/user/info'/>
						<a href='${path }' class='nav-link'>내 정보</a>
					</li>
					<li class='nav-item'>
						<c:url var='path' value='/cart/list'/>
						<a href='${path }' class='nav-link'>장바구니</a>
					</li>
					<li class='nav-item'>
						<c:url var='path' value='/user/buy_history'/>
						<a href='${path }' class='nav-link'>구매이력</a>
					</li>
					
					<c:if test='${loginUserBean.user_grade == 2 }'>
					<li class='nav-item'>
						<c:url var='path' value='/manager/main'/>
						<a href='${path }' class='nav-link'>관리자페이지</a>
					</li>
					</c:if>
					
					<li class='nav-item'>
						<c:url var='path' value='/user/logout'/>
						<a href='${path }' class='nav-link'>로그아웃</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class='nav-item'>
						<c:url var='path' value='/user/login'/>
						<a href='${path }' class='nav-link'>Login</a>
					</li>
					<li class='nav-item'>
						<c:url var='path' value='/user/join'/>
						<a href='${path }' class='nav-link'>Join</a>
					</li>
				</c:otherwise>
			</c:choose>
			
		</ul>
	</div>
</div>	
</nav>
