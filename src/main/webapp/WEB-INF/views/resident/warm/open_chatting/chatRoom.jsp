<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<style type="text/css">
	.format{display:none;}
	.panel-heading.notice .slimScrollDiv .slimScrollBar { background:#FFF !important;}
	.downback{ position: absolute; right: 10px; top: 0px; cursor: pointer;}
	.panel-inverse>.panel-heading { height: 40px; background: #00acac !important; }
	.panel-heading .label.pull-left, .panel-heading .label.pull-right {    background-color: #8a6d3b !important; position: relative; top: -20px; }
	.ion-android-clipboard:before { display: inline-block; position: absolute; right: 80px; top: 9px; cursor: pointer;}

	.chats .message { margin-left: 12px; }

	.badge.badge-success, .label.label-success { background: rgb(69, 206, 52) !important; }

	html, body { height: 100%; }
	.chat-content .panel-heading { position: fixed; top: 0; width: 100%; }
	.chat-content .panel-heading.notice { height: 120px; position: fixed; top: 40px; width: 100%; background-color: #000 !important; opacity: 0.7; z-index: 90; border-radius: 0;}

	/* 채팅방  */
	.table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th{ text-align: center; font-weight: bold; }
	.table-striped>tbody>tr:nth-child(even)>td, .table-striped>tbody>tr:nth-child(even)>th{ text-align: center; font-weight: bold; }
	.icon-arrow-right:before{ position: fixed; top: 60px; right: 20px; }
	.chat-content.panel { height: 100%; margin-bottom: 0; padding-top: 40px; padding-bottom: 50px; }
	.chat-content .slimScrollDiv { padding: 0 5px; }
	.chat-content #chatpeople button { background: none; border: none; outline: none; }
	.chat-content .panel-body { height: 100%; padding: 0; }
	.chat-content .panel-footer { position: fixed; bottom: 0; z-index: 110; }
	.chat-content .chats>li+li { margin-bottom: 7px; }

	.chat-content ul.chats { padding: 0px 5px; }
	.chat-content .chats li:nth-child(1) { margin-top: 20px; }
	.chat-content .chats li { width: 100%; }
	.chat-content .chats li div { display: inline-block; }
	.chat-content .chats li div.message { max-width: 75%; margin:0; }
	.chat-content .chats li div.message img { width: 100%; }

	.chat-content .chats li div.time { vertical-align:bottom; padding-left: 20px; }

	.chat-content .chats li.right { text-align: right; }
	.chat-content .chats li.right div.message {   margin-right: 5px; }
	.chat-content .chats li.right div.time { padding-right: 5px; }

	.chat-content .chats li.left { text-align: left; }
	.chat-content .chats li.left div.message {  margin-left: 5px; }
	.chat-content .chats li.left div.time { padding-left: 5px; }

	/* 채팅방 참여자 목록 */
	.member-content { background: rgba(0,0,0, 0.2); position: fixed; top: 40px; right: 0; height: 100%; padding: 10px; padding-bottom: 180px; }
	.member-content { width: 160px; opacity: 1;  z-index: 100; transition-property: width; transition-duration: 0.5s; }
	.member-content.modal-hide {  width: 0px; opacity: 0; z-index: 0; transition-property: width, opacity; transition-duration: 0.5s; }
	.member-content .member-title { white-space: nowrap; border-color: #e2e7eb; padding: 10px 15px; background: #348fe2; color: #FFF; }
	.member-content .member-title div { display: inline-block; width: 50%; }
	.member-content .member-title div:nth-child(2) { text-align: right; }
	.member-content .member-title div i.icon-arrow-right { cursor:pointer; color: #FFF; }
	.member-content .member-title div i.icon-arrow-right { font-size: 19px; opacity: 1; transition-property: opacity; transition-duration: 0.5s; transition-delay: 0.5s; }
	.member-content.modal-hide .member-title i.icon-arrow-right { font-size: 0px; opacity: 0; transition-property: opacity; transition-duration: 0.5s; }
	.member-content table { margin-bottom: 0; }
	.member-content table th { background:  rgb(237,169,0); color: #FFF !important; }
	.member-content table td { background:  #FFF; border: none !important; }
	.member-content table td:nth-child(2) { text-align: right; }
	.member-content table td span { white-space: nowrap; }
	.member-content table td i.icon-close { cursor:pointer; font-size: 17px; cursor: pointer; }
	.member-content table td i.icon-close { opacity: 1; transition-property: opacity; transition-duration: 0.5s; transition-delay: 0.5s; }
	.member-content.modal-hide table td i.icon-close { font-size: 0px; opacity: 0; transition-property: opacity; transition-duration: 0.5s; }
	.member-content table td span,
		.member-content .member-title span { opacity: 1; transition-property: opacity; transition-duration: 0.5s; transition-delay: 0.5s; }

	.member-content.modal-hide table td span,
		.member-content.modal-hide .member-title span { opacity: 0; transition-property: opacity; transition-duration: 0.5s; }

	.member-content #exitBtn { font-size: 12px; width: -webkit-fill-available; margin-top: 10px; }
	.member-content #exitBtn { opacity: 1; transition-property: opacity; transition-duration: 0.3s; }
	.member-content.modal-hide #exitBtn { opacity:0; transition-property: opacity; transition-duration: 0.3s; }
	.format { display: none; }
</style>

<!-- ================== BEGIN BASE CSS STYLE ================== -->
<link href="${contextPath}/resources/plugins/simple-line-icons/simple-line-icons.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<link
	href="${contextPath}/resources/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css"
	rel="stylesheet" />
<link
	href="${contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${contextPath}/resources/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/animate.min.css"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/style.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/style-responsive.min.css"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/theme/default.css"
	rel="stylesheet" id="theme" />
<!-- ================== END BASE CSS STYLE ================== -->

<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
<link
	href="${contextPath}/resources/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" />
<link
	href="${contextPath}/resources/plugins/bootstrap-datepicker/css/datepicker.css"
	rel="stylesheet" />
<link
	href="${contextPath}/resources/plugins/bootstrap-datepicker/css/datepicker3.css"
	rel="stylesheet" />
<link
	href="${contextPath}/resources/plugins/gritter/css/jquery.gritter.css"
	rel="stylesheet" />

	<script src="${contextPath}/resources/js/apps.min.js"></script>
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="${contextPath}/resources/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script
		src="${contextPath}/resources/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
	<script
		src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
		<script src="${contextPath}/resources/crossbrowserjs/html5shiv.js"></script>
		<script src="${contextPath}/resources/crossbrowserjs/respond.min.js"></script>
		<script src="${contextPath}/resources/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
	<script
		src="${contextPath}/resources/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="${contextPath}/resources/plugins/jquery-cookie/jquery.cookie.js"></script>
	<!-- ================== END BASE JS ================== -->

	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script
		src="${contextPath}/resources/plugins/gritter/js/jquery.gritter.js"></script>
	<script src="${contextPath}/resources/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${contextPath}/resources/plugins/flot/jquery.flot.time.min.js"></script>
	<script
		src="${contextPath}/resources/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${contextPath}/resources/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${contextPath}/resources/plugins/sparkline/jquery.sparkline.js"></script>
	<script
		src="${contextPath}/resources/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${contextPath}/resources/plugins/jquery-jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${contextPath}/resources/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="${contextPath}/resources/js/dashboard.min.js"></script>
	<script src="${contextPath}/resources/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->

	<script>
		const CustomModal = (function(){
			function init() {
				displayInit();
			}

			function displayInit() {
				$('.custom-modal').addClass('modal-hide');
				$(document).on('click', '.modal-hide-btn', function(){
					$('.custom-modal').addClass('modal-hide');
				});
				$(document).on('click', '.modal-show', function(){
					const modalId = $(this).data('modal-id');
					$('#'+modalId).removeClass('modal-hide');
				});
			}
			return {
				'init': init
			};
		})();
	</script>

</head>
<body>
	<!-- begin 채팅창 -->
	<div class="chat-content panel panel-inverse" data-sortable-id="index-2">
		<div class="panel-heading">
			<h4 class="panel-title">
				<strong>${ openChatVO.openChatRoomNm }</strong>
				<div class="noticeicon">
					<i class="ion-android-clipboard fa-2x text-inverse" id="noticeIcon"></i>
				</div>

				<span class="label label-success pull-right" id="chatpeople">
					<button class="modal-show" data-modal-id="memberContentDiv"><span id="openChatCurrHead">${ openChatVO.openChatCurrHead }</span>/${ openChatVO.openChatMaxHead }</button>
				</span>
			</h4>
		</div>
		<div class="panel-heading notice" >
			<h4 class="panel-title">
				<strong>공지사항</strong>
			</h4>
			<h4 class="downback">
				<strong>△</strong>
			</h4>
			<div class="noticeArea" data-scrollbar="true" data-height="92%">
			<p class="noticeCon">없음</p>
			</div>

		</div>

		<div id="chatDiv" class="panel-body bg-silver">
			<div data-scrollbar="true" data-height="100%">
				<ul class="chats">
					<!-- 채팅내용 동적 생성 -->
				</ul>
			</div>
			<!-- 채팅내용 동적 생성 포맷 -->
			<ul id="chatMsgFormat" class="format">
					<li class="left">
						<a class="name"></a>
						<div class="message"></div>
						<div class="time">
							<span class="date-time"></span>
						</div>
					</li>
					<li class="right">
						<a class="name"></a>
						<div class="time">
							<span class="date-time"></span>
						</div>
						<div class="message"></div>
					</li>
			</ul>
		</div>
		<div class="panel-footer">
			<form id="sendMessageForm" name="send_message_form" data-id="message-form">
				<div class="input-group">
					<input id="inputMsg" type="text" class="form-control input-sm" name="message"
						placeholder="보낼 메세지를 작성하시오." autocomplete="off">
					<span class="input-group-btn">
						<button id="sendMessageBtn" class="btn btn-primary btn-sm" type="button">보내기</button>
					</span>
				</div>
			</form>
		</div>
	</div>
	<!-- end 채팅창 -->

	<!-- begin 채팅자 목록  -->
	<div id="memberContentDiv" class="member-content custom-modal modal-hide" >
		<div class="member-title">
			<div>
				<span>채팅 참여자 목록</span>
			</div>
			<div>
				<i class="icon-arrow-right modal-hide-btn"></i>
			</div>
		</div>
		<div data-scrollbar="true" data-height="100%" class="memberDiv">

			<table id="memberTable" class="table table-striped table-bordered memberTable" >
				<tbody>

					<c:forEach var="residentVO" items="${residentList}">
						<tr>
							<td>
								<span class="member"><c:out value="${residentVO.residentId}" /></span>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>

			<table id="memberTable" class="table table-striped table-bordered memberTable format" >
				<tbody>
					<tr>
						<td><span class="member"></span></td>
					</tr>
				</tbody>
			</table>

		<div>
			<button id="exitBtn" class="btn btn-danger" onclick="getOut()">방나가기</button>
		</div>
	</div>
	<!-- end 채팅자 목록 -->
</body>


<script src="${contextPath}/resources/js/SockJs.min.js">

</script>

<script>
$(document).on('click', '.downback', function () {
	$(".chat-content .panel-heading.notice").css("height", "0px");
	$(".chat-content .panel-heading.notice").css("opacity", "0");
	$(".chat-content .panel-heading.notice").css("z-index", "-100");
	$(".chat-content .panel-heading.notice").css("-webkit-transition", "height 0.5s, opacity 0.5s, z-index 1s");
});
</script>
<script>
	let webSocket;

	$(document).ready(function() {
		notice();
		App.init();

		CustomModal.init();

		ChatMessage.init();

		ChatMessage.scrollBottom();

		$("#sendMessageBtn").attr('disabled',true);
		$(document).keyup(function (e) {
			inputMsgCheck();
		});
		$(document).mouseup(function (e) {
			inputMsgCheck();
		});

		setInterval(function(){
			notice()
			chatPerson()

		}, 2000);

	});

	function chatPerson(){
		let urlPathArr = location.href.split('/');
		let openChatSeq = urlPathArr[urlPathArr.length-1];

		$.ajax({
			url : '/onepart/resident/chatPerson',
			type : 'get',
			data : {openChatSeq : openChatSeq},
			dataType: 'json',
			success : function(data) {
				if(data.result == 'success'){
				let residentList = data.residentList;
				drawResidentList(residentList);

				console.log(data.openChatVO.openChatCurrHead);

				$("#openChatCurrHead").text(data.openChatVO.openChatCurrHead);

				}


			},
			error : function(err) {
				alert("참여자 목록을 가져오지 못했습니다.");
			}
	})
	}

	function drawResidentList(residentList) {
		let memberDiv = $('.memberDiv');
		memberDiv.html('');

		residentList.forEach(memeberInfo => {
			let memberDivFormat = $('.memberTable.format').clone();
			memberDivFormat.removeClass('format');
			memberDivFormat.show();
			console.log(memeberInfo.residentId);
			memberDivFormat.find('.member').text(memeberInfo.residentId);



			memberDiv.append(memberDivFormat);
		});
	}


	$(document).on('click', '#noticeIcon', function () {
		let urlPathArr = location.href.split('/');
		let openChatSeq = urlPathArr[urlPathArr.length-1];
		  const content = prompt( '공지사항을 입력하세요.\n(빈칸을 입력하시면 공지사항이 삭제됩니다.)');
		  console.log(content);
			if(content == ''){
				$.ajax({
					url : '/onepart/resident/deleteNotice',
					type : 'get',
					data : {openChatSeq : openChatSeq},
					dataType: 'json',
					success : function(data) {
						$(".noticeCon").text('없음');

					},
					error : function(err) {
						alert('공지사항 삭제에 실패하였습니다.');
					}
				});
				}else if(content != null){
					$.ajax({
						url : '/onepart/resident/insertNotice',
						type : 'get',
						data : {openChatSeq : openChatSeq, content : content},
						dataType: 'json',
						success : function(data) {
							notice();

						},
						error : function(err) {
							alert('공지사항 작성에 실패하였습니다.');
						}
					});
				}

	});



	function getOut(){
		let urlPathArr = location.href.split('/');
		let openChatSeq = urlPathArr[urlPathArr.length-1];
		let residentSeq = ${ sessionScope.loginUser.residentSeq };
		var real = window.confirm("정말 방을 나가시겠습니까?");
		console.log(real);
		if(real){
		$.ajax({
			url : '/onepart/resident/getOut',
			type : 'get',
			data : {residentSeq : residentSeq, openChatSeq : openChatSeq},
			dataType: 'json',
			success : function(data) {

				window.close();
			},
			error : function(err) {
				alert('나가기에 실패하였습니다.');
			}
		});
		}

	}

	function notice(){
		let urlPathArr = location.href.split('/');
		let openChatSeq = urlPathArr[urlPathArr.length-1];
		$.ajax({
			url : '/onepart/resident/noticeSelect',
			type : 'get',
			data : {openChatSeq : openChatSeq},
			dataType: 'json',
			success : function(data) {

				$(".noticeCon").text(data.openChatNoticeVO.openChatNoticeContent);

			},
			error : function(err) {
				alert('공지사항 읽기에 실패하였습니다.');
			}
		});

		}




	function inputMsgCheck(){

		if($("#inputMsg" ).val()== ""){
			  $("#sendMessageBtn").attr('disabled',true);

		  }else{
				$("#sendMessageBtn").attr('disabled',false)
		  }
	}

	const ChatMessage = (function() {

		function init() {
			// 폼 전송 이벤트 제거
			$(document).on('submit', '#sendMessageForm', function(e) {
				// 기존 이벤트 제거
				e.preventDefault();
				console.log("12345");
				// 전송 버튼 클릭 이벤트 발생
				$("#sendMessageBtn").trigger('click');
			});

			// 전송 버튼 클릭 이벤트
			$(document).on('click', '#sendMessageBtn', function() {
				const msg = $('#inputMsg').val();
				sendMessage(msg);

				// 지우기
				$('#inputMsg').val('');
			});

			webSocket = new SockJS('/onepart/menuOpenChatRoom');

			webSocket.onerror = function(event) {
				alert(event.data);
			};
			// 연결 성공 시
			webSocket.onopen = function(event) {
				console.log('websocket connection success...');
				// 방에 참여
				enterRoom();
				// 이전대화 호출
				getPrevMessages();
			};
			webSocket.onmessage = function(event) {
				let resultData = JSON.parse(event.data);

				if(resultData.act == "sendMsg") {
					const senderId = resultData.senderId;
					const msg = resultData.message;
					const date = resultData.date;
					const isMe = resultData.isMe;

					addMessage(senderId, msg, date, isMe);
				}
				else if(resultData.act == "sendImageUrl") {
					const senderId = resultData.senderId;
					const imageUrl = resultData.message;
					const date = resultData.date;
					const isMe = resultData.isMe;
					const uploadPath = resultData.uploadPath

					addImage(senderId, imageUrl, date, isMe, uploadPath);
				}
				else if(resultData.act == "getPrevMessages") {


					resultData.prevMessageList.forEach(PrevMessages => {
						const msg = PrevMessages.openChatCommContent;
						const senderId = PrevMessages.residentId;


						function formatDate(date) {
							const Month = 	(date.getMonth() + 1)>10?(date.getMonth() + 1):'0'+(date.getMonth() + 1)
						    const Date = date.getDate()>10?date.getDate():'0'+date.getDate()
						   const Hours =  date.getHours()>10?date.getHours():'0'+date.getHours()
						   const Minutes =  date.getMinutes()>10?date.getMinutes():'0'+date.getMinutes();

						    return Month + '/' + Date + ' ' + Hours + ':'+ Minutes
							}


						const date = formatDate(new Date(PrevMessages.openChatCommSendDt));  // 2017년 3월 11일 11시 30분



						const isMe = '${ sessionScope.loginUser.residentId }' == senderId? true:false;
						addMessage(senderId, msg, date, isMe);
					});



				}
			};

			// 드래그 앤 드랍 [파일 업로드]
			$("html").on("dragover", function(e) {
			    e.preventDefault();
			    e.stopPropagation();
			    $(this).addClass('dragging');
			});

			$("html").on("dragleave", function(e) {
			    e.preventDefault();
			    e.stopPropagation();
			    $(this).removeClass('dragging');
			});

			$("html").on("drop", function(e) {
			    e.preventDefault();
			    e.stopPropagation();

				var files = e.originalEvent.dataTransfer.files;
				handleFileUpload(files);
			});
		}

		function handleFileUpload(files) {
			const fileLength = files.length;
			if(confirm('총 '+fileLength+'개의 파일을 업로드 하시겠습니까?')) {
				let successCount = 0;
				for(let i=0; i<files.length; i++) {
					let file = files[i];

					if(checkFilesExt(file)) {
						uploadFile(file);
						successCount++;
					}
				}

				if(successCount < fileLength) {
					alert('총 '+successCount+'개의 파일을 전송했습니다.\njpg, png, gif 파일만 업로드 가능합니다.');
				}
			}
		}

		// 파일 확장자 체크
		function checkFilesExt(file) {
			let isValid = true;

			let fileNameArr = (file.name).split('.');
			let fileExt = fileNameArr[fileNameArr.length-1].toUpperCase();

			if(fileExt != 'PNG' && fileExt != 'JPG' && fileExt != 'GIF')
				isValid = false;

			return isValid;
		}

		function uploadFile(file) {
			let formData = new FormData();
			formData.append("file", file);

			$.ajax({
				url : '/onepart/resident/fileUpload',
				type : 'POST',
				data : formData,
				processData: false,
				contentType: false,
				dataType: 'json',
				success : function(data) {
					if(data.result == "success"){
						// resources 경로 가져오는 부분 개선 필요, 대충 때려넣음
						imageUrl = (location.protocol + '//' + location.host + '/onepart/resources/uploadFiles/chatting'+data.savedPath);
						originFileName = data.originFileName
						ext = data.ext
						changeName = data.changeName
						uploadPath = data.uploadPath
						sendImageUrl(imageUrl,changeName,originFileName,ext,uploadPath);
					}
					//sendMessage(msg);
				},
				error : function(err) {
					alert('파일 업로드를 실패했습니다.');
				}
			});
		}

		// 이미지 전송
		function sendImageUrl(imageUrl,changeName,originFileName,ext,uploadPath) {
			let urlPathArr = location.href.split('/');
			let openChatSeq = urlPathArr[urlPathArr.length-1];
			console.log(":::" +changeName);
			console.log(":::" +originFileName);
			console.log(":::" +ext);
			console.log(":::" +uploadPath);
			let data = {
				'act': 'sendImageUrl',
				'sender' : '${ sessionScope.loginUser.residentSeq }',
				'senderId' : '${ sessionScope.loginUser.residentId }',
				'openChatSeq' : openChatSeq,
				'message' : imageUrl,
				'changeName' : changeName,
				'originFileName' : originFileName,
				'ext' : ext,
				'uploadPath' : uploadPath
			};
			webSocket.send(JSON.stringify(data));
		}

		// 메세지 하나 그리기
		function addMessage(sender, msg, date, isMe) {
			let msgFormat = (isMe)? $('#chatMsgFormat').find('li.right').clone() :  $('#chatMsgFormat').find('li.left').clone();
			msgFormat.find('.name').text(sender);
			msgFormat.find('.message').html(msg);
			msgFormat.find('.date-time').text(date);

			$('ul.chats').append(msgFormat);

			// 스크롤바 가장 하에 위치
			if(isScrollBottom(msgFormat.height())) {
				scrollBottom();
			}
		}

		// 이미지 메세지 하나 그리기
		function addImage(sender, imageUrl, date, isMe, uploadPath) {
			let msgFormat = (isMe)? $('#chatMsgFormat').find('li.right').clone() :  $('#chatMsgFormat').find('li.left').clone();
			msgFormat.find('.name').text(sender);
			msgFormat.find('.message').html('<a href='+imageUrl+' download><img src='+imageUrl+'></a>');
			msgFormat.find('.date-time').text(date);

			$('ul.chats').append(msgFormat);

			// 스크롤바 가장 하에 위치
			if(isScrollBottom(msgFormat.height())) {
				scrollBottom();
			}
		}


		// 방에 참가
		function enterRoom() {
			let urlPathArr = location.href.split('/');
			let openChatSeq = urlPathArr[urlPathArr.length-1];
			let data = {
				'act': 'enterRoom',
				'openChatSeq' : openChatSeq
			};

			webSocket.send(JSON.stringify(data));
		}

		// 이전대화 호출
		function getPrevMessages() {
			let urlPathArr = location.href.split('/');
			let openChatSeq = urlPathArr[urlPathArr.length-1];

			let data = {
				'act': 'getPrevMessages',
				'openChatSeq' : openChatSeq
			};

			webSocket.send(JSON.stringify(data));
		}



		// 메세지 전송
		function sendMessage(msg) {
			let urlPathArr = location.href.split('/');
			let openChatSeq = urlPathArr[urlPathArr.length-1];
			let data = {
				'act': 'sendMsg',
				'sender' : '${ sessionScope.loginUser.residentSeq }',
				'senderId' : '${ sessionScope.loginUser.residentId }',
				'openChatSeq' : openChatSeq,
				'message' : msg
			};
			webSocket.send(JSON.stringify(data));
		}

		// scrollBar 맨 아래 여부
		function isScrollBottom(ignoreHeight) {
	        const scrollT = $('#chatDiv .slimScrollDiv > div').scrollTop(); //스크롤바의 상단위치
	        const scrollH = $('#chatDiv').height();	//스크롤바를 갖는 div의 높이
	        const contentH = $('#chatDiv ul').height();	//문서 전체 내용을 갖는 div의 높이

	        return (scrollT + scrollH + ignoreHeight >= contentH);
		}

		// 맨 아래 고정
		function scrollBottom() {
			let divHeight = $('#chatDiv').height();										// 채팅창 높이
			let scrollBarHeight = $('#chatDiv .slimScrollBar').height();				// 채팅창 템플릿 스크롤바 상단 높이
			$('#chatDiv .slimScrollDiv > div').scrollTop($('#chatDiv ul').height());	// 채팅창 높이 - 채팅창 원래 스크롤바 상단 높이
			$('#chatDiv .slimScrollBar').css('top', divHeight-scrollBarHeight);


		}

		return {
			'init' : init,
			'sendMessage' : sendMessage,
			'scrollBottom' : scrollBottom
		}
	})();

</script>
</html>
