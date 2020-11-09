<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>
<%
	String user = request.getParameter("User");
	String password = request.getParameter("Pass");
	// 1. TempVO 객체에 멤버로 위의 값들을 지정
	TempVO vo = new TempVO();
	vo.setId(user);
	vo.setPassword(password);
	// 2. TempDAO의 login()을 호출하기
	TempDAO dao = TempDAO.getInstance();
	String loginCheck;
 	if(dao.login(vo)){
		loginCheck="로그인 성공";
	}else{
		loginCheck="로그인 실패";
	}
 	String loginCheck2=null;
 	if(dao.login2(vo)==0){
		loginCheck2="아이디가 존재하지 않습니다.";
	}else if(dao.login2(vo)==1){
		loginCheck2="비밀번호가 일치하지 않습니다.";
	}else if(dao.login2(vo)==2){
		loginCheck2="로그인 성공";
	}
 	if(dao.login2(vo)==1 || dao.login2(vo)==0){ //로그인 정보가 일치하지 않으면 
 		response.sendRedirect("01_first.jsp");
 	}
	
%>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 폼의 입력값 처리 </title>
</head>
<body>
	<h2>폼의 입력값 넘겨받아 처리</h2>
	입력한 아이디 : <%=user%>  <br/>
	입력한 패스워드 : <%=password%>
	<!-- 결과에 따른 로그인 성공 여부 출력  --> 
	<div> <%=loginCheck %> </div>
	<div> <%=loginCheck2 %> </div>
</body>
</html>