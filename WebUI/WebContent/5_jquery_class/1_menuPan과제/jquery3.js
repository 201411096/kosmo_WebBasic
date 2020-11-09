var menuArray;

$(function(){
	menuArray = menuListInitialize();

	$(".menus select").on('change', function(){ //select 이벤트		
		var selectedMenu = findMenuInMenuList(menuArray, $(this).parent().children(":nth-child(3)").attr('value')); //선택 메뉴
		var count = $(this).parent().children(":nth-child(6)").children("option:selected").val(); //선택 개수
		selectedMenu.count=count;

		$('#total').val(coutingTotalPrice(menuArray)); //총합 계산

		checkingMenuList(menuArray); // 메뉴들 확인용
	});

	$("#btn").on('click', function(){ // 주문버튼 이벤트
		menuArray = menuListInitialize();

		$('#total').val(coutingTotalPrice(menuArray)); //총합 계산(메뉴리스트가 초기화되어 있는 상태라 자동으로 초기화됨)
		initializeCountingSelect();
	});

});

function menuListInitialize(){ // 메뉴판의 메뉴들을 array로 담음 
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

function findMenuInMenuList(menuArray, menuName){ //입력받은 string값이랑 같은 메뉴객체를 반환
	for(var i=0; i<menuArray.length; i++){
		if(menuArray[i].name===menuName){
			return menuArray[i];
		}
	}
}

function coutingTotalPrice(menuArray){ //총합 계산
	var totalPrice=0;
	for(var i=0; i<menuArray.length; i++){
		totalPrice+=menuArray[i].price*menuArray[i].count;
	}
	return totalPrice;
}

function initializeCountingSelect(){//select 옵션 초기화
	for(var i=0; i<$('.menus').children().length; i++){ //메뉴의 개수만큼 반복
		var colnumber = $('.menus:eq(1)').children().length;	//열의 개수
		var rownumber = parseInt(i/colnumber); // 행에 있는 메뉴만큼 나눔
		//$('.menus:eq('+(rownumber)+')').children(":nth-child("+(i+1-rownumber*colnumber)+")").children(":nth-child(6)").children("option:eq(0)").attr('selected', 'selected'); //이렇게 하면 처음 한번만 정상작동함
		$('.menus:eq('+(rownumber)+')').children(":nth-child("+(i+1-rownumber*colnumber)+")").children(":nth-child(6)").children("option").eq(0).prop('selected', true);
	}
}

function checkingMenuList(menuArray){ //menulist확인용 함수
	for(var i=0; i<menuArray.length; i++){
		console.log(menuArray[i].name +"/" + menuArray[i].price + "/" + menuArray[i].count);
	}
}