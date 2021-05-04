<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/jquery.timepicker.min.css">
<script type="text/javascript">
	$(function(){
		$('#minutesChangeBtn').click(function(){
			var $minutesTextarea = $('<textarea>', {cols:'80', rows:'5', id:'meetingMinutes'});
			var $minutesEnrollBtn = $('<a>', {class:'btn btn-block btn-primary', id:'minutesEnrollBtn', text:'저장하기', style:'width:503px;'});

			$(this).before($minutesTextarea);
			$(this).before($minutesEnrollBtn);
			$(this).remove();
		});

		$("#cancleBtn").click(function(){

			var residentsMeetingSeq = $('#residentsMeetingSeq').val();
			console.log("residentsMeetingSeq : " + residentsMeetingSeq);

			$.ajax({
				url : 'moveResidentMeetingMainDetail',
				type : 'post',
				data : {residentsMeetingSeq : residentsMeetingSeq},
				success : function(data){
					console.log('succ');
					$('#content').html(data);
				}
			});
		});

		$("#modifyBtn").click(function(){

			var residentsMeetingSeq = $('#residentsMeetingSeq').val();
			var meetingNm = $('#meetingNm').val();
			var mettingType = $('#mettingType').val();
			var meetingTopic = $('#meetingTopic').val();
			var meetingIntro = $('#meetingIntro').val();
			var meetingPlace = $('#meetingPlace').val();
			var meetingDt = $('#meetingDt').val();
			var meetingMinutes = $('#meetingMinutes').val();
			var meetingTm = $('#startTm').val() + "~" + $('#endTm').val()

			$.ajax({
				url : 'residentMeetingMainModify',
				method : 'post',
				data : {
					residentsMeetingSeq : residentsMeetingSeq,
					meetingNm : meetingNm,
					mettingType : mettingType,
					meetingTopic : meetingTopic,
					meetingIntro : meetingIntro,
					meetingPlace : meetingPlace,
					meetingDt : meetingDt,
					meetingTm : meetingTm,
					meetingMinutes : meetingMinutes
				},
				success : function(data){
					console.log("succ");

					$.ajax({
						url : 'moveResidentMeetingMainDetail',
						type : 'post',
						data : {residentsMeetingSeq : residentsMeetingSeq},
						success : function(data){
							console.log('succ');
							$('#content').html(data);
						}
					});
				}

			});
		});

	});


	$(function() {
		  navigator.getUserMedia = navigator.getUserMedia ||
		  	navigator.webkitGetUserMedia || navigator.mozGetUserMedia;

		  /**
		   * getUserMedia 성공
		   * @param stream
		   */
		  function success(stream) {
		    console.log('success', arguments);

		    // 비디오 테그에 stream 바인딩
		    document.querySelector('video').srcObject = stream;

		    // do something...
		  }

		  /**
		   * getUserMedia 실패
		   * @param error
		   */
		  function error(error) {
		    console.log('error', arguments);

		    alert('카메라와 마이크를 허용해주세요');
		  }

		  /**
		   * 이벤트 바인딩
		   */
		  $('button').click(function() {
		    navigator.getUserMedia({ audio: true, video: true }, success, error);
		  });
		});
</script>
</head>
<body>
	<div class="col-md-12 bg-white" style="height: 660px; ">
		<h3>입주민 대표회의</h3>
		<hr>
		<div class="col-md-12 p-l-20 p-r-20">
			<div class="col-md-6">
				<table class="table">
					<tr>
						<td><b>회의 명</b></td>
						<td><input type="text" id="meetingNm" name="meetingNm" class="form-control" value="${ responseResidentMeetingVO.meetingNm }"></td>
					</tr>
					<tr>
						<td><b>회의 주제</b></td>
						<td><input type="text" id="meetingTopic" name="meetingTopic" class="form-control" value="${ responseResidentMeetingVO.meetingTopic }"></td>
					</tr>
					<tr>
						<td><b>회의 소개</b></td>
						<td><input type="text" id="meetingIntro" name="meetingIntro" class="form-control" value="${ responseResidentMeetingVO.meetingIntro }"></td>
					</tr>
					<tr>
						<td><b>회의 장소</b></td>
						<td><input type="text" id="meetingPlace" name="meetingPlace" class="form-control" value="${ responseResidentMeetingVO.meetingPlace }"></td>
					</tr>
					<tr>
						<td><b>일시</b></td>
						<td>
					        <div class="input-group date" id="datepicker-disabled-past" data-date-format="yyyy-mm-dd" data-date-start-date="Date.default">
					            <input type="text" class="form-control" placeholder="일시를 입력해주세요." id="meetingDt" name="meetingDt" value="${fn: substring(responseResidentMeetingVO.meetingDt, 0, 10) }"/>
					            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					        </div>
					</tr>
					<tr>
						<td>시간</td>
						<td>
							<div class="col-md-5 p-0" >
								<input id="startTm" name="startTm" type="text" class="form-control" autocomplete="off" placeholder="시작 시간">
							</div>
							<div class="col-md-2 p-0" align="center">
								<label>~</label>
							</div>
							<div class="col-md-5 p-0">
								<input id="endTm" name="endTm" type="text" class="form-control" autocomplete="off" placeholder="종료 시간">
							</div>
						</td>
					</tr>
					<tr>
						<td><b>회의록</b></td>
						<td>
							<textarea id="meetingMinutes" name="meetingMinutes" class="form-control" cols="60" rows="5">${ responseResidentMeetingVO.meetingMinutes }</textarea>
						</td>
					</tr>
					<tr>
						<td><b>등록 일자</b></td>
						<td>${ responseResidentMeetingVO.meetingEnrollDt }</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="col-md-12 p-0">
			<div class="col-md-6 p-l-0">
				<a class="btn btn-block btn-primary" id="modifyBtn">수정</a>
			</div>
			<div class="col-md-6 p-r-0">
				<a class="btn btn-block btn-danger" id="cancleBtn">취소</a>
			</div>
			<input type="hidden" id="residentsMeetingSeq" name="residentsMeetingSeq" value="${responseResidentMeetingVO.residentsMeetingSeq}">
		</div>
	</div>

	<script src="${contextPath}/resources/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="${contextPath}/resources/plugins/ionRangeSlider/js/ion-rangeSlider/ion.rangeSlider.min.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<script src="${contextPath}/resources/plugins/masked-input/masked-input.min.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="${contextPath}/resources/plugins/password-indicator/js/password-indicator.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap-combobox/js/bootstrap-combobox.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap-tagsinput/bootstrap-tagsinput-typeahead.js"></script>
	<script src="${contextPath}/resources/plugins/jquery-tag-it/js/tag-it.min.js"></script>
    <script src="${contextPath}/resources/plugins/bootstrap-daterangepicker/moment.js"></script>
    <script src="${contextPath}/resources/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script src="${contextPath}/resources/plugins/select2/dist/js/select2.min.js"></script>
	<script src="${contextPath}/resources/js/form-plugins.demo.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.timepicker.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			FormPlugins.init();
			$('#startTm').timepicker({
				'timeFormat': 'H:i',
				'step': 30
			});
			$('#endTm').timepicker({
				'timeFormat': 'H:i',
				'step': 30
			});
		});
	</script>
</body>
</html>
