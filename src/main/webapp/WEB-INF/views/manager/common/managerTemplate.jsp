<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>

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
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
	<!-- ================== END BASE JS ================== -->
	<script type="text/javascript">
	const PageHtmlLoader = (function () {

		// 세션에 저장된 URL이 있는 경우 그 URL의 html을 그려준다.
		function load() {
			$.ajax({
				url :'/onepart/getMenu',
				method: 'post',
				success:function(menuId){
					if(menuId!= "none") {
						// 메뉴 그리기
						drawMenu(menuId);

						// 화면 그리기
						drawHtml(menuId);
					}
				}
			});

			// 메뉴 그리기
			function drawMenu(menuId) {
				// 기존 선택되어있는 메뉴 선택 해제
				$('li.has-sub').removeClass('expand');
				$('li').removeClass('active');

				// 상위 메뉴 열기
				$('#'+menuId).closest('li.has-sub').addClass('expand').addClass('active');

				// 하위 메뉴 선택
				$('#'+menuId).closest('li').addClass('active');
			}
		}

		// 세션에 메뉴 URL을 저장시킨다.
		function setMenuId(menuId) {
			$.ajax({
				url :'/onepart/setMenu',
				method: 'post',
				data : { menuId : menuId },
				success:function(){}
			});
		}

		// #content에 ajax로 가져온 html을 그려준다.
		function drawHtml(menuId) {
			PageHtmlLoader.setMenuId(menuId);

			let menuUrl = $('#'+menuId).data("menu-url");
			$.ajax({
				url :menuUrl,
				dataType : "html",
				success:function(result){
					$("#content").html(result);
					console.log(menuUrl);
				}
			});
		}

		return {
			'load' : load,
			'setMenuId' : setMenuId,
			'drawHtml' : drawHtml
		};
	})();
	</script>
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
		$(document).ready(function() {
			App.init();
			Dashboard.init();
			PageHtmlLoader.load();

			$("#menuMain").data("menu-url", "/onepart/manager/menuMain");
			$("#menuNotice").data("menu-url", "/onepart/manager/menuNotice");
			$("#menuCarManage").data("menu-url", "/onepart/manager/menuCarManage");
			$("#menuVote").data("menu-url", "/onepart/manager/menuVote");
			$("#menuSurvey").data("menu-url", "/onepart/manager/menuSurvey");
			$("#menuFacility").data("menu-url", "/onepart/manager/menuFacility");
			$("#menuComplaint").data("menu-url", "/onepart/manager/menuComplaint");
			$("#menuResidentManage").data("menu-url", "/onepart/manager/menuResidentManage");
			$("#menuEmployeeManage").data("menu-url", "/onepart/manager/menuEmployeeManage");
			$("#menuMaintenanceCost").data("menu-url", "/onepart/manager/menuMaintenanceCost");
			$("#menuVisitCar").data("menu-url", "/onepart/manager/menuVisitCar");


			$(".sub-menu > li > a").click(function(){
				$("li").removeClass("active");
				$(this).parents("li").addClass("active");
				let menuId = this.id;

				PageHtmlLoader.drawHtml(menuId);
			});

		});
	</script>
</body>
</html>