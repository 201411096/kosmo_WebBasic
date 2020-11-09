<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import='temp.*' %>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String tel = request.getParameter("tel");
String adr = request.getParameter("adr");
TempVO vo = new TempVO(id, password, name, tel, adr);
//TempDAO dao = new TempDAO();
TempDAO dao = TempDAO.getInstance();
dao.insert(vo);
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<div> id : <%=id%></div>
	<div> password : <%=password%></div>
	<div> name :  <%=name%></div>
	<div> tel :  <%=tel%></div>
	<div> adr :  <%=adr%></div>
</body>
</html>