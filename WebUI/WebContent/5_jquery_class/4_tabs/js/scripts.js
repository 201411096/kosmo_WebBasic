$(function(){
	var topDiv = $('.tabSet');
	var anchors = topDiv.find('.tabs a');
	var panelDivs = topDiv.find('.panels div.panel');

	anchors.show();
	panelDivs.hide();

	var lastAnchors = anchors.filter('.on'); //find()와 filter()차이 -> find는 전체 혹은 하위레벨에서 찾음 / filter는 자기 자신의 레벨에서 검색
/*
부모요소.find(자식요소) 
	ㄴ 자식요소를 찾을때 사용
ex> $('.chk_obj').find('#chk_a1').val();

요소.filter(조건) 
	ㄴ 선택된 요소중에서 특정 성질의 요소를 추릴때 사용
ex> $('.chk_obj').filter(':checked').length;	
*/

	var lastPanel = $(lastAnchors.attr('href'));
	lastPanel.show();
/*
	anchors.on('click', function(){
		//눌려진 요소에 클래스 on 지정
		lastAnchors.removeClass('on');
		lastPanel.hide();
		$(this).addClass('on');
		lastAnchors = $(this);
		lastPanel = $(lastAnchors.attr('href'));
		lastPanel.show();
	});
*/

	anchors.on('click', function(){
		/*
			1) 현재 이벤트가 발생한 a 태그와 그 href 패널을 가져와서 변수에 지정
			2) 기존 a태그에서 on클래스 제거
			3) 현재 a태그에 on 클래스 추가
			4) 기존패널을 화면에서 감추기
			5) 현재 패널 보이기
			6) 현재 a태그와 현재 패널을 lastAnchors, lastPanel 지정하기
		*/
		
		// 1.현재 이벤트가 발생한 a 태그와 그 href 패널을 가져와서 변수에 지정
		var currentAnchor = $(this);
		var currentPanel = $(currentAnchor.attr('href'));
		// 2.기존 a태그에서 on클래스 제거
		lastAnchors.removeClass('on');
		// 3.현재 a태그에 on 클래스 추가
		currentAnchor.addClass('on');
		// 4.기존패널을 화면에서 감추기
		lastPanel.hide();
		// 5.현재 패널 보이기
		currentPanel.show();
		// 6.현재 a태그와 현재 패널을 lastAnchors, lastPanel 지정하기
		lastAnchors=currentAnchor;
		lastPanel=currentPanel;
	});
	
});