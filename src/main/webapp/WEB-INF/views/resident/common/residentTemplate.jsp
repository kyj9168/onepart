<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
<c:if test="${ !empty sessionScope.loginUser }">
	<c:set var="loginUser" value="${ sessionScope.loginUser }"/>
</c:if>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>Onepart | Vi-Fi</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />

	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="${contextPath}/resources/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/simple-line-icons/simple-line-icons.css" rel="stylesheet" />
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/animate.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/style.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/style-responsive.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/theme/default.css" rel="stylesheet" id="theme" />
	<link href="${contextPath}/resources/plugins/DataTables/css/data-table.css"	rel="stylesheet" />
	<!-- ================== END BASE CSS STYLE ================== -->

	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="${contextPath}/resources/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
    <link href="${contextPath}/resources/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL STYLE ================== -->

	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${contextPath}/resources/plugins/pace/pace.min.js"></script>
	<!-- ================== END BASE JS ================== -->
	<!-- chart -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.js" integrity="sha256-qSIshlknROr4J8GMHRlW3fGKrPki733tLq+qeMCR05Q=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js" integrity="sha256-xKeoJ50pzbUGkpQxDYHD7o7hxe0LaOGeguUidbq6vis=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.css" integrity="sha256-IvM9nJf/b5l2RoebiFno92E5ONttVyaEEsdemDC6iQA=" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js" integrity="sha256-arMsf+3JJK2LoTGqxfnuJPFTU4hAK57MtIPdFpiHXOU=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css" integrity="sha256-aa0xaJgmK/X74WM224KMQeNQC2xYKwlAt08oZqjeF0E=" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" integrity="sha256-Uv9BNBucvCPipKQ2NS9wYpJmi8DTOEfTA/nH2aoJALw=" crossorigin="anonymous"></script>
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<style type="text/css">
	#content *:not(h1):not(h2):not(h3):not(h4):not(h5) {
		font-size: 1.025em;
	}
	*{
		font-family: 'Do Hyeon', sans-serif;
	}
</style>

</head>
<body>
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>
	<!-- end #page-loader -->

	<!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">

		<!-- begin #header -->
		<jsp:include page="header.jsp"/>
		<!-- end #header -->

		<!-- sidebar -->
		<jsp:include page="sidebar.jsp"/>

		<!-- begin #content -->
		<div id="content" class="content">
			<jsp:include page="../main/main.jsp"/>
		</div>
		<!-- end #content -->

		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->

	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${contextPath}/resources/plugins/jquery/jquery-1.9.1.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
		<script src="${contextPath}/resources/crossbrowserjs/html5shiv.js"></script>
		<script src="${contextPath}/resources/crossbrowserjs/respond.min.js"></script>
		<script src="${contextPath}/resources/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
	<script src="${contextPath}/resources/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery-cookie/jquery.cookie.js"></script>
	<!-- ================== END BASE JS ================== -->

	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script	src="${contextPath}/resources/plugins/DataTables/js/jquery.dataTables.js"></script>
	<script	src="${contextPath}/resources/plugins/DataTables/js/dataTables.colVis.js"></script>
	<script src="${contextPath}/resources/js/table-manage-colvis.demo.min.js"></script>
	<script src="${contextPath}/resources/plugins/gritter/js/jquery.gritter.js"></script>
	<script src="${contextPath}/resources/plugins/flot/jquery.flot.min.js"></script>
	<script src="${contextPath}/resources/plugins/flot/jquery.flot.time.min.js"></script>
	<script src="${contextPath}/resources/plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="${contextPath}/resources/plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="${contextPath}/resources/plugins/sparkline/jquery.sparkline.js"></script>
	<script src="${contextPath}/resources/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery-jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="${contextPath}/resources/js/dashboard.min.js"></script>
	<script src="${contextPath}/resources/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->

	<!-- COMMON -->
	<script src="${contextPath}/resources/js/common.js"></script>

	<script>
		// ?????? ?????? ???????????? timeoutID
		let OpenChatRoomListTimeoutEnable = true;
		let OpenChatRoomListTimeoutManage = "";

		const PageHtmlLoader = (function () {

			// ????????? ????????? URL??? ?????? ?????? ??? URL??? html??? ????????????.
			function load() {
				$.ajax({
					url :'/onepart/getMenu',
					method: 'post',
					success:function(menuId){
						if(menuId!= "none") {
							// ?????? ?????????
							drawMenu(menuId);

							// ?????? ?????????
							drawHtml(menuId);

						}
					}
				});

				// ?????? ?????????
				function drawMenu(menuId) {
					// ?????? ?????????????????? ?????? ?????? ??????
					$('li.has-sub').removeClass('expand');
					$('li').removeClass('active');

					// ?????? ?????? ??????
					$('#'+menuId).closest('li.has-sub').addClass('expand').addClass('active');

					// ?????? ?????? ??????
					$('#'+menuId).closest('li').addClass('active');
				}
			}

			// ????????? ?????? URL??? ???????????????.
			function setMenuId(menuId) {
				$.ajax({
					url :'/onepart/setMenu',
					method: 'post',
					data : { menuId : menuId },
					success:function(){}
				});
			}

			// #content??? ajax??? ????????? html??? ????????????.
			function drawHtml(menuId) {
				PageHtmlLoader.setMenuId(menuId);

				let menuUrl = $('#'+menuId).data("menu-url");
				$.ajax({
					url :menuUrl,
					dataType : "html",
					success:function(result){
						$("#content").html(result);
						console.log(menuUrl);

						// ajax ??????
						if( menuUrl != "/onepart/resident/menuOpenChatting" ) {
							if(OpenChatRoomListTimeoutManage != "") {
								OpenChatRoomListTimeoutEnable = false;
								clearTimeout(OpenChatRoomListTimeoutManage);
							}
						}else {
							OpenChatRoomListTimeoutEnable = true;
						}
					}
				});
			}

			return {
				'load' : load,
				'setMenuId' : setMenuId,
				'drawHtml' : drawHtml
			};
		})();

		$(document).ready(function() {
			App.init();
			Dashboard.init();
			PageHtmlLoader.load();

			/* ??????????????? */
			$("#menuMain").data("menu-url", "/onepart/resident/menuMain"); 	// ????????????

			/* ?????? ????????? */
			$("#menuNotice").data("menu-url", "/onepart/resident/menuNotice"); 	// ????????????
			$("#menuVote").data("menu-url", "/onepart/resident/menuVote");		// ??????
			$("#menuSurvey").data("menu-url", "/onepart/resident/menuSurvey");	// ????????????

			/* ?????? ??? */
			$("#menuMaintenanceCost").data("menu-url", "/onepart/resident/menuMaintenanceCost");	// ?????????
			$("#menuMyCar").data("menu-url", "/onepart/resident/menuMyCar");	// ????????????
			$("#menuVisitCar").data("menu-url", "/onepart/resident/menuVisitCar");				// ????????????

			/* ????????? */
			$("#menuOpenChatting").data("menu-url", "/onepart/resident/menuOpenChatting");	// ????????????

			/* ?????? */
			$("#menuReservateFacility").data("menu-url", "/onepart/resident/menuReservateFacility")	// ????????? ??????
			$("#menuOpserveMeeting").data("menu-url", "/onepart/resident/menuOpserveMeeting");		// ?????? ??????
			$("#menuComplaint").data("menu-url", "/onepart/resident/menuComplaint");					// ????????????

			/* ?????? ????????? */
			$("#menuModifyInformation").data("menu-url", "/onepart/resident/menuModifyInformation");	// ???????????? ??????
			$("#menuMyHistory").data("menu-url", "/onepart/resident/menuMyHistory");					// ?????? ??????

			/* ????????? ?????? ?????? */
			$("#menuMeetingInfo").data("menu-url", "/onepart/resident/menuMeetingInfo");		// ?????? ??????
			$("#menuAuthorization").data("menu-url", "/onepart/resident/menuAuthorization");	// ?????? ??????

			/* ???????????? ????????? */
			$("#menuSuperintendVote").data("menu-url", "/onepart/resident/menuSuperintendVote");	// ????????????

			$(".sub-menu > li > a").click(function(){
				$("li").removeClass("active");
				$(this).parents("li").addClass("active");
				let menuId = this.id;

				PageHtmlLoader.drawHtml(menuId);
			});

		});

		/* function menuReservateFacility(residentSeq) {
			$("li").removeClass("active");
			$(this).parents("li").addClass("active");

			console.log("??????????????? ??????")

			$.ajax({
				url :"/onepart/resident/menuReservateFacility",
				dataType : "html",
				data:{residentSeq:residentSeq},
				success:function(result){
					$("#content").html(result);
				}
			});
		} */
	</script>
</body>
</html>
