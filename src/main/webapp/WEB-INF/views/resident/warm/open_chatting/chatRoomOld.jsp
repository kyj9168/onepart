<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<style type="text/css">
	.panel-inverse>.panel-heading { height: 40px; }
	.panel-heading .label.pull-left, .panel-heading .label.pull-right { position: relative; top: -20px; }
	.ion-android-clipboard:before { display: inline-block; position: absolute; right: 80px; top: 9px; cursor: pointer;}

	.chats .message { margin-left: 12px; }
	.panel-inverse>.panel-heading { background: rgb(237,169,0) !important; }
	.badge.badge-success, .label.label-success { background: rgb(69, 206, 52) !important; }
	
	html, body { height: 100%; }
	.chat-content .panel-heading { position: fixed; top: 0; width: 100%; }
	.chat-content .panel-heading.notice { height: 60px; position: fixed; top: 40px; width: 100%; background-color: #000 !important; opacity: 0.7; z-index: 90; border-radius: 0;}
	
	/* 채팅방  */
	.chat-content.panel { height: 100%; margin-bottom: 0; padding-top: 40px; padding-bottom: 50px; }
	.chat-content .slimScrollDiv { padding: 0 15px; }
	.chat-content #chatpeople button { background: none; border: none; outline: none; }
	.chat-content .panel-body { height: 100%; padding: 0; }
	.chat-content .panel-footer { position: fixed; bottom: 0; z-index: 110; }
	.chat-content .chats>li+li { margin-bottom: 7px; }
	
	.chat-content ul.chats { padding: 0; }
	.chat-content .chats li:nth-child(1) { margin-top: 70px; }
	.chat-content .chats li { width: 100%; }
	.chat-content .chats li div { display: inline-block; }
	.chat-content .chats li div.message { max-width: 65%; margin:0; }
	.chat-content .chats li div.time { vertical-align:bottom; padding-left: 20px; }

	.chat-content .chats li.right { text-align: right; }
	.chat-content .chats li.right div.message {   margin-right: 5px; }
	.chat-content .chats li.right div.time { padding-right: 5px; }
	
	.chat-content .chats li.left { text-align: left; }
	.chat-content .chats li.left div.message {  margin-left: 5px; }
	.chat-content .chats li.left div.time { padding-left: 5px; }
	
	/* 채팅방 참여자 목록 */
	.member-content { background: rgba(0,0,0, 0.2); position: fixed; top: 40px; right: 0; height: 100%; padding: 10px; padding-bottom: 180px; }
	.member-content { width: 200px; opacity: 1;  z-index: 100; transition-property: width; transition-duration: 0.5s; }
	.member-content.modal-hide {  width: 0px; opacity: 0; z-index: 0; transition-property: width, opacity; transition-duration: 0.5s; }
	.member-content .member-title { white-space: nowrap; border-color: #e2e7eb; padding: 10px 15px; background: #45ce34; color: #FFF; }
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
		$(document).ready(function() {
			App.init();
			
		});
	</script>

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
				<strong>뜨개질 환영 뜨개질 환영뜨개질 환영</strong>
				<div class="noticeicon">
					<i class="ion-android-clipboard fa-2x text-inverse"></i>
				</div>
				
				<span class="label label-success pull-right" id="chatpeople">
					<button class="modal-show" data-modal-id="memberContentDiv">20/25</button>
				</span>
			</h4> 
		</div>
		<div class="panel-heading notice">
			<h4 class="panel-title">
				<strong>공지사항</strong>
			</h4>
			<p></p>
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
						placeholder="Enter your message here."> <span
						class="input-group-btn">
						<button id="sendMessageBtn" class="btn btn-primary btn-sm" type="button">Send</button>
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
		<div data-scrollbar="true" data-height="100%">
			<table id="memberTable " class="table table-striped table-bordered">
				<tbody>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>김동주</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
					<tr>
						<td>
							<span>맨아래</span>
						</td>
						<td>
							<i class="icon-close"></i>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<button id="exitBtn" class="btn btn-danger">방나가기</button>
		</div>
	</div>
	<!-- end 채팅자 목록 -->
</body>
 

<script>
	let webSocket;

	$(document).ready(function() {
		App.init();

		CustomModal.init();

		ChatMessage.init();
		ChatMessage.scrollBottom();
	});

	const ChatMessage = (function() {

		function init() {
			// 폼 전송 이벤트 제거
			$(document).on('submit', '#sendMessageForm', function(e) {
				// 기존 이벤트 제거
				e.preventDefault();
				
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

			webSocket = new WebSocket('ws://127.0.0.1:8001/onepart/resident/menuOpenChatRoom');
			console.log(webSocket);

			webSocket.onerror = function(event) {
				alert(event.data);
			};
			webSocket.onopen = function(event) {
				console.log('websocket connection success...')
			};
			webSocket.onmessage = function(event) {
				console.log(event.data);
				let resultData = JSON.parse(event.data);
				const sender = resultData.sender;
				const msg = resultData.message;
				const date = resultData.date;
				const isMe = resultData.isMe;
				addMessage(sender, msg, date, isMe);
			};
		}
		
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
		
		function sendMessage(msg) {
			let data = {
				'act': 'sendMsg',
				'sender' : 'djkim',
				'message' : msg
			};
			webSocket.send(JSON.stringify(data));
		}
		
		// scrollBar 맨 아래 여부
		function isScrollBottom(ignoreHeight) {
	        const scrollT = $('#chatDiv .slimScrollDiv > div').scrollTop(); //스크롤바의 상단위치
	        const scrollH = $('#chatDiv').height();	//스크롤바를 갖는 div의 높이
	        const contentH = $('#chatDiv ul').height();	//문서 전체 내용을 갖는 div의 높이

	        return (scrollT + scrollH + ignoreHeight >= contentH)
		}
		
		// 맨 아래 고정
		function scrollBottom() {
			let divHeight = $('#chatDiv').height();										// 채팅창 높이
			let scrollBarHeight = $('#chatDiv .slimScrollBar').height();				// 채팅창 템플릿 스크롤바 상단 높이
			$('#chatDiv .slimScrollDiv > div').scrollTop($('#chatDiv ul').height());	// 채팅창 높이 - 채팅창 원래 스크롤바 상단 높이
			$('#chatDiv .slimScrollBar').css('top', divHeight-scrollBarHeight); 		// 채팅창 높이 - 채팅창 템플릿 스크롤바 상단 높이
		}
		
		return {
			'init' : init,
			'sendMessage' : sendMessage,
			'scrollBottom' : scrollBottom
		}
	})();

</script>
</html>
