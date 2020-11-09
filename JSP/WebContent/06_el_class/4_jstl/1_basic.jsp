<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- directive tag @  -->
<!-- page / inclue / tablib  -->
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 변수선언  -->
<c:set var='gender' value='male' ></c:set>
<c:if test="${gender eq 'male' }">당신은 남정네</c:if>
<c:if test="${gender eq 'female' }">당신은 여인네</c:if>
<c:set var='age'>25</c:set>
<%-- <c:if test="${age >= 20 }"> 성인입니다. </c:if> --%>
<!-- <hr> -->
<%-- <c:if test="${age ge 20 }"> 성인입니다. </c:if> --%>

<!-- 어린이는 10세 미만, 청소년은 10세이상에서 20미만  -->
<c:choose>
	<c:when test="${age lt 10}">어린이</c:when>
	<c:when test="${age ge 10 and age lt 20}">청소년</c:when>
	<c:otherwise>성인</c:otherwise>
</c:choose>
<hr/>
<c:forEach var='i' begin="1" end='100'>
	<c:set var='sum' value='${sum+i}'></c:set>
</c:forEach>
${sum }
<c:forEach var='i' begin="1" end='100'>
	<c:if test="${i%2==1}">
		<c:set var='oddsum' value='${oddsum+i}'></c:set>
	</c:if>
</c:forEach>
<c:forEach var='i' begin="1" end='100'> 
	<c:if test="${i%2==0}">
		<c:set var='evensum' value='${evensum+i}'></c:set>
	</c:if>
</c:forEach>
<hr/>
홀수 합 : ${oddsum }
짝수 합 : ${evensum }
</body>
</html>