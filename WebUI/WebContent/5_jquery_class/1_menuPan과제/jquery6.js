var menuArray;
$(function(){
	menuArray = menuListInitialize();
	attachButtonEventListener(menuArray);
	$(".menus select").on('change', function(){ //select 이벤트		
		var selectedMenu = findMenuInMenuList(menuArray, $(this).parent().children(":nth-child(3)").attr('value')); //선택 메뉴
		var count = $(this).parent().children(":nth-child(6)").children("option:selected").val(); //선택 개수
		selectedMenu.count=count;
		$('#total').val(coutingTotalPrice(menuArray)); //총합 계산
		makeTable(menuArray);
	});
	$("#btn").on('click', function(){ // 주문버튼 이벤트
		menuArray = menuListInitialize();
		makeTable(menuArray); //테이블 재구성
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
function initializeCountingSelect(){ //select 옵션 초기화
	for(var i=0; i<$('.menus').children().length; i++){ //메뉴의 개수만큼 반복
		var colnumber = $('.menus:eq(1)').children().length;	//열의 개수
		var rownumber = parseInt(i/colnumber); // 행에 있는 메뉴만큼 나눔
		$('.menus:eq('+(rownumber)+')').children(":nth-child("+(i+1-rownumber*colnumber)+")").children(":nth-child(6)").children("option").eq(0).prop('selected', true);
	}
}
function makeTable(menuArray){ // 테이블 구성
	initializeTable(menuArray);
	for(var i=0; i<menuArray.length; i++){
		if(menuArray[i].count>0){
			$('#listTable').append('<tr id=tr_'+i +' > <td>'+menuArray[i].name+'</td> <td>'+menuArray[i].count+'</td> <td><button id=btn_'+ i +' >삭제</button></td> </tr>');
		}
	}
}
function attachButtonEventListener(menuArray){
	for(var i=0; i<menuArray.length; i++){
		var buttonId = '#btn_'+i;
		$('#listTable').on('click', buttonId, deleteButtonListener); // ********** 이벤트 리스너 붙일 때 이름만 넣어야됨 **********
	}
}
function deleteButtonListener(){
	var str = $(this).attr('id');
	var sequence = str.split('_').reverse()[0];
	var trid = '#tr_'+sequence;
	$(trid).remove();
	menuArray[sequence].count=0; //해당 메뉴 개수 초기화
	for(var i=0; i<$('.menus').children().length; i++){ //메뉴의 개수만큼 반복
		var colnumber = $('.menus:eq(1)').children().length;	//열의 개수
		var rownumber = parseInt(i/colnumber); // 행에 있는 메뉴만큼 나눔
		if(i==sequence)
			$('.menus:eq('+(rownumber)+')').children(":nth-child("+(i+1-rownumber*colnumber)+")").children(":nth-child(6)").children("option").eq(0).prop('selected', true);
	}
	$('#total').val(coutingTotalPrice(menuArray));
}
function initializeTable(menuArray){ // 테이블 초기화
	while($('#listTable tbody').children().length>3){ //테이블이 원래 모양을 찾아갈떄까지 행을 지움
		$('#listTable tr:last').remove();	
	}		
}