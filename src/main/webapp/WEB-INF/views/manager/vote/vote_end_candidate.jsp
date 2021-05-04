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
<jsp:include page="../vote/vote_include.jsp"></jsp:include>
<jsp:include page="../vote/vote_detail_include_end.jsp"></jsp:include>
<!-- 선거결과 div -->
<div style="width:85%; margin:0 auto">
	<table style="width:100%">
		<tr>
			<td>
				<div class="form-group">
                    <h4>후보정보</h4>
                </div>
			</td>
		</tr>
	</table>
	<!-- 후보 개개인 정보 div -->
	<div class="panel-body" style="background:white" align="center">
		<div style="width:95%">
			<ul class="media-list media-list-with-divider">
				<c:forEach var="candidateList" items="${ candidateList }" varStatus="status">
					<!-- 한후보 정보 div -->
					<li style="margin-bottom:-10px;">
						<table style="width:95%; margin:0 auto;">
							<tr>
								<td style="width:85%"><h4>후보${ candidateList.cndtNo }번 ${ candidateList.residentNm }
								&nbsp;&nbsp;&nbsp; <small style="font-size:1em">${ candidateList.bdNm }동 ${ candidateList.rmNm }호 거주</small></h4></td>
								<td>
									<span class="badge badge-inverse" style="font-size:1.25em">총 투표중 ${ candidatePercentList[status.index].candidatePercent }%</span>
								</td>
							</tr>

						</table>
					</li>
					<li class="media media-lg" style="padding:15px; margin-top:10px">
						<table style="width:95%; margin:0 auto;">
							<tr>
								<td>
									<a href="javascript:;" class="pull-left">
										<img class="media-object" src="${ contextPath }/resources/uploadFiles/reservation/${ candidateList.changeNm }" alt="" style="height:250px; width:auto;">
									</a>
								</td>
								<td style="width:10%"></td>
								<td>
									<div class="media-body" style="padding-top:1%">
										<h4 class="media-heading">후보자 간단정보</h4>
										${ candidateList.simpleInfo }
										<br><br><br>
										<h4 class="media-heading">후보자 상세정보</h4>
										${ candidateList.detailInfo }
										<br><br><br>
										<h4 class="media-heading">기타사항</h4>
										${ candidateList.etcInfo }
									</div>
								</td>
							</tr>
						</table>
					</li>
		        </c:forEach>
			</ul>
		</div>
	</div>
	<!-- end #content -->
</div>
</body>
</html>