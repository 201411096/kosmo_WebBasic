$(function(){
	var actorSummaryList = $('#bio div');
	var actorNameList = $('#bio h3');
	actorNameList.css({'cursor':'pointer'});
	actorSummaryList.hide();
	var lastActorName = actorNameList.first();
	var lastActorSummary = actorSummaryList.first().show();
/*	
	actorNameList.on('click', function(){
		lastActorSummary.hide();
		$(this).next().show();
		lastActorName=$(this);
		lastActorSummary=$(this).next();
	});
*/	
	actorNameList.on('click', function(){
		lastActorSummary.hide();
//		$(this).next().animate({'height':'toggle'}, 1000); //기존의 jquery animate
		$(this).next().animate({'height':'toggle'}, 1000, 'easeOutBounce'); // plugin(jquery.easing.1.3.js)을 이용한 animate
		lastActorName=$(this);
		lastActorSummary=$(this).next();
	});

});