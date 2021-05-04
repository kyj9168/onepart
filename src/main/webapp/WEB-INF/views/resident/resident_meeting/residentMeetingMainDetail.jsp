<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#minutesChangeBtn').click(function(){
			var $minutesTextarea = $('<textarea>', {cols:'80', rows:'5', id:'meetingMinutes'});
			var $minutesEnrollBtn = $('<a>', {class:'btn btn-block btn-primary', id:'minutesEnrollBtn', text:'저장하기', style:'width:503px;'});

			$(this).before($minutesTextarea);
			$(this).before($minutesEnrollBtn);
			$(this).remove();
		});

		$("#deleteBtn").click(function(){

			var residentsMeetingSeq = $('#residentsMeetingSeq').val();
			console.log("residentsMeetingSeq : " + residentsMeetingSeq);

			$.ajax({
				url : 'removeResidentMeeting',
				type : 'post',
				data : {residentsMeetingSeq : residentsMeetingSeq},
				success : function(data){
					console.log("succ");
					$('#content').html(data);
				}
			});
		});

		$("#modifyBtn").click(function(){

			var residentsMeetingSeq = $('#residentsMeetingSeq').val();
			$.ajax({
				url : 'moveResidentMeetingMainModify',
				type : 'post',
				data : {residentsMeetingSeq : residentsMeetingSeq},
				success : function(data){
					$('#content').html(data);
				}
			});

		});

		$("#backBtn").click(function(){
			$.ajax({
				url : 'menuMeetingInfo',
				type : 'post',
				success : function(data){
					console.log("succ");
					$('#content').html(data);
				}
			});
		});

		$("#saveBtn").click(function(){
			var residentsMeetingSeq = $('#residentsMeetingSeq').val();
			console.log("residentsMeetingSeq : " + residentsMeetingSeq);

			var meetingMinutes = $('#meetingMinutes').val();

			$.ajax({
				url : 'saveMeetingMinutes',
				type : 'post',
				data : {
					meetingMinutes : meetingMinutes,
					residentsMeetingSeq : residentsMeetingSeq
				},
				success : function(data){
					console.log("succ");
					$('#saveBtn').style("border", "border: 1px solid green;");

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
	<div class="col-md-12 bg-white" style="height: 590px; ">
		<h3>입주민 대표회의</h3>
		<hr>
		<div class="col-md-12 p-l-20 p-r-20">
			<div class="col-md-6">
				<table class="table">
					<tr>
						<td><b>회의 명</b></td>
						<td>
							${responseResidentMeetingVO.meetingNm }
							<c:if test="${ responseResidentMeetingVO.meetingStatus == 1}">
								<span class="badge badge-inverse" id="surveyStatus">진행 예정</span>
							</c:if>
							<c:if test="${ responseResidentMeetingVO.meetingStatus == 2}">
								<span class="badge badge-Primary" id="surveyStatus">진행 중</span>
							</c:if>
							<c:if test="${ responseResidentMeetingVO.meetingStatus == 3}">
								<span class="badge badge-Danger" id="surveyStatus">종료</span>
							</c:if>
						</td>
					</tr>
					<tr>
						<td><b>회의 주제</b></td>
						<td>${ responseResidentMeetingVO.meetingTopic }</td>
					</tr>
					<tr>
						<td><b>회의 소개</b></td>
						<td>${ responseResidentMeetingVO.meetingIntro }</td>
					</tr>
					<tr>
						<td><b>회의 장소</b></td>
						<td>${ responseResidentMeetingVO.meetingPlace }</td>
					</tr>
					<tr>
						<td><b>일시</b></td>
						<td><c:out value="${fn: substring(responseResidentMeetingVO.meetingDt, 0, 10) }"/> ${responseResidentMeetingVO.meetingTm}</td>
					</tr>
					<tr>
						<td><b>회의록</b></td>
						<td>
							<textarea class="form-control" cols="45" rows="5" id="meetingMinutes" name="meetingMinutes">${ responseResidentMeetingVO.meetingMinutes }</textarea>
							<a class="btn btn-block btn-primary" id="saveBtn">회의록 저장</a>
						</td>
					</tr>
					<tr>
						<td><b>등록 일자</b></td>
						<td>${ responseResidentMeetingVO.meetingEnrollDt }</td>
					</tr>
				</table>
			</div>

			<div class="col-md-6">
				<video id="remoteVideo" autoplay style="height: 350px; width: 100%; border: 1px solid black" ></video>
				<button class="btn btn-block btn-success">회의 촬영 시작하기</button>
			</div>
		</div>

		<div class="col-md-12 p-0">
			<div class="col-md-4 p-l-0">
				<a class="btn btn-block btn-success" id="backBtn">이전 페이지</a>
			</div>
			<div class="col-md-4">
				<a class="btn btn-block btn-primary" id="modifyBtn">수정</a>
			</div>
			<div class="col-md-4 p-r-0">
				<a class="btn btn-block btn-danger" id="deleteBtn">삭제</a>
			</div>
			<input type="hidden" id="residentsMeetingSeq" name="residentsMeetingSeq" value="${responseResidentMeetingVO.residentsMeetingSeq}">

		</div>


	</div>
</body>
</html>