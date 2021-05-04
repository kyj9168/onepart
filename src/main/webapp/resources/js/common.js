
$(function(){

	/* ==========================Resident========================== */
	/* ================Survey================ */

	/* 상세보기 */
	$(document).on('click','.surveyTable > tbody > tr', function(){
		var surveySeq = $(this).children().eq(0).text();

		$.ajax({
			url:'surveyDetail',
			type:'post',
			data:{surveySeq:surveySeq},
			success:function(result){
			console.log('succ');
			$("#content").html(result);
			},
			error:function(error){
				console.log(error);
			}
		});
	});




















	/* ==========================Manager========================== */
	/* ================Survey================ */
	// 라디오 옵션 추가
	$(document).on('click', "button[name='addRadioOption']", function(){
		/*
		<br clear="all"/>
		<div class="col-md-1">
		<h4><i class="fa fa-dot-circle-o"></i></h4>
		</div>
		<div class="col-md-11">
			<input type="text" class="form-control" placeholder="옵션을 입력해주세요." name="radioOption">
		</div>
		 */

		var $divClassColMd1 = $('<div>', {class:'col-md-1'});
		var $h4 = $('<h4>');
		var $iCircle = $('<i>', {class:'fa fa-dot-circle-o'});
		var $divClassColMd11 = $('<div>', {class:'col-md-11'});
		var $inputCheckboxOption = $('<input>', {type:'text', class:'form-control', placeholder:'옵션을 입력해주세요.', name:'option'});
		var $brClearAll = $('<br>', {clear:'all'});

		$h4.append($iCircle);
		$divClassColMd1.append($h4);

		$divClassColMd11.append($inputCheckboxOption);

		$(this).parents('.col-md-11').prev().before($brClearAll);
		$(this).parents('.col-md-11').prev().before($divClassColMd1);
		$(this).parents('.col-md-11').prev().before($divClassColMd11);
		$(this).parents('.col-md-11').prev().before($brClearAll);

	});

	// 체크박스 옵션 추가
	$(document).on('click', "button[name='addCheckOption']", function(){
		/*
		<br clear="all"/>
		<div class="col-md-1">
		<h4><i class="fa fa-dot-circle-o"></i></h4>
		</div>
		<div class="col-md-11">
			<input type="text" class="form-control" placeholder="옵션을 입력해주세요." name="radioOption">
		</div>
		 */

		var $divClassColMd1 = $('<div>', {class:'col-md-1'});
		var $h4 = $('<h4>');
		var $iCircle = $('<i>', {class:'fa fa-check-square-o'});
		var $divClassColMd11 = $('<div>', {class:'col-md-11'});
		var $inputCheckboxOption = $('<input>', {type:'text', class:'form-control', placeholder:'옵션을 입력해주세요.', name:'option'});
		var $brClearAll = $('<br>', {clear:'all'});

		$h4.append($iCircle);
		$divClassColMd1.append($h4);

		$divClassColMd11.append($inputCheckboxOption);

		$(this).parents('.col-md-11').prev().before($brClearAll);
		$(this).parents('.col-md-11').prev().before($divClassColMd1);
		$(this).parents('.col-md-11').prev().before($divClassColMd11);
		$(this).parents('.col-md-11').prev().before($brClearAll);
	});

});