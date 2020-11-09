$(function(){
	var menuArray = menuListInitialize();
	$(".menus select").on('change', function(){
		//console.log($(this).parent().attr('id')); //이벤트가 발생한 요소의 부모를 찾아감
		
		//요소의 색 확인
		//$(this).parent().children(":nth-child(3)").css('background-color', 'yellow'); // 이벤트가 발생한 부분의 이름의 배경색을 변경(확인용)
		//$(this).parent().children("span:nth-child(1)").css('background-color', 'yellow');//왜 안되는지 모름
		
		//요소의 메뉴 확인
		//console.log($(this).parent().children(":nth-child(3)").attr('value')); //이벤트가 발생한 메뉴의 이름을 받아옴(확인용)
		//console.log($(this).parent().children(":nth-child(3)").val());//왜 안되는지 모름
		
		var menu = new Object();

	});
});

function menuListInitialize(){
	var menuArray = new Array();
	for(var i=0; i<$('.menus').children().length; i++){ //메뉴의 개수만큼 반복
		var menu = new Object();
//		var temp = parseInt(i/3)+parseInt(1);
		var temp = parseInt(i/3); // 행에 있는 메뉴만큼 나눔
		menu.count=0;
//		console.log("아이들길이"+$('.menus:eq(1)').children().length);
		console.log(temp);
		console.log($('.menus:eq(2)').children(2).children(":nth-child(3)").attr('value'));
		menu.name = $('.menus:eq('+(temp)+')').children(":nth-child("+(i+1-temp*3)+")").children(":nth-child(3)").attr('value');
		menu.price = $('.menus:eq('+(temp)+')').children(":nth-child("+(i+1-temp*3)+")").children(":nth-child(4)").attr('value');
//		menu.name = $('.menus').children(":nth-child("+(i+1)+")").children(":nth-child(3)").attr('value');
//		menu.price = $('.menus').children(":nth-child("+(i+1)+")").children(":nth-child(4)").attr('value');
		menuArray.push(menu);
		console.log(i+ "번쨰 메뉴 확인용 "+ menu.name +"/"+ menu.price +"/"+ menu.count);
	}
	
	return menuArray;
}