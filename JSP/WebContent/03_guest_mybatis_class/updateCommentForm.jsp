<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.guest.model.*"%>
<%@ page import="mybatis.guest.service.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	long commentNo = Integer.parseInt(request.getParameter("cId"));
	Comment comment = CommentService.getInstance().selectCommentByPrimaryKey(commentNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frm" action="updateCommentSave.jsp" method="get" >
<input type="hidden" name="cId" value="<%=commentNo%>"/>
<table>
<!-- 	<tr><td>글번호</td><td><input type="text" name="commentNo" size="3"/></td></tr> -->

	<tr><td>사용자</td><td><input type="text" name="userId" size="15" value="<%=comment.getUserId()%>" /></td></tr>
	<tr><td>메세지</td><td><textarea name="commentContent" rows="10" columns="40"><%=comment.getCommentContent()%></textarea></td></tr>
	<tr><td><input type="submit" value="수정"/></td></tr>
</table>
</form>
</body>
</html>