
// window.onload = function(){	
//document.addEventListener('DOMContentLoaded', function() {
  var list = document.getElementById('list');
  var pic = document.getElementById('pic');
  var del = document.getElementById('del');

  // 리스트에서 선택(클릭했을 때)
  list.onclick=function(e){	//list 버튼 이벤트 시작
  	var isbn = e.target.getAttribute('data-isbn');	//data-isbn의 속성값 가져오기
  	/*var isbn = this.getAttribute('data-isbn');*/ // 아래처럼 작성하면 이미지가 제대로 나오지 않음
  	/*var isbn = this.target.getAttribute('data-isbn');*/ // 왼쪽처럼 잓어하면 나오지 않음
  	
  	var img = document.createElement('img');
  	//<img src = "images/xxx.jpg" width="100" height="80"/>
  	img.src = 'images/'+isbn+'.jpg';
  	img.width=300;
  	img.height=240;

  	if(pic.getElementsByTagName('img').length > 0){ //pic태그의 img태그가 0개보다 많다면.
  		pic.replaceChild(img, pic.lastChild);
  	}else{
  		pic.appendChild(img);
  		del.disabled=false;
  	}
/*
  	if(!pic.hasChildNodes()){ // 자식노드가 있는지 확인
  		pic.appendChild(img);
  	}
  	else{
  		pic.replaceChild(img, pic.lastChild);
  	}
 */
  }  //list 버튼 이벤트 끝

  // 삭제 버튼 누르면 pic 아래 자식(img 태그)를 지운다
  del.onclick=function(){
  	pic.removeChild(pic.lastChild);
  }

//};
//});