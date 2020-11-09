window.onload=function(){
	var td = document.getElementsByClassName("item");

	for(var i=0; i<td.length; i++){
		td[i].onclick=function(){
			/*alert(this.getAttribute('price'));*/
			var price = this.getAttribute('price'); // this -> 이벤트가 발생한 요소(객체) -> 여기서는 이벤트가 발생한 셀
			alert(price);
		}
	}
}