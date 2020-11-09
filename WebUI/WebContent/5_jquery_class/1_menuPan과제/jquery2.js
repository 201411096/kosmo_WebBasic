$(function(){
	var menuArray = menuListInitialize();
	$(".menus select").on('change', function(){		
		var menu = new Object();

	});
});

function menuListInitialize(){
	var menuArray = new Array();
	
	for(var i=0; i<$('.menus').children().length; i++){ //메뉴의 개수만큼 반복
		var menu = new Object();	//메뉴 객체 생성
		var colnumber = $('.menus:eq(1)').children().length;	//열의 개수
		var rownumber = parseInt(i/colnumber); // 행에 있는 메뉴만큼 나눔

		menu.count=0;
		menu.name = $('.menus:eq('+(rownumber)+')').children(":nth-child("+(i+1-rownumber*colnumber)+")").children(":nth-child(3)").attr('value');
		menu.price = $('.menus:eq('+(rownumber)+')').children(":nth-child("+(i+1-rownumber*colnumber)+")").children(":nth-child(4)").attr('value');

		console.log(i+ "번쨰 메뉴 확인용 "+ menu.name +"/"+ menu.price +"/"+ menu.count);
		menuArray.push(menu);
	}
	
	return menuArray;
}