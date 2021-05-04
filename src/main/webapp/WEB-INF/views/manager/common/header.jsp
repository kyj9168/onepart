<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/plugins/jquery/jquery-1.9.1.min.js"></script>
<script src="${contextPath}/resources/js/SockJs.min.js"></script>
<script type="text/javascript">

	$(function(){
		$('#messengerBtn').click(function(){
			console.log('in!~!');
			url = '${contextPath}/messenger/moveMessenger';
			window.open(url, "Messenger", "width=1200px; height=680px;");
		});
	});

	$(function(){

		var user = '${ sessionScope.loginUser }';
		console.log(user);
		if(user){
			// 웹소켓 연결
			webSocket = new SockJS('/onepart/messenger');
			webSocket.onerror = function(event) {
				alert(event.data);
			};

			// 연결 성공 시 실행
			webSocket.onopen = function(event) {
				console.log('websocket connection success...');
				// 연결 성공 시 Map에 seq, session 담기
				var message = {};
				message.type = 'init';
				message.residentSeq = '${ sessionScope.loginUser.managerSeq }';
				console.log(message);
				webSocket.send(JSON.stringify(message));
			};

			// 메시지 전송 시 실행
			webSocket.onmessage = function(event) {
				console.log(event.data);
				$('#messengerCount').text(event.data);
			}
		}
	});

</script>
<style type="text/css">
#header{
	font-size:1.2em;
}
</style>
</head>
<body>
<div id="header" class="header navbar navbar-default navbar-fixed-top">
	<!-- begin container-fluid -->
	<div class="container-fluid">
		<!-- begin mobile sidebar expand / collapse button -->
		<div class="navbar-header">
			<a href="${contextPath}/manager/main" class="navbar-brand"><img style="position: absolute; width: 110px; top: 8px; left: 14px;" src="${contextPath}/resources/images/onpart (1).png" alt="" /> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | V i-F i</a>
			<button type="button" class="navbar-toggle" data-click="sidebar-toggled">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<!-- end mobile sidebar expand / collapse button -->

		<!-- begin header navigation right -->
		<ul class="nav navbar-nav navbar-right">
			<li>
				<form class="navbar-form full-width">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Enter keyword" />
						<button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
					</div>
				</form>
			</li>

			<c:if test="${sessionScope.loginUser != null }">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle f-s-14" id="messengerBtn">
					<i class="fa fa-envelope"></i>
					<c:if test="${ count != 0 }">
						<span class="label" id="messengerCount">${ count }</span>
					</c:if>
				</a>
			</li>
			</c:if>
			<li class="dropdown navbar-user">
				<c:if test="${sessionScope.loginUser != null }">
				<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
					<img src="${contextPath}/resources/img/user-13.jpg" alt="" />
					<span class="hidden-xs">${ sessionScope.loginUser.managerNm}</span> <b class="caret"></b>
				</a>
				<ul class="dropdown-menu animated fadeInLeft">
					<li class="arrow"></li>
					<li><a href="javascript:;">Edit Profile</a></li>
					<li><a href="javascript:;"><span class="badge badge-danger pull-right">2</span> Inbox</a></li>
					<li><a href="javascript:;">Calendar</a></li>
					<li><a href="javascript:;">Setting</a></li>
					<li class="divider"></li>

					<li><a href="${contextPath }/mLogout">Log Out</a></li>

				</ul>
				</c:if>



			</li>
			<c:if test="${sessionScope.loginUser == null }">
				<span style="height: 100%;">
					<button type="button" onclick="location.href='${contextPath}/moveManagerAccount'" class="btn btn-success m-r-5 m-b-5" style="margin-top: 3%;">Log In</button>
					<%-- <button type="button" onclick="location.href='${contextPath}/moveRegister'" class="btn btn-success m-r-5 m-b-5" style="margin-top: 3%;">회원가입</button> --%>
				</span>
			</c:if>
		</ul>

		<!-- end header navigation right -->
	</div>
	<!-- end container-fluid -->
</div>
</body>
</html>