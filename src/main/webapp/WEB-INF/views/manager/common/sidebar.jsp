<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   .sidebar{ font-size: 1.3em; }
   a:hover {
      cursor:pointer;
   }



</style>
</head>
<body>
	<!-- begin #sidebar -->
	<div id="sidebar" class="sidebar">
		<!-- begin sidebar scrollbar -->
		<div data-scrollbar="true" data-height="100%">
			<!-- begin sidebar nav -->
			<ul class="nav">
				<li class="nav-header">Navigation</li>
				<li class="has-sub active">
					<a href="javascript:;">
					    <b class="caret pull-right"></b>
					    <i class="fa fa-laptop"></i>
					    <span>관리자</span>
				    </a>
					<ul class="sub-menu">
					    <li class="active"><a id="menuMain">메인페이지</a></li>
					    <li><a id="menuNotice">공지사항</a></li>
					    <li><a id="menuCarManage">차량관리</a></li>
					    <li><a id="menuVote">투표</a></li>
					    <li><a id="menuSurvey">설문조사</a></li>
					    <li><a id="menuFacility">시설물 관리</a></li>
					    <li><a id="menuComplaint">민원접수</a></li>
					    <li><a id="menuEmployeeManage">직원 관리</a></li>
					    <li><a id="menuMaintenanceCost">관리비</a></li>
					    <li><a id="menuVisitCar">방문차량 관리</a></li>
					</ul>
				</li>


		        <!-- begin sidebar minify button -->
				<li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>
		        <!-- end sidebar minify button -->
			</ul>
			<!-- end sidebar nav -->
		</div>
		<!-- end sidebar scrollbar -->
	</div>
	<div class="sidebar-bg"></div>
	<!-- end #sidebar -->

</body>
</html>