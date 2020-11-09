<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.board_mybatis.model.*, mvc.board_mybatis.service.*" %>
<%@ page import="java.util.List" %>

<%  //웹브라우저가 게시글 목록을 캐싱할 경우 새로운 글이 추가되더라도 새글이 목록에 안 보일 수 있기 때문에 설정
	String projectName = "/JSP"; 	
	response.setHeader("Pragma","No-cache");		// HTTP 1.0 version
	response.setHeader("Cache-Control","no-cache");	// HTTP 1.1 version
	response.setHeader("Cache-Control","no-store"); // 일부 파이어폭스 버스 관련
	response.setDateHeader("Expires", 1L);			// 현재 시간 이전으로 만료일을 지정함으로써 응답결과가 캐쉬되지 않도록 설정
	
%>

<%
request.setCharacterEncoding("UTF-8");

List <Board> mList = (List<Board>)request.getAttribute("mList");
int totalPageCount = ((Integer)request.getAttribute("totalPageCount")).intValue();

%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 게시글 목록 </title>
</head>
<BODY>
	<h3> 게시판 목록 </h3>
	<table border="1" bordercolor="darkblue">
	<tr>
		<td> 글번호 </td>
		<td> 제  목 </td>
		<td> 작성자 </td>
		<td> 작성일 </td>
		<td> 조회수 </td>
	</tr>
	<% if( mList.isEmpty() ) { %>
		<tr><td colspan="5"> 등록된 게시물이 없습니다. </td></tr>
	<% } else { %>
		<% for(int i=0; i<mList.size(); i++) {%>
		<tr>
			<td><%=mList.get(i).getArticleId()%></td>
			<td>
			 	<%for(int j=0; j<mList.get(i).getLevel(); j++){ %>
			 		&nbsp;
			 	<%} //end of for %>
			 	<%if(mList.get(i).getLevel()!=0){%>
			 		<img src='<%= projectName %>/05_mvc_class/4_mvcBoard_mybatis/imgs/board_re.gif'/>
			 	<%} //end of if%>
<%-- 				 <a href='BoardView.jsp?id=<%=mList.get(i).getArticleId()%>'> --%>
					<a href=' <%= projectName %>/BoardMyBatisControl?cmd=view-form&id=<%=mList.get(i).getArticleId()%>'>
				 <%=mList.get(i).getTitle()%>
				 </a>
			 </td>
			<td><%=mList.get(i).getWriterName()%></td>
			<td><%=mList.get(i).getPostingDate()%></td>
			<td><%=mList.get(i).getReadCount()%></td>
		</tr>
		<% } //end for %> 
	<% } // end else %>
		<tr>
			<td colspan="5">
				<a href="<%= projectName %>/BoardMyBatisControl?cmd=input-form">글쓰기</a>
			</td>
		</tr>
	</table>
	<!-- 방법_01 : 페이지 번호 표시 및 클릭시 해당 페이지 링크  -->
	<%for(int i=1; i<=totalPageCount; i++){ %>
		<a href='<%= projectName %>/BoardMyBatisControl?cmd=list-page&page=<%=i%>'>[<%=i%>]</a> <!-- 페이지 번호  -->
	<%} %>
	<!-- end of for  -->
	
</BODY>
</HTML>
