<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("input[type=button]").on('click', function(event){
				
				if(validateCheck()==true){
					$("form").submit();
				}
//				$("form").submit();
			});
		});
		function validateCheck(){
			const koreanRegExp = /^[가-힣]{2,5}$/;	// 정규식 $가 문자를 마무리한다는 의미
		     if( $("input").eq(0).val()=='' ){
		    	 alert('이름을 입력해주세요');
		    	 return false; 
		     }
		     if( koreanRegExp.test( $("input").eq(0).val() )== false ){
		    	 alert('이름을 2-5글자의 한글로 작성해주세요');
		    	 return false; 
		     }
		     console.log('validate check 함수 리턴 직전');
			return true;
		};
	</script>
	<title> 방명록 </title>
</head>
<body>
	<!-- jquery로 유효성 처리가 필요  -->
	<form action="saveMessage.jsp" name="frm" method="post">
		이름 : <input type="text" name="guestName" required /><br/><br/>
		암호 : <input type="password" name="password" required /><br/><br/>
		메세지 : <textarea name="message" rows="3" cols="30" required></textarea><br/><br/>
		<!-- <input type="submit" value="메세지 남기기"> -->
		<input type="button" value="메세지 남기기">
	</form>
</body>
</html>