<%@page import="mvc.board.service.ReplyArticleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String projectName = "/JSP"; %>    
<%@ page import="mvc.board_mybatis.model.*, mvc.board_mybatis.service.*" %>
<%@ page import="java.util.List" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%-- <jsp:useBean id="rec" class="board.model.BoardRec"> --%>
<%-- 	<jsp:setProperty name="rec" property="*"/> --%>
<%-- </jsp:useBean> --%>

	<%
		Board reRec = (Board)request.getAttribute("boardRec");
	%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 답변 글 저장하기 </title>
</head>
<body>

답변글을 등록하였습니다. <br/><br/>

<a href="<%= projectName %>/BoardMyBatisControl?cmd=list-page"> 목록보기 </a> &nbsp;
<a href="<%= projectName %>/BoardMyBatisControl?cmd=view-form&id=<%=reRec.getArticleId()%>"> 게시글 읽기 </a>

</body>
</html>