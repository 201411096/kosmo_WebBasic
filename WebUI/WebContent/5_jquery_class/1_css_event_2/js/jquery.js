/* 
 */
$(function(){
	$('.rollover img').hover(function(){
		$(this).attr('src', $(this).attr('src').replace('off', 'on'));
	}, function(){
		$(this).attr('src', $(this).attr('src').replace('on', 'off'));
	});
});