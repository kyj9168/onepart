<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#titleH1 {
		display: inline-block;
		margin-right: 2%;
	}

	#surveyStatus {
		font-size: 1.5em;
	}
	#TbsurveyInfo {
		width: 50%;
	}


</style>
</head>
<body>

	<div class="row">
	    <div class="col-md-1"></div>
	    <div class="col-md-10">
			<h3>설문조사</h3>
			<br>

			<div class="tab-content">
				<div class="tab-pane fade active in" id="default-tab-1">

					<div id="surveyInfoHeader">

						<h2 id="titleH1">${ surveyVO.surveyTitle }</h2>

						<c:if test="${ surveyVO.surveyStatus == 1}">
							<span class="badge badge-inverse" id="surveyStatus">
								진행 예정
							</span>
						</c:if>
						<c:if test="${ surveyVO.surveyStatus == 2}">
							<span class="badge badge-Primary" id="surveyStatus">
								진행 중
							</span>
						</c:if>
						<c:if test="${ surveyVO.surveyStatus == 3}">
							<span class="badge badge-Danger" id="surveyStatus">
								종료
							</span>
						</c:if>

						<span style="text-align: right;">버튼</span>


						<table class="table" id="TbsurveyInfo">
							<tr>
								<td><h4>${ surveyVO.surveySimpleIntro }</h4></td>
							</tr>
							<tr>
								<td>설문 기간</td>
								<td>${ surveyVO.surveyPeriod }</td>
							</tr>
							<tr>
								<td>참여율</td>
								<td>${ prtcptPercentStr }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<br>

			<div class="tab-content">
				<div class="tab-pane fade active in" id="default-tab-1">

					<div id="surveyInfoBody">
						<c:forEach var="surveyQstn" items="${surveyQstnList }">
							<h3>${surveyQstn.surveyQstnTitle }
							(
							<c:if test="${surveyQstn.surveyQstnType == 1 }">
								단답형
							</c:if>
							<c:if test="${surveyQstn.surveyQstnType == 2 }">
								장문형
							</c:if>
							<c:if test="${surveyQstn.surveyQstnType == 3 }">
								객관식
							</c:if>
							<c:if test="${surveyQstn.surveyQstnType == 4 }">
								체크박스
							</c:if>
							)
							</h3>

						</c:forEach>
					</div>
				</div>
			</div>

		</div>
		<div class="col-md-1"></div>
	</div>
</body>
</html>