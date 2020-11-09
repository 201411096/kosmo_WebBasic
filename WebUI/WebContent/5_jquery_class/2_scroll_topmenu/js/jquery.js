 $(document).ready(function(){
 	$('#navigation li').hover(function(){
 		$(this).animate({paddingLeft : '+=15px' }, 200); //기존의 padding에서 +15px
 	}, function(){
 		$(this).animate({paddingLeft : '-=15px' }, 200);
 	});
 	$(window).scroll(function(){
 		$('#navigation').css({'top': $(document).scrollTop()}); //scrollTop값에 위치를 고정
 	});

 });