<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> 표현언어의 기본객체</title>
</head>
<body>

<%

	session.setAttribute("login", "당신의아이디");
	Cookie c = new Cookie("isFlag","true");
	response.addCookie(c);	// client에 저장해야 하기 때문에 보내줘야 됨 <-> 세션과 헷갈릴 수 있음
	
%>

	데이타 보냈습니다. <br/>
	
	<a href ="Second.jsp?data=important"> 다음 페이지 </a>
	
</body>
</html>