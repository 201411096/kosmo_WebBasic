<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("userId");
	MemberDao memberDao = MemberDao.getInstance();
	boolean duplicateFlag = memberDao.isDuplicatedId(id);
%> 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 아이디 중복 확인 </title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function () {
			$("input[type=button]").on('click', function(){
//				opener.document.frm.id.value=document.getElementById("userId").value;
				$(opener.document).find('form').find('input[type=text]').eq(0).val( $('form').find('input[type=text]').val() );
				window.close();
			});
		})
	</script>
</head>
<body>
<%
	if( duplicateFlag ) {
%>
		사용중인 아이디가 있습니다. 다시 입력하여 주십시오.
<%  }else { %>
		사용할 수 있는 아이디입니다.
<%  } %>
	<form action=""> <!-- form에 action을 부여하지 않으면 자기 자신이 실행됨  -->
		<input type="text" name="userId" id="userId" value=<%=id%>>
		<input type="submit" value="중복확인">
		<input type="button" value="아이디채택">
	</form>
</body>
</html>