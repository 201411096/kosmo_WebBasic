$(function(){
	$('.accordion').each(function(){ //each() : 각각의 요소에 적용
		var allDt = $(this).find('dt'); //3개씩 가져옴
		var allDd = $(this).find('dd');

		allDd.hide();
		allDt.css('cursor', 'pointer');

		allDt.on('click', function(){
			$(this).next().toggle(); // show <-> hide
		});
	});
});