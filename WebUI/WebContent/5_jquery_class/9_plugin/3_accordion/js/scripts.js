$(function(){
	$('.accordion').accordion({
		event:'mouseover',
		active:2,
		animate:{duration:1000, easing:'easeOutElastic'} //속성이 여러개일 경우 중괄호..
	});
});