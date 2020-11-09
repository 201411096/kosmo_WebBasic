$(function(){
	setDate();			// 오늘의 날짜를 맞추는 함수
	searchFieldFocus(); // 검색창 포커스 이벤트 함수
	tabMenuEvent();		// 탭메뉴 이벤트 함수
	set_bx_slider();	// bx_slider 플러그인 적용
	setLoginForm();		// 로그인 폼 이벤트 함수
	setTotalMenu();		// 전체 메뉴 이벤트 함수
	setPopupFunc();		// 팝업 창 함수(쿠키)
});
// 오늘의 날짜를 맞추는 함수
function setDate(){
	var date = new Date();	
	$('#date_wrap .year').html(date.getFullYear());
	$('#date_wrap .month').html(date.getMonth()+1);
	$('#date_wrap .date').html(date.getDate());
}
//검색창 포커스 이벤트 함수
function searchFieldFocus(){
	$('#keyword').on('focus', function(){
		$(this).css("background-position","0 -500px");
	});
	$('#keyword').on('focusout', function() {
		$(this).css("background-position","0 0");
	});
}
//탭메뉴 이벤트 함수
function tabMenuEvent(){
	var lastDt = $('#tabmenu dt:eq(0)');
	var lastDd = $('#tabmenu dt:eq(0)').next();
	$('#tabmenu dt').on('click', function(){
		lastDt.find('img').attr('src', $(this).find('img').attr('src').replace('over', 'out'));
		lastDd.hide();
		$(this).find('img').attr('src', $(this).find('img').attr('src').replace('out', 'over'));
		$(this).next().show();
		lastDt=$(this);
		lastDd=$(this).next();
	});
}
//bx_slider 플러그인 적용
function set_bx_slider(){
	$('#bestbook_zone').css({"vertical-align":"middle"});
	$('#best_bg ul').bxSlider({
  	  minSlides : 5,
	  maxSlides : 5,
	  slideMargin : 60,
	  slideWidth : '120px',
	  auto : true,
	  speed : 20
	});
}
//로그인 폼 이벤트 함수
function setLoginForm(){
	$('.login_wrap img').on('click', function(){
		$('#login_f').css({"top":"20px"});
	});
	$('.login_close_btn img').on('click', function(){
		$('#login_f').css({"top":"-500px"});
	});
}
//전체 메뉴 이벤트 함수
function setTotalMenu(){
	$('#total_btn img').on('click', function(){
		$('#total_menu').css({"display":"block"});
	});
	$('#total_close').on('click', function(){
		$('#total_menu').css({"display":"none"});
	})
}
//팝업 창 함수(쿠키)
//promotion이라는 키값을 가진 쿠키가 존재하지 않는다면 창을 염
function setPopupFunc(){
	if(! $.cookie('Promotion')){ 									
		window.open("promotion.html","","width=400, height=360");	
	}
}
