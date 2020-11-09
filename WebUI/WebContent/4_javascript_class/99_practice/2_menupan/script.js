var menulist = new Array(); //계산할 메뉴들 (배열 생성)
var currentMenu = new Object(); //현재 메뉴정보 (객체 생성)

window.onload = function (){
    //menulist, currentmenu 변수 위치가 위로 옮겨가서 옮기기 전에 만든 기존의 함수들이 이상하게 보일 수 있음
    //var menulist = new Array(); //계산할 메뉴들 (배열 생성)
    //var currentMenu = new Object(); //현재 메뉴정보 (객체 생성)

    var tablemenu = document.getElementById('tablemenu');//테이블
    document.onmouseover = doOver;//마우스이벤트
    document.onmouseout = doOut;
    
    menulistInitialize(menulist, tablemenu);
    printMenulist(menulist);    //메뉴리스트를 콘솔로 확인
    getCountofCurrentMenu(currentMenu, menulist); //확인 버튼 이벤트 함수
    setCurrentMenu(tablemenu, menulist, currentMenu); //테이블 요소인 메뉴버튼 이벤트 함수
    orderButtonFunction(menulist); //최종주문버튼 이벤트 함수 

}

function menulistInitialize(menulist, tablemenu){ //table의 내용으로 menulist를 구성
    for(var r=0; r< tablemenu.rows.length-1; r++){  
        for(var c=0; c<tablemenu.rows[r].cells.length; c++){
            var infoAboutMenu = tablemenu.rows[r].cells[c].innerHTML.split('<br>');
            var tempMenu = new Object();
            tempMenu.name = infoAboutMenu[0];
            tempMenu.price = infoAboutMenu[1];
            tempMenu.count = 0;
            
            menulist.push(tempMenu); //메뉴를 담는 배열에 객체를 담음
        }
    }
}

function setCurrentMenu(tablemenu, menulist, currentMenu){ // 테이블 이벤트 함수(선택한 테이블의 행,열에 해당하는 메뉴 정보를 가져옴)
    var rindex; //행
    var cindex; //열
    for(var r=0; r< tablemenu.rows.length-1; r++){
        for(var c=0; c<tablemenu.rows[r].cells.length; c++){
             tablemenu.rows[r].cells[c].onclick = function(){
                rindex = this.parentElement.rowIndex;   
                cindex = this.cellIndex;
                var infoAboutMenu = tablemenu.rows[rindex].cells[cindex].innerHTML.split('<br>'); 
                currentMenu.name = infoAboutMenu[0];
                currentMenu.price = infoAboutMenu[1];
                for(var i =0; i<menulist.length; i++)
                {
                    if(menulist[i].name==currentMenu.name)
                        currentMenu.count=menulist[i].count;
                }
                setCountOfCurrentMenu(currentMenu); //현재 메뉴의 개수를 가져와서 세팅함
                checkCurrentMenu(currentMenu); //콘솔로 현재 메뉴를 확인해주는 함수
                setCurrentMenuImage(currentMenu); //이미지 세팅
            }
        }
    }
}

function getCountofCurrentMenu(currentMenu, menulist){ // 개수 옆에 있는 확인 버튼을 누를 경우
    document.getElementById('checkbtn').onclick=function(){
        var number = document.getElementById('currentMenuCount');
        for(var i=0; i<menulist.length; i++)
        {
            if(currentMenu.name==menulist[i].name)
            {
                menulist[i].count=number.value;
            }
        }
        number.value=0; //현재 메뉴의 개수를 가져온 이후 개수를 0으로 초기화해줌 
        /*currentMenu = new Object(); //현재 메뉴를 초기화해줌 -> 이거 주석으로 만들면 정상적으로 돌아가는데 이유를 몰라요 */
        setTotalPrice(menulist); //확인 버튼이 눌릴 경우 총합도 같이 계산이 됨

        makeViewOfMenuList(menulist); //메뉴리스트 화면 구성
        currentMenuInitialize(); //확인 버튼을 누른이후에 현재 메뉴 초기화   
    }
}

function currentMenuInitialize(){   //현재 메뉴 초기화 ( 확인 버튼을 누른 이후에 실행)
    currentMenu.name='';
    currentMenu.price=0;
    currentMenu.count=0;
    content1 = document.getElementById('content1');
    content1.style.backgroundImage='';
}

function setCountOfCurrentMenu(currentMenu){ // 현재 선택한 메뉴의 갯수를 표시해주는 함수
    var currentMenuCount = document.getElementById('currentMenuCount');
    currentMenuCount.value=currentMenu.count;
}

function setTotalPrice(menulist){   // 총합을 계산해줌
    var total = document.getElementById('total');
    var sum = 0;

    for(var i=0; i<menulist.length; i++)
    {
        sum+= parseInt(menulist[i].price) * parseInt(menulist[i].count); //string을 int로 변환해서 계산
    }

    total.value=sum;
}

function orderButtonFunction(menulist){
    document.getElementById('orderbtn').onclick = function(){   //최종확인 버튼이 눌렸을떄의 이벤트리스너
        printOrderMenulist(menulist);    //메뉴리스트 전부 확인 (***** 추가적인 기능 구현 필요 *****)

        for(var i=0; i<menulist.length; i++){   //메뉴리스트의 구매 갯수를 전부 0으로 초기화
            menulist[i].count=0;
        }
        document.getElementById('total').value=0; //가격총합 초기화
        initializeViewOfMenuList(); //메뉴리스트화면을 초기화해줌 (최종주문을 누를때 실행됨)
    };    
}

function setCurrentMenuImage(currentMenu){ //현재 메뉴에 해당하는 이미지를 세팅(테이블 이벤트 함수에서 같이 실행)
    content1 = document.getElementById('content1');
    var imagePath = currentMenu.name;
    console.log(imagePath);
    console.log(typeof imagePath);
    content1.style.backgroundImage="url('./imgs/"+imagePath+".png')";
}

function initializeViewOfMenuList(){    //메뉴리스트화면을 초기화해줌 (최종주문을 누를때 실행됨), 확인 버튼을 누를 경우에도 실행
    document.getElementById("content2").innerHTML=''; // id값이 content2인 곳의 내용을 모두 없앰
}

function makeViewOfMenuList(menulist){   //메뉴리스트화면을 구성해주는 함수
    initializeViewOfMenuList(); //메뉴리스트화면을 초기화한 후 처음부터 재구성
    var content2 = document.getElementById('content2');
    for(var i=0; i<menulist.length; i++){
        if(menulist[i].count!=0){   //개수가 1개 이상인 경우에만 리스트 구성에 포함
            var div = document.createElement("div");
            setDivStyle(div);   //새로만들어진 div의 style 세팅
            div.innerHTML =menulist[i].name + " " + menulist[i].count + "개 " + parseInt(menulist[i].price)*parseInt(menulist[i].count) +"원";
            div.onclick=removeDiv; //div 클릭 이벤트 함수 연결
            content2.appendChild(div);
        }
    }
}
function setDivStyle(div){  //메뉴리스트 화면에 나오는 div태그 style을 세팅
    div.style.backgroundColor = "#ddfbff";
    div.style.height="30px";
    div.style.fontSize="20px";
    /*div.style.border="solid 2px blue"*/
}

function removeDiv(){
    var confirmResult = confirm("해당메뉴를 취소하시겠습니까?");
    if(confirmResult==true){
        var temp = String(this.innerHTML).split(' ')[0];
        console.log("removeDiv확인 : " + temp);
        for(var i=0; i<menulist.length; i++){
            if(temp==menulist[i].name){
                menulist[i].count=0;
            }
        }
        makeViewOfMenuList(menulist); //취소한 메뉴를 제외하고 구매리스트를 재구성
        setTotalPrice(menulist); //취소한 메류를 제외한 총합가격을 다시 계산
    }else{
        console.log("confirm 결과 false");
    }
}

function checkCurrentMenu(currentMenu){ // 현재 선택한 메뉴의 갯수를 콘솔로 확인해주는 함수
    console.log("현재 메뉴 이름 : " + currentMenu.name + " 현재 메뉴 가격 : " + currentMenu.price + " 현재 메뉴 개수 : " + currentMenu.count);
}
    
function printMenulist(menulist){ // 모든 menulist를 순서대로 콘솔에 출력
    for(var i=0; i<menulist.length; i++){
        console.log("메뉴 이름 : " + menulist[i].name + " 메뉴 가격 : " + menulist[i].price + " 현재 개수 : " + menulist[i].count);
        //콘솔로 확인
    }
}

function printOrderMenulist(menulist){ // 모든 menulist를 순서대로 콘솔에 출력
    for(var i=0; i<menulist.length; i++){
        if(menulist[i].count!='0')
            console.log("메뉴 이름 : " + menulist[i].name + " 메뉴 가격 : " + menulist[i].price + " 현재 개수 : " + menulist[i].count);
        //콘솔로 확인
    }
}

function doOver(){	//마우스 오버
	   var plusEl = window.event.srcElement;
	   if (plusEl.className == "menu") {
	   	   makeFocus(plusEl)
	   	   }
}

function doOut(){ //마우스 아웃
	   var plusEl = window.event.srcElement;
	   if (plusEl.className == "menu") {
	       makeReturn(plusEl);
	   	   }
}

function makeFocus(el){
	   el.style.background="#42aaff"; 
}

function makeReturn(el){
	   el.style.background = "#ddfbff"; 
}

//function highlightRow(obj){ //..?
//	var table = document.getElementId("menu1");
//	var tr = table.getElementsByTagName("tr");
//	obj.style.backgroundColor="#fce6e0";
//}