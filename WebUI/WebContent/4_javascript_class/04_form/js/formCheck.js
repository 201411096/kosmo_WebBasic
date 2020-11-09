window.onload = function(){

		var frm = document.getElementById('frm');
		//var frm = document.querySelector('#frm'); 		//querySelector 사용법
		var inputs = document.querySelectorAll("input");	//input 타입에 해당하는 모든 값을 가져옴 // 태그라서 아무것도 안 쓰고 문자열을 그대로 사용함
															//class 였다면 .~ id엿다면 #~
		frm.onsubmit = function(e){
			//alert('ok');
			e.preventDefault(); //자기 자신의 이벤트를 막음(기존 기능 막기)
			e.stopPropagation(); //버블링을 막음
			// ㄴ 위에 두개를 묶어서 같이 사용

			//추가된 사항을 검사
			if(document.getElementById("agree").checked==true)
			{
				frm.submit();	//폼의 기본 기능인(전송 기능을 가진 함수 실행)
			}else{
				alert("약관에 동의해주세요");
			}
		}															
}