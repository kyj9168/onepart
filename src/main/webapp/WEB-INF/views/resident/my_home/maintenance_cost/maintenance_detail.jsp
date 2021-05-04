<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../maintenance_cost/maintenance_include.jsp"></jsp:include>
<!-- begin #content -->
<div style="width:90%; margin:0 auto">
	<div class="panel-body" style="background:white">
					<!-- 관리비 상세보기 div -->
					<h4>관리비 상세보기</h4>
					<br>
					<div>
						<fieldset>
						<legend>
							<h5>공용관리비</h5>
						</legend>
							<div class="panel-body">
								<table class="table table-hover" style="text-align: center;">
									<tbody>
									<!-- 공용관리비 div -->
									<c:forEach var="costList" items="${ costList }">
										<c:if test="${ costList.divisionOne == '공용관리비' }">
											<tr>
												<td style="width:50%">${ costList.divisionThree }</td>
												<td>
													<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />원
												</td>
											</tr>
										</c:if>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<br>
							<br>
						</fieldset>
						<fieldset>
							<legend>
								<h5>개별 사용료</h5>
							</legend>
							<div class="panel-body">
								<table class="table table-hover" style="text-align: center;">
									<tbody>
										<c:forEach var="costList" items="${ costList }">
										<c:if test="${ costList.divisionOne == '개별사용료' }">
											<tr>
												<td style="width:50%">${ costList.divisionThree }</td>
												<td>
													<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />원
												</td>
											</tr>
										</c:if>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<br>
							<br>
						</fieldset>
						<fieldset>
							<legend>
								<h5>당기수선 충담금</h5>
							</legend>
							<div class="panel-body">
								<table class="table table-hover" style="text-align: center;">
									<tbody>
										<c:forEach var="costList" items="${ costList }">
										<c:if test="${ costList.divisionOne == '장기수선충당금 월부과액' }">
											<tr>
												<td style="width:50%">${ costList.divisionThree }</td>
												<td>
													<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />원
												</td>
											</tr>
										</c:if>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<br>
							<br>
						</fieldset>
						<fieldset>
							<legend>
								<h5>잡수입</h5>
							</legend>
							<div class="panel-body">
								<table class="table table-hover" style="text-align: center;">
									<tbody>
										<c:forEach var="costList" items="${ costList }">
										<c:if test="${ costList.divisionOne == '잡수입' }">
											<tr>
												<td style="width:50%">${ costList.divisionThree }</td>
												<td>
													<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />원
												</td>
											</tr>
										</c:if>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<br>
							<br>
						</fieldset>
					</div>
				</div>
		<!-- end #content -->
	</div>
</body>
</html>