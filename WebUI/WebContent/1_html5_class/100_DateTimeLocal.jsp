<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="datetime-local" id="time1">
<input type="datetime-local" id="time2">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
var date1 = new Date().toJSON().slice(0,4)+'-01-01T00:00:00.000';
var date2 = new Date().toJSON().slice(0,4)+'-12-31T23:35:59.000';
$('#time1').val(date1);
$('#time2').val(date2);
console.log(date1);
</script>
</body>
</html>