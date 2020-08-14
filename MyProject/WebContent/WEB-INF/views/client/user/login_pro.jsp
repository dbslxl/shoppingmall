<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:url var="path1" value="/main"/>
<c:url var="path2" value="/user/login/"/>

<c:choose>
	<c:when test="${loginUserBean.user_name != null }">
		<script>
			alert("${loginUserBean.user_name}님 환영합니다.")
			location.href="${path1}"
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("로그인에 실패하였습니다.")
			location.href="${path2}"
		</script>
	</c:otherwise>
</c:choose>