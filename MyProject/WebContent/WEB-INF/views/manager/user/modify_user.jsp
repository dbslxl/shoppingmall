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
	<c:choose>
		<c:when test="${userBean.user_grade==1}">
			<c:url var="path" value="/manager/user/user_list"/>
		</c:when>
		<c:otherwise>
			<c:url var="path" value="/manager/user/manager_list"/>
		</c:otherwise>
	</c:choose>	
<script type="text/javascript">
	alert("수정 되었습니다.")
	location.href="${path}"
</script>