var frm;

window.onload=function(){
	frm = document.getElementById('frm');
	var adultNumber = document.getElementById("adultNumber");
	var childNumber = document.getElementById("childNumber");
	var babyNumber = document.getElementById("babyNumber");

	adultNumber.onchange = totalPriceListener;
	childNumber.onchange = totalPriceListener;
	babyNumber.onchange = totalPriceListener;

	frm.onsubmit=function(e){
		e.preventDefault(); //자기 자신의 이벤트를 막음(기존 기능 막기)
		e.stopPropagation(); //버블링 이벤트를 막음

		if(checkSubmit()==true){
			frm.submit();
		}
	}
}

function checkSubmit(){
	if(checkNumberBlank()){	// 인원수 3칸 중 한칸 이상 작성을 해뒀는지
		return false;
	}	
	if(checkAdultNumber() || checkChildNumber() || checkBabyNumber()){ //셋 중에 하나라도 0이상이 아니라면..false 반환
		return false;
	}
	if(isCheckBoxChecked()){ //약관을 체크했는지 확인
		return false;
	}
	if(genderRadioBoxChecked()){ //성별 라디오버트인 체크되있는지 확인
		return false;
	}
	if(isKoreanNameBlank()){ //한글 이름란이 비어있는지 확인
		return false;
	}
	if(koreanNameCheck()){ //한글 이름란에 한글로 작성했는지 확인
		return false;
	}
	if(isEnglishLastNameBlank()){ //영문 성이 비어있는지 확인
		return false;
	}
	if(englishLastNameCheck()){ //영문 성에 영어로 작성했는지 확인
		return false;
	}
	if(isEnglishFirstNameBlank()){ //영문 이름란이 비어있는지 확인
		return false;
	}
	if(englishFirstNameCheck()){ //영문 이름란에 영어로 작성했는지 확인
		return false;
	}
	if(isPersonIdBlank()){ //주민번호 란이 비어있는지 확인
		return false;
	}
	if(personIdCheck()){ //주민번호란에 숫자로 작성했는지 확인
		return false;
	}
	if(personId1LengthCheck()){ //주민번호 앞자리에 6자리를 전부 입력했는지
		return false;
	}
	if(personId2LengthCheck()){ //주민번호 뒷자리에 7자리를 전부 입력했는지
		return false;
	}
	if(isTelBlank()){ //전화번호 란이 비어있는지 확인
		return false;
	}
	if(telCheck()){ //전화번호란에 숫자로 작성했는지 확인
		return false;
	}
	if(isEmailBlank()){ //이메일 란이 비어있는지 확인
		return false;
	}
	if(emailCheck()){ //이메일란에 형식을 지켜서 작성했는지 확인
		return false;
	}

	return true;
}

function isCheckBoxChecked(){ //약관을 전부 동의했는지 ->전부 동의 하지 않았으면 true반환
	var checkbox = document.getElementById("checkbox");
	var checkbox2 = document.getElementById("checkbox2");

	if(checkbox.checked==false || checkbox2.checked==false){
		alert("약관에 전부 동의하셔야 합니다.");
		return true;
	}else{
		return false;
	}
}

function blankCheck(x){ //blank면 true반환
	if(x==null || x=='' || x==undefined)
		return true;
	else
		return false;
}

function checkNumberBlank(){	// 셋 다 비어있는 경우 true반환
	var adultNumber = document.getElementById("adultNumber");
	var childNumber = document.getElementById("childNumber");
	var babyNumber = document.getElementById("babyNumber");
	if(blankCheck(adultNumber.value) && blankCheck(childNumber.value) && blankCheck(babyNumber.value))
	{
		alert("여행자 인원(성인, 아동, 유아)중 하나는 필수 입력사항입니다.");
		return true;
	}else{
		return false;
	}
}

function checkAdultNumber(){ // 0 이상의 정수인지 확인하는 함수 // 0이상의 정수가 아니라면 true 반환
	var adultNumber = document.getElementById("adultNumber");
	if(!Number.isInteger(Number(adultNumber.value))){
		alert("여행자 인원(성인)을 정수로 입력해주세요");
		return true;
	}else if(Number(adultNumber.value)<0){
		alert("여행자 인원(성인)을 0이상의 수를 입력해주세요");
		return true;
	}
	else{
		return false;
	}
}

function checkChildNumber(){ // 0 이상의 정수인지 확인하는 함수 // 0이상의 정수가 아니라면 true 반환
	var childNumber = document.getElementById("childNumber");
	if(!Number.isInteger(Number(childNumber.value))){
		alert("여행자 인원(아동)을 정수로 입력해주세요");
		return true;
	}else if(Number(childNumber.value)<0){
		alert("여행자 인원(아동) 0이상의 수를 입력해주세요");
		return true;
	}
	else{
		return false;
	}
}

function checkBabyNumber(){ // 0 이상의 정수인지 확인하는 함수 // 0이상의 정수가 아니라면 true 반환
	var babyNumber = document.getElementById("babyNumber");
	if(!Number.isInteger(Number(babyNumber.value))){
		alert("여행자 인원(유아)을 정수로 입력해주세요");
		return true;
	}else if(Number(babyNumber.value)<0){
		alert("여행자 인원(유아) 0이상의 수를 입력해주세요");
		return true;
	}
	else{
		return false;
	}
}

function totalPriceListener(){ // 가격을 계산해주는 함수
	var totalPrice = document.getElementById("totalPrice");
	var adultNumber = document.getElementById("adultNumber");
	var childNumber = document.getElementById("childNumber");
	var babyNumber = document.getElementById("babyNumber");

	totalPrice.value = String(Number(adultNumber.value)*39000+Number(childNumber.value)*29000+Number(babyNumber.value)*19000) + "원";
}

function genderRadioBoxChecked(){
	var radio = document.getElementById("radio");
	var radio2 = document.getElementById("radio2");

	if(radio.checked==false && radio2.checked==false){ //성별이 둘다 체크되지 않았을 경우
		alert("성별을 선택해주세요.");
		return true;
	}else{
		return false;
	}
}

function isKoreanNameBlank(){
	var koreanName = document.getElementById("koreanName");
	if(blankCheck(koreanName.value)){
		alert("한글 이름을 작성해주세요.");
		return true;
	}else{
		return false;
	}
}

function koreanNameCheck(){ //한글이름란에 한글로 작성되있지 않다면 true 반환
	var koreanName = document.getElementById("koreanName");
	const koreanRegExp = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	if(!koreanRegExp.test(koreanName.value)){ //test() 정규식 체크
		alert("한글 이름엔 한글로만 작성해주세요");
		return true;
	}else{
		return false;
	}
}

function isEnglishLastNameBlank(){
	var englishLastName = document.getElementById("englishLastName");
	if(blankCheck(englishLastName.value)){
		alert("영문 성을 작성해주세요.");
		return true;
	}else{
		return false;
	}
}

function englishLastNameCheck(){ // 영문 성이름 란에 영어로 작성되지 않았다면 true 반환
	var englishLastName = document.getElementById("englishLastName");
	const englishRegExp = /[a-zA-Z]/;
	if(!englishRegExp.test(englishLastName.value)){ //test() 정규식 체크
		alert("영문 성엔 영어로만 작성해주세요");
		return true;
	}else{
		return false;
	}
}

function isEnglishFirstNameBlank(){
	var englishFirstName = document.getElementById("englishFirstName");
	if(blankCheck(englishFirstName.value)){
		alert("영문 이름을 작성해주세요.");
		return true;
	}else{
		return false;
	}
}

function englishFirstNameCheck(){ // 영문 이름 란에 영어로 작성되지 않았다면 true 반환
	var englishFirstName = document.getElementById("englishFirstName");
	const englishRegExp = /[a-zA-Z]/;
	if(!englishRegExp.test(englishFirstName.value)){ //test() 정규식 체크
		alert("영문 이름엔 영어로만 작성해주세요");
		return true;
	}else{
		return false;
	}
}

function isPersonIdBlank(){
	var personId1 = document.getElementById("personId1");
	var personId2 = document.getElementById("personId2");
	if(blankCheck(personId1.value) || blankCheck(personId2.value) ){
		alert("주민번호를 전부 작성해주세요.");
		return true;
	}else{
		return false;
	}
}

function personIdCheck(){ // 영문 이름 란에 영어로 작성되지 않았다면 true 반환
	var personId1 = document.getElementById("personId1");
	var personId2 = document.getElementById("personId2");
	const numberRegExp = /[0-9]/;
	if(!numberRegExp.test(personId1.value) || !numberRegExp.test(personId2.value) ){ //test() 정규식 체크
		alert("주민번호란에는 숫자로만 작성해주세요");
		return true;
	}else{
		return false;
	}
}

function personId1LengthCheck(){
	var personId1 = document.getElementById("personId1");
	if(personId1.value.length!=6){
		alert("주민번호 앞자리 6자리를 전부 입력해주세요");
		return true;
	}else{
		return false;
	}
}

function personId2LengthCheck(){
	var personId2 = document.getElementById("personId2");
	if(personId2.value.length!=7){
		alert("주민번호 뒷자리 7자리를 전부 입력해주세요");
		return true;
	}else{
		return false;
	}
}

function isTelBlank(){
	var tel1 = document.getElementById("tel1");
	var tel2 = document.getElementById("tel2");
	var tel3 = document.getElementById("tel3");
	if(blankCheck(tel1.value) || blankCheck(tel2.value) || blankCheck(tel3.value) )
	{
		alert("전화번호를 전부 작성해주세요.");
		return true;
	}else{
		return false;
	}
}

function telCheck(){ // 전화번호 란에 숫자로 작성되지 않았다면 true 반환
	var tel1 = document.getElementById("tel1");
	var tel2 = document.getElementById("tel2");
	var tel3 = document.getElementById("tel3");
	const numberRegExp = /[0-9]/;
	if(!numberRegExp.test(tel1.value) || !numberRegExp.test(tel2.value) || !numberRegExp.test(tel3.value) ){ //test() 정규식 체크
		alert("전화번호란에는 숫자로만 작성해주세요");
		return true;
	}else{
		return false;
	}
}

function isEmailBlank(){
	var email = document.getElementById("email");
	if(blankCheck(email.value)){
		alert("이메일을 작성해주세요.");
		return true;
	}else{
		return false;
	}
}
function emailCheck(){
	var email = document.getElementById("email");
	const emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!emailRegExp.test(email.value)){
		alert("이메일 형식을 지켜서 작성해주세요");
		return true;
	}else{
		return false;
	}
}