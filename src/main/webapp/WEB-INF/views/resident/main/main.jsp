<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<c:if test="${ sessionScope.loginUser == null }">
	<div style="width:85%; margin:0 auto;">
		<br>
		<table style="width:100%; margin-bottom:-10px;">
			<tr>
				<td><h3 style="font-weight:bold;">아파트의 모든 것, 원파트</h3></td>
			</tr>
		</table>
		<br>
		<div style="width:100%; background:white; margin:0 auto">
			<img style="width:80%;" src="${ contextPath }/resources/images/onepart_detail_1.PNG">
			<!-- <hr style="border-color:black"> -->
			<img style="width:80%; margin-left:20%" src="${ contextPath }/resources/images/onepart_detail_2.PNG">
			<!-- <hr style="border-color:black"> -->
			<img style="width:80%;" src="${ contextPath }/resources/images/onepart_detail_3.PNG">
			<!-- <hr style="border-color:black"> -->
			<img style="width:80%; margin-left:20%" src="${ contextPath }/resources/images/onepart_detail_4.PNG">
			<!-- <hr style="border-color:black"> -->
			<br><br><br><br>
			<h4 style="font-weight:bold; text-align:center">원파트 가입 신청문의 : 010 - 9947 - 7991</h4>
			<br>
		</div>
		<br>
	</div>
</c:if>
<c:if test="${ sessionScope.loginUser != null }">
<div style="width:85%; margin:0 auto">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
	   <!-- Indicators -->
	<ol class="carousel-indicators">
	  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	  <li data-target="#myCarousel" data-slide-to="1"></li>
	  <li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner">
	  <div class="item active">
	  	<div class="col-md-12 p-0">
		  	<div class="col-md-6 p-0">
			    <img src="${contextPath}/resources/img/login-bg/bg-13.jpg" style="width:100%; height: 400px;">
		  	</div>
		  	<div class="col-md-6 p-0">
		  <img src="${contextPath}/resources/img/login-bg/bg-21.jpg" style="width:100%; height: 400px;">
		  	</div>
	  	</div>
	</div>

	<div class="item">
		<div class="col-md-12 p-0">
		  	<div class="col-md-6 p-0">
			    <img src="${contextPath}/resources/img/login-bg/bg-10.jpg" style="width:100%; height: 400px;">
		  	</div>
		  	<div class="col-md-6 p-0">
			    <img src="${contextPath}/resources/img/login-bg/bg-12.jpg" style="width:100%; height: 400px;">
		  	</div>
	  	</div>
	</div>

	<div class="item">
		<div class="col-md-12 p-0">
		 	<div class="col-md-6 p-0">
			    <img src="${contextPath}/resources/img/login-bg/bg-18.jpg" style="width:100%; height: 400px;">
		</div>
		<div class="col-md-6 p-0">
			    <img src="${contextPath}/resources/img/login-bg/bg-20.jpeg" style="width:100%; height: 400px;">
			</div>
		</div>
	  </div>
	</div>

	<!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right"></span>
	      <span class="sr-only">Next</span>
	    </a>
	  </div>
	<br>
	<table style="width:100%; margin-bottom:-10px;">
		<tr>
			<td><h3 style="font-weight:bold;">${ sessionScope.loginUser.residentNm }님 환영합니다! &nbsp;&nbsp;&nbsp; ${fn:substring(loginUser.aptDetailInfoSeq,2,5)}동 ${fn:substring(loginUser.aptDetailInfoSeq,6,9)}호</h3>
			</td>
			<td style="width:5px"></td>
			<td></td>
		</tr>
	</table>
	<br>
</div>
<div style="width:85%; margin:0 auto; background:white">
	<!-- 현재 진행중인 투표 div -->
	<br><br>
	<table style="width:95%; margin:0 auto;">
		<tr>
			<td><h4 style="font-weight:bold;">현재 진행중인 투표</h4></td>
		</tr>
		<tr>
			<td>
				<div class="form-group">
                <br><br>
                    <span class="label label-warning" style="font-size:1.5em;">진행중</span>
                </div>
			</td>
			<td></td>
			<td style="width:15%">
			</td>
		</tr>
	</table>
	<div>
		<div class="panel-body" style="background:white" align="center">
			<table class="table table-hover" style="text-align: center; width:100%">
				<thead>
	                      <tr>
	                          <th class="text-center">투표번호</th>
	                          <th class="text-center">투표종류</th>
	                          <th class="text-center">투표명</th>
	                          <th class="text-center">투표현황</th>
	                          <th class="text-center">내 현황</th>
	                          <th class="text-center">투표종료날짜</th>
	                      </tr>
	                  </thead>
				<tbody>
					<c:forEach var="ingVoteList" items="${ ingVoteList }">
						<tr onclick="detailAllTypeVote(${ingVoteList.voteSeq}, '${ ingVoteList.voteKind }', '${ ingVoteList.voteStatus }')" data-toggle="modal">
							<td>${ ingVoteList.voteSeq }</td>
							<td>${ ingVoteList.voteKind }</td>
							<td>${ ingVoteList.voteNm }</td>
							<td>${ ingVoteList.voteStatus }</td>
							<td>${ ingVoteList.userStatus }</td>
							<td>${ ingVoteList.endDt }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<br>
<div style="width:85%; margin:0 auto; background:white">
	<!-- 현재 진행중인 투표 div -->
	<br><br>
	<table style="width:95%; margin:0 auto;">
		<tr>
			<td><h4 style="font-weight:bold;">현재 진행중인 설문조사</h4></td>
		</tr>
		<tr>
			<td>
				<div class="form-group">
                <br><br>
                    <span class="label label-warning" style="font-size:1.5em;">진행중</span>
                </div>
			</td>
			<td></td>
			<td style="width:15%">
			</td>
		</tr>
	</table>
	<div>
		<div id="tableArea">
			<div class="panel-body">
				<table class="table surveyTable" style="text-align: center; width:100%">
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">제목</th>
							<th class="text-center">상태</th>
							<th class="text-center">설문 타입</th>
							<th class="text-center">진행 날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ingSurveyVOList" items="${ ingSurveyVOList }">
						<tr>
							<td>${ ingSurveyVOList.surveySeq }</td>
							<td>${ ingSurveyVOList.surveyTitle }</td>
							<td>진행중</td>
							<td>
								<c:if test="${ ingSurveyVOList.surveyType == 1 }">
									일반 설문
								</c:if>
								<c:if test="${ ingSurveyVOList.surveyType == 2 }">
									세대별 섧문
								</c:if>
							</td>
							<%-- <td>${ ingSurveyVOList.userStatus }</td> --%>
							<td>${ ingSurveyVOList.surveyPeriod }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</c:if>
</body>
</html>