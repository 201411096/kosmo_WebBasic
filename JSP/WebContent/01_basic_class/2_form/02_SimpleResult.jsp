<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 1. 이전 화면의 폼의 입력값들 얻어오기  -->
<%
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String occupation = request.getParameter("occupation");
String hobby [] = request.getParameterValues("hobby");

/* hobby를 string 하나로 합쳐서 하는 방법
String hstr="";
	for(int i=0; hobby!=null && i<hobby,length; i++){ //&&연산시 앞에꺼부터 처리해서 null point error가 발생하지 않음 (short-circuit evaluation의 특성을 활용)
		hstr+=hobby[i]+"/";
	}
*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 얻어온 입력값들을 출력  -->
<div> name : <%=name%> </div>
<div> gender : <%=gender%> </div>
<div> occupation : <%=occupation%> </div>
<div> hobby :
<% if(hobby!=null){ %>
	<% for(int i=0; i<hobby.length; i++){ %>
		<%=hobby[i]%>
	<%} %>
<%} %>
</div>
</body>
</html>