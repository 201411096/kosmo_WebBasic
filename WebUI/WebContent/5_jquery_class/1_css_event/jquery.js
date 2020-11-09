/*
 * 
 */

$(function(){ 
//	$('#celebs tbody tr:odd').css( {'background':'lightpink', 'color':'blue'} );
	$('#celebs tbody tr:odd').addClass('table_striping');
	$('#celebs tbody tr').hover(function(){
		$(this).addClass('td_mouseover');
	},function(){
		$(this).removeClass('td_mouseover');
	});
	
	$('#hideButton').on('click', function(){
		$('#intro').hide();
//		$('#intro').slideUp(1000); //위로 올라감
//		$('#intro').fadeOut(1000); //서서히 사라짐
	});
	$('#showButton').on('click', function(){
		$('#intro').show();
	});
	$('#toggleButton').on('click', function(){
		$('#intro').toggle(); //누르면 이미지가 사라지고 다시 누르면 이미지가 다시 나타남
	});
});