<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:url var="path" value="/board/list">
	<c:param name="board_info_idx" value="${board_info_idx }"/>
	<c:param name="content_idx" value="${content_idx}"/>
</c:url> 
<script>
	alert("삭제되었습니다.")
	location.href="${path}"
</script>