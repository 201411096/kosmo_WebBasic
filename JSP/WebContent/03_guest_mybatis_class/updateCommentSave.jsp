<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.guest.model.*"%>
<%@ page import="mybatis.guest.service.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	System.out.println(request.getParameter("cId"));
	long commentNo = Integer.parseInt(request.getParameter("cId"));
	//앞에서 가져온 id에 해당하는 글의 정보를 가져옴
	Comment comment = CommentService.getInstance().selectCommentByPrimaryKey(commentNo);
	//앞에서 수정한 작성자의 id와 comment의 내용을 가져와서 객체 세팅
	comment.setUserId(request.getParameter("userId"));
	comment.setCommentContent(request.getParameter("commentContent"));
	
	int result = CommentService.getInstance().updateComment(comment);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(result==1){ %>
	성공적으로 수정되었습니다.	<a href="listComment.jsp">글 목록</a>
	<%} else{%>
	수정에 실패했습니다. <a href="listComment.jsp">글 목록</a>
	<%} %>
</body>
</html>