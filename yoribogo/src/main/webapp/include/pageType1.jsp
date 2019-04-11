<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${prev eq true}"> <!-- ${prev} -->
	<li><a href="${param.link}?pageNo=${pageResult.beginPage-1}">&lt;</a></li>
</c:if>
<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
	<li><a href="${param.link}?pageNo=${i}">${i}</a></li>
</c:forEach>
<c:if test="${next eq true}">
	<li><a href="${param.link}?pageNo=${pageResult.endPage+1}">&gt;</a></li>
</c:if>
