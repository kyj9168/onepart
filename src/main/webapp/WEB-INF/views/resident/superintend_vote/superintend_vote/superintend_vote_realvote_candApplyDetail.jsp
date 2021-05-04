<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../superintend_vote/superintend_vote_include.jsp"></jsp:include>
<jsp:include page="../superintend_vote/superintend_vote_detail_include.jsp"></jsp:include>
<!-- 후보신청서 상세보기 div -->
<div style="width:85%; margin:0 auto">
	<!-- title div -->
	<table style="width:95%">
		<tr>
			<td>
				<div class="form-group">
                    <h4>후보신청서 상세보기</h4>
                </div>
			</td>
		</tr>
	</table>
	<!-- 신청서 표 div -->
	<div class="panel-body" style="background:white" align="center">
		<br>
		<table style="width:95%; text-align:left;">
			<tr>
				<td style="width:7%">제목</td>
				<td style="width:45%" align="left"><input class="form-control" type="text" style="width:90%; height:100%" value="${ evc.residentNm }님의 후보자 등록신청서"></td>
				<td style="width:10%">후보구분</td>
				<td><input class="form-control" type="text" style="width:90%; height:100%" value="${ ev.electNm }"></td>
			</tr>
			<tr>
				<td colspan="4"><br></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<!-- 신청서 div -->
					<div>
						<br>
						<table border="1" style="width:100%; height:900px; text-align:center;">
							<tr style="text-align:center;">
								<td colspan=3 id="candidateCondition" style="height:120px">
									<h4 align="center">
										${ ev.electNm } <br>
										후 보 자 등 록 신 청 서
									</h4>
								</td>
								<td rowspan="4">
									<div id="contentImgArea1">
										<img id="contentImg1" src="${ contextPath }/resources/uploadFiles/reservation/${ evc.changeNm }" style="width:100%; height:100">
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:15%">동 - 호</td>
								<td colspan="2" style="height:80px">${ evc.bdNm }동 ${ evc.rmNm }호</td>
							</tr>
							<tr>
								<td>성 명</td>
								<td colspan="2" style="height:80px">${ evc.residentNm }</td>
							</tr>
							<tr>
								<td>등록기준지</td>
								<td colspan="2" style="height:80px">경기도 안양시 만안구 석수3동</td>
							</tr>
							<tr>
								<td>주소</td>
								<td colspan="3" style="height:80px">경기도 안양시 만안구 석수3동 코오롱하늘채 ${ evc.bdNm }동 ${ evc.rmNm }호</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td style="width:35%; height:80px">19${fn:substring(evc.residentBirth,0,2)}년 ${fn:substring(evc.residentBirth,2,4)}월 ${fn:substring(evc.residentBirth,4,6)}일</td>
								<td style="width:15%">성별</td>
								<c:if test="${ evc.residentGender == 'F' }">
									<td>여자</td>
								</c:if>
								<c:if test="${ evc.residentGender == 'M' }">
									<td>남자</td>
								</c:if>
							</tr>
							<tr>
								<td>최종학력</td>
								<td colspan="3" style="height:80px">
									${ evc.finalEdu }
								</td>
							</tr>
							<tr>
								<td>직장명</td>
								<td style="height:80px">
									${ evc.workNm }
								</td>
								<td>직위</td>
								<td>
									${ evc.workPosition }
								</td>
							</tr>
							<tr>
								<td>직장주소</td>
								<td colspan="3" style="height:80px">
									${ evc.workAdd }
								</td>
							</tr>
							<tr>
								<td rowspan="5">경력 및 이력</td>
								<td style="height:80px">년 월 일</td>
								<td colspan="2">경력 및 이력사항</td>
							</tr>
							<c:forEach var="careerList" items="${ careerList }">
								<tr>
									<td>
										${ careerList.careerPeriod }
									</td>
									<td colspan="2" style="height:80px">
										${ careerList.careerDetail }
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</td>
			</tr>
		</table>
		<br><br>
	</div>
</div>
</body>
</html>