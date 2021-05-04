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
	                                            <option value="m2">동일 평수 관리비와 비교</option>
	                                    </select>
									</td>
								</tr>
							</table>
						</form>
						<br><br>
						<!-- 실제 비교표 div -->
						<div class="panel panel-inverse overflow-hidden">
							<div class="panel-heading">
								<h3 class="panel-title">
									<a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false">
									    <i class="fa fa-plus-circle pull-right"></i>
										공용 관리비
									</a>
								</h3>
							</div>
							<div id="collapseOne" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
								<div class="panel-body">
									<div class="panel-body">
			                            <table class="table table-hover" style="text-align:center;">
			                                <thead>
			                                    <tr>
			                                        <td style="font-weight:bold;">상세분류</td>
			                                        <td>${ month - 4 }월</td>
			                                        <td>${ month - 3 }월</td>
			                                        <td>${ month - 2 }월</td>
			                                        <td>${ month - 1 }월</td>
			                                        <td>${ month }월</td>
			                                    </tr>
			                                </thead>
			                                <tbody>
												<tr>
													<td>인건비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '인건비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>제사무비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '제사무비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                    <tr>
													<td>제세공과금</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '제세공과금' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>피복비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '피복비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>교육훈련비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '교육훈련비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>차량유지비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '차량유지비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>그외 부대비용</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '그외 부대비용' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>청소비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '청소비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>경비비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '경비비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>소독비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '소독비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>승강기유지비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '승강기유지비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>수선비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '수선비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>시설유지비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '시설유지비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>안전점검비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '안전점검비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>재해예방비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '재해예방비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
												<tr>
													<td>위탁관리수수료</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '공용관리비' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '위탁관리수수료' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                </tbody>
			                            </table>
			                        </div>
								</div>
							</div>
						</div>
						<div class="panel panel-inverse overflow-hidden">
							<div class="panel-heading">
								<h3 class="panel-title">
									<a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false">
									    <i class="fa fa-plus-circle pull-right"></i>
										개별사용료
									</a>
								</h3>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
								<div class="panel-body">
									<div class="panel-body">
			                            <table class="table table-hover" style="text-align:center;">
			                                <thead>
			                                    <tr>
			                                        <td style="font-weight:bold;">상세분류</td>
			                                        <td>${ month - 4 }월</td>
			                                        <td>${ month - 3 }월</td>
			                                        <td>${ month - 2 }월</td>
			                                        <td>${ month - 1 }월</td>
			                                        <td>${ month }월</td>
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                   <tr>
													<td>난방비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '개별사용료' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '난방비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                    <tr>
													<td>급탕비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '개별사용료' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '급탕비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                    <tr>
													<td>가스사용료</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '개별사용료' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '가스사용료' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                    <tr>
													<td>전기료</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '개별사용료' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '전기료' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                    <tr>
													<td>수도료</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '개별사용료' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '수도료' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                    <tr>
													<td>정화조오물수수료</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '개별사용료' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '정화조오물수수료' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                    <tr>
													<td>생활폐기물수수료</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '개별사용료' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '생활폐기물수수료' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                    <tr>
													<td>입대의 운영비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '개별사용료' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '입대의 운영비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                    <tr>
													<td>건물보험료</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '개별사용료' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '건물보험료' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                    <tr>
													<td>선관위 운영비</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '개별사용료' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '선관위 운영비' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                </tbody>
			                            </table>
			                        </div>
								</div>
							</div>
						</div>
						<div class="panel panel-inverse overflow-hidden">
							<div class="panel-heading">
								<h3 class="panel-title">
									<a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false">
									    <i class="fa fa-plus-circle pull-right"></i>
										장기수선충담금 월 부과액
									</a>
								</h3>
							</div>
							<div id="collapseThree" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
								<div class="panel-body">
									<div class="panel-body">
			                            <table class="table table-hover" style="text-align:center;">
			                                <thead>
			                                    <tr>
			                                        <td style="font-weight:bold;">상세분류</td>
			                                        <td>${ month - 4 }월</td>
			                                        <td>${ month - 3 }월</td>
			                                        <td>${ month - 2 }월</td>
			                                        <td>${ month - 1 }월</td>
			                                        <td>${ month }월</td>
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                   <tr>
													<td>월사용액</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '장기수선충당금 월부과액' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '월사용액' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                    <tr>
													<td>충당금잔액</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '장기수선충당금 월부과액' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '충당금잔액' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                    <tr>
													<td>적립요율</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '장기수선충당금 월부과액' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '적립요율' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
												</tr>
			                                </tbody>
			                            </table>
			                        </div>
								</div>
							</div>
						</div>
						<div class="panel panel-inverse overflow-hidden">
							<div class="panel-heading">
								<h3 class="panel-title">
									<a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false">
									    <i class="fa fa-plus-circle pull-right"></i>
										잡수입
									</a>
								</h3>
							</div>
							<div id="collapseFour" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
								<div class="panel-body">
									<div class="panel-body">
			                            <table class="table table-hover" style="text-align:center;">
			                                <thead>
			                                    <tr>
			                                        <td style="font-weight:bold;">상세분류</td>
			                                        <td>${ month - 4 }월</td>
			                                        <td>${ month - 3 }월</td>
			                                        <td>${ month - 2 }월</td>
			                                        <td>${ month - 1 }월</td>
			                                        <td>${ month }월</td>
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                   <tr>
													<td>잡수입</td>
					                                	<c:forEach var="compareMonthCostList" items="${ compareMonthCostList }">
					                                		<c:if test="${ compareMonthCostList.divisionOne == '잡수입' }">
					                                			<c:if test="${ compareMonthCostList.divisionThree == '잡수입' }">
					                                				<td>
																		<fmt:formatNumber value="${ compareMonthCostList.paymentAmount }" pattern="#,###" />원
																	</td>
					                                			</c:if>
					                                		</c:if>
					                                	</c:forEach>
					                                	<c:forEach var="sumMonthCostList" items="${ sumMonthCostList }" varStatus="status">
															<c:if test="${ sumMonthCostList.divisionOne == '개별사용료' }">
																<input type="hidden" value="${ sumMonthCostList.sumMonthCost }" id="cost1${ sumMonthCostList.divisionMonth }">
															</c:if>
															<c:if test="${ sumMonthCostList.divisionOne == '공용관리비' }">
																<input type="hidden" value="${ sumMonthCostList.sumMonthCost }" id="cost2${ sumMonthCostList.divisionMonth }">
															</c:if>
															<c:if test="${ sumMonthCostList.divisionOne == '잡수입' }">
																<input type="hidden" value="${ sumMonthCostList.sumMonthCost }" id="cost3${ sumMonthCostList.divisionMonth }">
															</c:if>
															<c:if test="${ sumMonthCostList.divisionOne == '장기수선충당금 월부과액' }">
																<input type="hidden" value="${ sumMonthCostList.sumMonthCost }" id="cost4${ sumMonthCostList.divisionMonth }">
															</c:if>
					                                	</c:forEach>
												</tr>
			                                </tbody>
			                            </table>
			                        </div>
								</div>
							</div>
						</div>
					</div>
					<!-- 그래프비교 div -->
					<br>
					<br>
					<!-- 공용관리비 / 개별사용료 그래프 div -->
					<div style="width:100%">
						<table style="width:95%; margin:0 auto">
                           	<tr>
					            <td style="width:45%" align="center"><div id="curve_chart" style="width:100%;"></div></td>
					            <td style="width:45%" align="center"><div id="curve_chart2" style="width:100%;"></div></td>
					        </tr>
					        <tr>
					        	<td style="height:50px"></td>
					        </tr>
					        <tr>
					            <td style="width:45%" align="center"><div id="curve_chart3" style="width:100%;"></div></td>
					            <td style="width:45%" align="center"><div id="curve_chart4" style="width:100%;"></div></td>
					        </tr>
                        </table>
					</div>
					<br>
					<br>
			        <!-- 장충금 / 잡수입 그래프 div -->
		        </div>
		<!-- end #content -->
	</div>
<script type="text/javascript">
	//관리비 통계 그래프
	$(function(){
		google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawChart);

	    function drawChart() {
			//공용 관리비
			var date = new Date();
			var month = date.getMonth();
			var costId1 = '#cost20' + (month-4) + "월";
			var costId2 = '#cost20' + (month-3) + "월";
			var costId3 = '#cost20' + (month-2) + "월";
			var costId4 = '#cost20' + (month-1) + "월";
			var costId5 = '#cost20' + (month) + "월";
			var cost1 = $(costId1).val();
			var cost2 = $(costId2).val();
			var cost3 = $(costId3).val();
			var cost4 = $(costId4).val();
			var cost5 = $(costId5).val();
			console.log(cost1);
	        var data = google.visualization.arrayToDataTable([

	          ['월', '공용관리비'],
	          [(month-4)+'월',  parseInt(cost1)],
	          [(month-3)+'월',  parseInt(cost2)],
	          [(month-2)+'월',  parseInt(cost3)],
	          [(month-1)+'월',  parseInt(cost4)],
	          [month+'월',  parseInt(cost5)],

	        ]);

	        var options = {
	          title: '공용관리비',
	          curveType: 'function',
	          legend: { position: 'bottom' }
	        };

	        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

	        chart.draw(data, options);

	      //개별 사용료
			var date = new Date();
			var month = date.getMonth();
			var costId1 = '#cost10' + (month-4) + "월";
			var costId2 = '#cost10' + (month-3) + "월";
			var costId3 = '#cost10' + (month-2) + "월";
			var costId4 = '#cost10' + (month-1) + "월";
			var costId5 = '#cost10' + (month) + "월";
			var cost1 = $(costId1).val();
			var cost2 = $(costId2).val();
			var cost3 = $(costId3).val();
			var cost4 = $(costId4).val();
			var cost5 = $(costId5).val();
	        var data = google.visualization.arrayToDataTable([

	          ['월', '개별 사용료'],
	          [(month-4)+'월',  parseInt(cost1)],
	          [(month-3)+'월',  parseInt(cost2)],
	          [(month-2)+'월',  parseInt(cost3)],
	          [(month-1)+'월',  parseInt(cost4)],
	          [month+'월',  parseInt(cost5)],

	        ]);

	        var options = {
	          title: '개별 사용료',
	          curveType: 'function',
	          legend: { position: 'bottom' }
	        };

	        var chart = new google.visualization.LineChart(document.getElementById('curve_chart2'));

	        chart.draw(data, options);

	      //장기수선충당금 월 부과액
			var date = new Date();
			var month = date.getMonth();
			var costId1 = '#cost40' + (month-4) + "월";
			var costId2 = '#cost40' + (month-3) + "월";
			var costId3 = '#cost40' + (month-2) + "월";
			var costId4 = '#cost40' + (month-1) + "월";
			var costId5 = '#cost40' + (month) + "월";
			var cost1 = $(costId1).val();
			var cost2 = $(costId2).val();
			var cost3 = $(costId3).val();
			var cost4 = $(costId4).val();
			var cost5 = $(costId5).val();
	        var data = google.visualization.arrayToDataTable([

	          ['월', '장기수선충당금 월 부과액'],
	          [(month-4)+'월',  parseInt(cost1)],
	          [(month-3)+'월',  parseInt(cost2)],
	          [(month-2)+'월',  parseInt(cost3)],
	          [(month-1)+'월',  parseInt(cost4)],
	          [month+'월',  parseInt(cost5)],

	        ]);

	        var options = {
	          title: '장기수선충당금 월 부과액',
	          curveType: 'function',
	          legend: { position: 'bottom' }
	        };

	        var chart = new google.visualization.LineChart(document.getElementById('curve_chart3'));

	        chart.draw(data, options);

	      //잡수입
			var date = new Date();
			var month = date.getMonth();
			var costId1 = '#cost30' + (month-4) + "월";
			var costId2 = '#cost30' + (month-3) + "월";
			var costId3 = '#cost30' + (month-2) + "월";
			var costId4 = '#cost30' + (month-1) + "월";
			var costId5 = '#cost30' + (month) + "월";
			var cost1 = $(costId1).val();
			var cost2 = $(costId2).val();
			var cost3 = $(costId3).val();
			var cost4 = $(costId4).val();
			var cost5 = $(costId5).val();
	        var data = google.visualization.arrayToDataTable([

	          ['월', '잡수입'],
	          [(month-4)+'월',  parseInt(cost1)],
	          [(month-3)+'월',  parseInt(cost2)],
	          [(month-2)+'월',  parseInt(cost3)],
	          [(month-1)+'월',  parseInt(cost4)],
	          [month+'월',  parseInt(cost5)],

	        ]);

	        var options = {
	          title: '잡수입',
	          curveType: 'function',
	          legend: { position: 'bottom' }
	        };

	        var chart = new google.visualization.LineChart(document.getElementById('curve_chart4'));

	        chart.draw(data, options);
	    }
	});

</script>
</body>
</html>