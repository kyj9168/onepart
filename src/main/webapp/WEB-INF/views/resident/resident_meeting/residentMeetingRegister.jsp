<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/jquery.timepicker.min.css">
<script type="text/javascript">
	$(function(){

		$("#enrollBtn").click(function(){
			enrollBtnClick();
		});

		$("#cancleBtn").click(function(){
			$.ajax({
				url : 'menuMeetingInfo',
				method : 'post',
				success : function(data){
					$("#content").html(data);
				}
			});
		});
	});

	/* 등록 버튼 클릭 */
	function enrollBtnClick(){

		var meetingNm = $('#meetingNm').val();
		var mettingType = $('#mettingType').val();
		var meetingTopic = $('#meetingTopic').val();
		var meetingIntro = $('#meetingIntro').val();
		var meetingPlace = $('#meetingPlace').val();
		var meetingDt = $('#meetingDt').val();
		var meetingTm = $('#startTm').val() + "~" + $('#endTm').val()

		$.ajax({
			url : 'residentMeetingRegister',
			method : 'post',
			data : {
				meetingNm : meetingNm,
				mettingType : mettingType,
				meetingTopic : meetingTopic,
				meetingIntro : meetingIntro,
				meetingPlace : meetingPlace,
				meetingDt : meetingDt,
				meetingTm : meetingTm
			},
			success : function(data){
				console.log("succ");
				$("#content").html(data);
			}

		});

	}
</script>

</head>
<body>

	<div class="col-md-12 bg-white" style="height: 680px; ">
		<h3>입주민 대표회의</h3>
		<hr>
		<div class="col-md-12 p-l-20 p-r-20">
			<h3>회의 등록</h3>
			<hr>

			<div class="col-md-12 m-b-15 p-0">
				<div class="col-md-6 p-0">
					<h4>회의 명</h4>
					<input type="text" class="form-control" placeholder="회의명을 입력해주세요." id="meetingNm" name="meetingNm"/>
				</div>
				<div class="col-md-6">
					<h4>정기 여부</h4>
					<select class="form-control" name="mettingType" id="mettingType">
					    <option value="1">정기 회의</option>
					    <option value="2">상시 회의</option>
					</select>
				</div>
			</div>
			<h4>주제</h4>
			<input type="text" class="form-control" placeholder="회의 주제를 입력해주세요." id="meetingTopic" name="meetingTopic"/>

			<h4>소개</h4>
			<textarea class="form-control" rows="5" placeholder="회의 소개를 입력해주세요." id="meetingIntro" name="meetingIntro"></textarea>

			<h4>회의 장소</h4>
			<input type="text" class="form-control" placeholder="회의 장소를 입력해주세요." id="meetingPlace" name="meetingPlace"/>

			<h4>일시</h4>
			<div class="form-group col-md-6 p-l-0">
		        <div class="input-group date" id="datepicker-disabled-past" data-date-format="yyyy-mm-dd" data-date-start-date="Date.default">
		            <input type="text" class="form-control" placeholder="일시를 입력해주세요." id="meetingDt" name="meetingDt"/>
		            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
		        </div>
			</div>
			<!-- 시간 -->
			<div class="col-md-6">
				<div class="col-md-12 p-0">
					<div class="col-md-5 p-r-0" >
						<input id="startTm" name="startTm" type="text" class="form-control" autocomplete="off" placeholder="시작 시간">
					</div>
					<div class="col-md-2 p-0" align="center">
						<label>~</label>
					</div>
					<div class="col-md-5 p-l-0">
						<input id="endTm" name="endTm" type="text" class="form-control" autocomplete="off" placeholder="종료 시간">
					</div>
				</div>
			</div>

			<div class="col-md-12 m-t-15 p-0">
				<div class="col-md-6 p-0 p-r-15">
					<a class="btn btn-danger btn-block" id="cancleBtn">취소</a>
				</div>
				<div class="col-md-6 p-0 p-l-15">
					<a class="btn btn-primary btn-block" id="enrollBtn">회의 등록</a>
				</div>
			</div>

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

	<script>
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