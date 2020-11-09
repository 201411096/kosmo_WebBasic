<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mybatis.guest.model.*"%>
<%@ page import="mybatis.guest.service.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	long commentNo = Integer.parseInt(request.getParameter("cId"));
	int result = CommentService.getInstance().deleteComment(commentNo);
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(result==1){ %>
	성공적으로 삭제 되었습니다.	<a href="listComment.jsp">글 목록</a>
	<%} else{%>
	삭제에 실패했습니다. <a href="listComment.jsp">글 목록</a>
	<%} %>
</body>
</html>