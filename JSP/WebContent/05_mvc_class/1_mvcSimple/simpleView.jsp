<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%
	//******************************** request.setAttribute로 받은 값들을 request.getAttribute로 받아야됨
	// *** request.getParameter 사용자가 준 데이터를 받을 때(querystring 등..)
	// *** request.getAttribute 서버쪽에서 저장한 값을 받아올 때 
	Object obj = request.getAttribute("param");
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 메인이라네 </title>
</head>
<body>
	
		<%= obj %> <br/>
		복잡하다고 지나친 좌절과 놀람은 금물입니다. <br/><br/>
		<img src="05_mvc_class/1_mvcSimple/imgs/sponge_1.JPG"/><br/><br/>
		<!-- 이미지 경로 자체가 서블릿을 기준으로 잡혀있음  -->

</body>
</html>