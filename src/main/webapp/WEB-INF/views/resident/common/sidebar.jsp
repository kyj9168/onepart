<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					    <i class="fa fa-home"></i>
					    <span>우리 아파트</span>
				    </a>
					<ul class="sub-menu">
					    <li class="active"><a id="menuMain">메인페이지</a></li>
					    <li><a id="menuVote">투표</a></li>
					    <li><a id="menuSurvey">설문조사</a></li>
					</ul>
				</li>
				<li class="has-sub">
					<a href="javascript:;">
					 	<b class="caret pull-right"></b>
						<i class="fa fa-inbox"></i>
						<span>우리 집</span>
					</a>
					<ul class="sub-menu">
					    <li><a id="menuMaintenanceCost">관리비</a></li>
					    <li><a id="menuMyCar">우리차량</a></li>
					    <li><a id="menuVisitCar">방문 차량등록</a></li>
					</ul>
				</li>
				<li class="has-sub">
					<a href="javascript:;">
					    <b class="caret pull-right"></b>
					    <i class="fa fa-suitcase"></i>
					    <span>따뜻함</span>
					</a>
					<ul class="sub-menu">
						<li><a id="menuOpenChatting">오픈채팅</a></li>
					</ul>
				</li>
				<li class="has-sub">
					<a href="javascript:;">
					    <b class="caret pull-right"></b>
					    <i class="fa fa-file-o"></i>
					    <span>편의</span>
					</a>
					<ul class="sub-menu">
						<li><a id="menuReservateFacility">시설물 예약</a></li>
						<li><a id="menuComplaint">민원접수</a></li>
					</ul>
				</li>
				<li class="has-sub">
					<a href="javascript:;">
					    <b class="caret pull-right"></b>
					    <i class="fa fa-th"></i>
					    <span>마이페이지</span>
					</a>
					<ul class="sub-menu">
						<li><a id="menuModifyInformation">개인정보 수정</a></li>
					</ul>
				</li>
				<li class="has-sub">
					<a href="javascript:;">
					    <b class="caret pull-right"></b>
						<i class="fa fa-star"></i>
						<span>입주자 대표 회의</span>
					</a>
					<ul class="sub-menu">
					    <li><a id="menuMeetingInfo">실시간 회의 참관 </a></li>
					</ul>
				</li>
				<%-- <c:if test="${ loginUser != null && (loginUser.aptAuthCd == 5 || loginUser.aptAuthCd == 6) }"> --%>
				<li class="has-sub">
				    <a href="javascript:;">
				        <b class="caret pull-right"></b>
				        <i class="fa fa-cubes"></i>
				        <span>선거관리 위원회</span>
				    </a>
				    <ul class="sub-menu" style="display: none;">
						<li><a id="menuSuperintendVote">선거관리</a></li>
				    </ul>
				</li>
				<%-- </c:if> --%>
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