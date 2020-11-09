<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.board.model.*" %>
<%@ page import="mybatis.board.service.*" %>

<%
	// 0. 넘겨받는 데이타의 한글 처리
	request.setCharacterEncoding("UTF-8");
%>

<!-- 1. 이전 화면의 입력값을 넘겨받아 BoardRec 객체의 각 멤버변수로 지정 -->
<%-- <%
	BoardRec rec = new BoardRec();
	rec.setArticleId(Integer.parseInt(request.getParameter("articleId")));
	rec.setPassword(request.getParameter("password"));
	rec.setTitle(request.getParameter("title"));
	rec.setContent(request.getParameter("content"));
	// 아래 부분이랑 같음
%> --%>
<jsp:useBean id="rec" class="mybatis.board.model.Board">
	<jsp:setProperty name="rec" property="*"></jsp:setProperty>
</jsp:useBean>
<%
/******************************** JDBC 사용 예시 *************************************/
	// 2. Service에 update() 호출하여 레코드 수정
// 	ModifyArticleService modifyArticleService = ModifyArticleService.getInstance();
// 	int result = modifyArticleService.update(rec);
/******************************** Mybatis 사용 예시 *************************************/
int result = BoardService.getInstance().update(rec);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글수정</title>
</head>
<body>

<%  // 게시글 수정이 성공적으로 되었다면 그 해당 게시글을 보여주는 페이지로 이동하고
    // 그렇지 않다면, "암호가 잘못 입력되었습니다"를 출력
%>
<% if(result==1){%>
<% response.sendRedirect("BoardView.jsp?id="+rec.getArticleId()); %>
<% }else{ %>
암호가 잘못 입력되었습니다.
<a href="BoardList.jsp"> 목록보기 </a>
<%} %>
</body>
</html>