<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="info" class="info.beans.InfoBean">
	<jsp:setProperty name="info" property="name" />
  <jsp:setProperty name="info" property="id" />
</jsp:useBean>

<!DOCTYPE html>
<HTML>
<HEAD><TITLE> 자료 출력 </TITLE></HEAD>
<BODY>
	<H2>  당신의 신상명세서 확인 </H2>
	이   름  : <jsp:setProperty property="name" name="info"/> <br/>
	이   름  : <%=info.getName()%>  <br/>
	<hr/>
	이   름  : ${info.name} <br/> <!-- info.name은 property(변수) 지정이 아닌 getter method를 호출하는 것임  -->
	주민번호 : ${info.id} <br/>
	성  별   : ${info.gender} <br/>	<!-- src.info.beans에는 멤버변수로 gender가 존재하지 않음, getter method를 불러오는 것이기 때문에 정상적으로 실행이 가능함  -->  
	맞습니까????
</BODY>
</HTML>