<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 글쓰기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			//$('input[value="작성"]').on('click', function(){})
			// $('form input[type=button]').on('click', function(){
			$('#button1').on('click', function(){
				//$('form').submit();
				$('form[name=frm]').attr('action', 'BoardSave.jsp');
				
				//유효성 검사 하는 부분 시작
				
				//유효성 검사 하는 부분 끝
				
				$('form[name=frm]').submit();
			});
			$('#button2').on('click', function(){
				console.log('b');
				location.href="BoardList.jsp";
			});
		});
	</script>
</head>
 <body>
	<h4> 게시판 글 쓰기 </h4><br/>
	나중에 이쁘게 만드시오 <br/><br/>
	<form name='frm' method='post'>
	작성자 : <input type='text' name='writerName'><br/><br/>
	제  목 : <input type='text' name='title'><br/><br/>
	내  용 : <textarea rows='10' cols='40' name='content'></textarea><br/><br/>
	패스워드(수정/삭제시 필요) :
			 <input type='password' name='password'><br/><br/>
	<input type='button' id='button1' value='작성'>
	<input type='button' id='button2' value='취소'>
	</form>

</body>
</html>