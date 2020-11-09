// 함수의 인자로 들어오는 함수처리
function arrayProcess( data, f ) {
	for( key=0; key < data.length; key++ ){
	//for(var key in data ){
		console.log("인자로 받은 f의 type : " + typeof f)
		f( key, data[key].value );	// ***** 인자로 받은 함수(type function)를 실행함 ***** //
	}
}

// 각각의 데이터를 더하는 함수
var sumResult = 0;
function sum( key, data ){	
	sumResult += parseInt(data);
}

// 각각의 데이터의 곱을 구하는 함수
var squareResult = new Array();
function square( key, data ){			
	squareResult.push( data * data );
}
