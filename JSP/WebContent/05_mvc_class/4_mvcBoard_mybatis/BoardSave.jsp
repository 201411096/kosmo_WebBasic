<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.board_mybatis.model.*, mvc.board_mybatis.service.*" %>
<% String projectName = "/JSP"; %>
<%
	// 0. 넘겨받는 한글 깨지지 않도록 지정
	request.setCharacterEncoding("UTF-8");
%>

<!--  1. 전 화면 입력값을 넘겨받아 BoardRec 클래스의 각 멤버필드에 지정 -->
<%-- <jsp:useBean id="board" class="board.model.BoardRec"> --%>
<%-- 	<jsp:setProperty name="board" property="*"></jsp:setProperty> --%>
<%-- </jsp:useBean> --%>
<%
	// 2. Service클래스에 write() 함수호출
// 	WriteArticleService writeArticleService = WriteArticleService.getInstance();
// 	int articleId = writeArticleService.write(board);	
// 	// 3. 페이지 전환(이동)
// 	response.sendRedirect("BoardView.jsp?id="+ articleId);
%>

<%	
	String articleId = ((String)(request.getAttribute("articleId"))); //Object to Int
	response.sendRedirect(projectName+"/BoardMyBatisControl?cmd=view-form&id=" +articleId);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글저장</title>
</head>
<body>
입력되었는지 확인해보시구염...<br/>
만일 안되어도..환장하지 맙시다 !!! ^^<br/><br/>
</body>
</html>