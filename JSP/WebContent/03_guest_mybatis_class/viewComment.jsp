<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>   
  
      
  <!-- 키에 해당하는 글번호를 넘겨받아 서비스의 메소드 호출  -->
  <% 
  long commentNo = Integer.parseInt( request.getParameter("cId"));
  Comment comment = CommentService.getInstance().selectCommentByPrimaryKey(commentNo); 
  %>
     
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title> 메세지 보기 </title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#btnDelete').on('click', function(){
				console.log('삭제 버튼 이벤트 연결 확인');
				window.location="deleteComment.jsp?cId=<%=comment.getCommentNo()%>";
			});
			$('#btnModify').on('click', function(){
				console.log('수정 버튼 이벤트 연결 확인');
				window.location="updateCommentForm.jsp?cId=<%=comment.getCommentNo()%>";
			});
		});
	</script>
</head>
<body>
<table border="1">
		<tr><td>작성자</td><td><%=  comment.getUserId()%></td></tr>
		<tr><td>메세지</td><td><%=  comment.getCommentContent()%></td></tr>
		<tr><td>등록일</td><td><%=  comment.getRegDate()%></td></tr>
		<tr><td colspan="2">
				<input type="button" id="btnModify" value="수정" />
				<input type="button" id="btnDelete" value="삭제" />
				</td></tr>
</table>
</body>
</html>