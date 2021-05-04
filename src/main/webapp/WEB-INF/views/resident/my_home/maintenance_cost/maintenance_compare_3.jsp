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
					<!-- 우리집 관리비 비교 div -->
					<div align="center">
						<form action="">
							<table style="width:100%">
								<tr>
									<td><h4>우리집 관리비 비교</h4></td>
									<td style="width:30%">
										<select class="form-control input-sm" id="compareSelect">
	                                            <option value="month">전월 관리비와 비교</option>
	                                            <option value="m2" selected>동일 평수 관리비와 비교</option>
	                                    </select>
									</td>
								</tr>
							</table>
						</form>
						<br><br>
					</div>
					<!-- 동일평수 사용내역 비교 div -->
					<div class="panel-body">
                            <table class="table table-hover" style="text-align:center;">
                                <thead>
                                    <tr>
                                        <td style="font-weight:bold;">개별 사용료</td>
                                        <td style="font-weight:bold;">우리집 관리비</td>
                                        <td style="font-weight:bold;">동일 평수 평균 관리비</td>
                                        <td style="font-weight:bold;">차액 (+/-)</td>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="costList2" items="${ costList2 }" varStatus="status">
                                	<tr>
										<td>${ costList2.divisionThree }</td>
										<td>
											<fmt:formatNumber value="${ costList2.paymentAmount }" pattern="#,###" />원
										</td>
										<td>
											<fmt:formatNumber value="${ compareCostList[status.index].avgMaintenanceCost }" pattern="#,###" />원
										</td>
										<c:if test="${ costList2.paymentAmount - compareCostList[status.index].avgMaintenanceCost  > 0 }">
										<td style="color:red;">
												<fmt:formatNumber value="${ costList2.paymentAmount - compareCostList[status.index].avgMaintenanceCost }" pattern="#,###" />원
										</td>
										</c:if>
										<c:if test="${ costList2.paymentAmount - compareCostList[status.index].avgMaintenanceCost  <= 0 }">
										<td style="color:blue;">
												<fmt:formatNumber value="${ costList2.paymentAmount - compareCostList[status.index].avgMaintenanceCost }" pattern="#,###" />원
										</td>
										</c:if>
                                	</tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                     	<!-- 그래프 비교 div -->

				</div>
			</div>
		<!-- end #content -->
</body>
</html>