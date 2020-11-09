$(function(){
	$('.fontSize button').on('click', function(){
		if( $(this).text().trim()==='+') //공백 제거가 안되서 비교가 안됬었음
		{
			$('#txt').css('font-size', (parseInt($('#txt').css('font-size'))+1).toString()+"px");
/*			var size = parseInt($('#txt').css('font-size'));
			$('#txt').css('font-size', (size+1).toString()+"px");*/
		}
		else if( $(this).text().trim()==='-')
		{
			$('#txt').css('font-size', (parseInt($('#txt').css('font-size'))-1).toString()+"px");
/*			var size = parseInt($('#txt').css('font-size'));
			$('#txt').css('font-size', (size-1).toString()+"px");*/
		}
	});
	$('#fontstyle').on('change', function(){
		console.log($('#fontstyle').val());
		$('#txt').css('font-family', $('#fontstyle').val()); //font-family?????????????????????????
	});
});
