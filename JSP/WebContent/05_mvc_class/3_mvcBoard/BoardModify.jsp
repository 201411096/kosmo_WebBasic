<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.board.model.*, mvc.board.service.*" %>
<% String projectName = "/JSP"; %>

<%
	// 0. 넘겨받는 데이타의 한글 처리
	request.setCharacterEncoding("UTF-8");
%>
<%-- <jsp:useBean id="rec" class="board.model.BoardRec"> --%>
<%-- 	<jsp:setProperty name="rec" property="*"></jsp:setProperty> --%>
<%-- </jsp:useBean> --%>
<%-- <% --%>
<!-- // 	// 2. Service에 update() 호출하여 레코드 수정 -->
<!-- // 	ModifyArticleService modifyArticleService = ModifyArticleService.getInstance(); -->
<!-- // 	int result = modifyArticleService.update(rec); -->
<%-- %> --%>
	<%
		int result = Integer.parseInt((request.getAttribute("result")).toString());
		BoardRec rec = (BoardRec)request.getAttribute("boardRec");
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
<% response.sendRedirect(projectName+"/BoardControl?cmd=view-form&id="+rec.getArticleId()); %>
<% }else{ %>
암호가 잘못 입력되었습니다.
<a href="<%=projectName %>/BoardControl?cmd=list-page"> 목록보기 </a>
<%} %>
</body>
</html>