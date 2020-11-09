$(function(){
	$('#signup form').validate({
		rules:{
			name:{required:true}, //이름을 필수 입력사항으로 만듬
			email:{required:true, //이메일을 필수 입력사항으로 만듬
					email:true 	  // 이메일을 확인함
			} ,
			website:{url:true},	  // 웹사이트는 필수지만 url인지 확인은 함 (http까지 작성해야됨)
			password:{required:true,
						 minlength:6},
			passconf:{equalTo : '#password'} //#password와 같은지 확인
		},
		success:function(label){
			label.addClass('valid');
			label.text('성공'); //text가 나오지는 않는데 작성하지 않으면 정상적으로 작동이 되지 않음
		}
	});

/*	$('.check-all').on('click', function(){
			$('.agree').prop('checked', 'checked');
	});	*/

	$('.check-all').on('click', function(){
//		$('.agree').prop('checked', this.checked);				//js
		$('.agree').prop('checked', $(this).is(':checked'));	//jquery
	});
	$('.agree').on('click', function(){
		if($('.agree').is(':not(:checked)')){ // 체크되어있지 않다면
			$('.check-all').prop('checked', false);
		}else if($('.agree').is(':checked')){
			$('.check-all').prop('checked', true);
		}
	});
	
/*
		attr	: element가 가지는 속성값이나 정보를 조회 (style, src, rowspan 등)
		prop	: 실제적인 상태(활성화, 체크, 선택여부 등)
		.is()	: jquery에서 true인지 false인지 체크할 때 많이 사용
*/	
});