<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.board_mybatis.model.*, mvc.board_mybatis.service.*" %>
<% String projectName = "/JSP"; %>  
<%
// 	// 1. 삭제할 레코드의 게시글번호와 비밀번호를 넘겨받기
// 	String articleId = request.getParameter("articleId");
// 	String password = request.getParameter("password");
// 	// 2. Service에 delete() 호출
// 	DeleteArticleService service = DeleteArticleService.getInstance();
	
// 	int result = service.delete(articleId, password); 
	String result = (request.getAttribute("result")).toString(); //Object to Int
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 게시글 삭제 </title>
</head>
<body>

	<% if( Integer.parseInt(result) != 0) { %>
			글을 삭제하였습니다.
	<% } else { %>
			삭제가 실패되었습니다.
	<% } %>
	<br/><br/>
	<a href="<%=projectName %>/BoardMyBatisControl?cmd=list-page"> 목록보기 </a>
</body>
</html>