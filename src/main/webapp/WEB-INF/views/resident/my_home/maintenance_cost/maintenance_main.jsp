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
<style type="text/css">
	#fontTest *:not(h1):not(h2):not(h3):not(h4):not(h5), .table-hover * {
		font-size: 14px;
	}

</style>
</head>
<jsp:include page="../maintenance_cost/maintenance_include.jsp"></jsp:include>
<body>
<div style="width:90%; margin:0 auto">
	<div class="panel-body" style="background:white">
		<!-- 개별 사용내역 div-->
		<h4>개별 사용내역</h4>
	    <table class="table table-hover" style="text-align:center;">
	        <thead>
	            <tr>
	                <td style="font-weight:bold;">개별 사용료 종류</td>
	                <td style="font-weight:bold;">금액 (원)</td>
	            </tr>
	        </thead>
	        <tbody>
	        	<c:forEach var="costList" items="${ costList }">
	        		<c:if test="${ costList.divisionOne == '개별사용료' }">
	        			<c:if test="${ costList.divisionThree == '난방비' }">
	        				<tr>
				           		<td>${ costList.divisionThree }</td>
				           		<td>
				           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
				           		</td>
				           </tr>
	        			</c:if>
	        			<c:if test="${ costList.divisionThree == '급탕비' }">
	        				<tr>
				           		<td>${ costList.divisionThree }</td>
				           		<td>
				           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
				           		</td>
				           </tr>
	        			</c:if>
	        			<c:if test="${ costList.divisionThree == '가스사용료' }">
	        				<tr>
				           		<td>${ costList.divisionThree }</td>
				           		<td>
				           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
				           		</td>
				           </tr>
	        			</c:if>
	        			<c:if test="${ costList.divisionThree == '전기료' }">
	        				<tr>
				           		<td>${ costList.divisionThree }</td>
				           		<td>
				           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
				           		</td>
				           </tr>
	        			</c:if>
	        			<c:if test="${ costList.divisionThree == '수도료' }">
	        				<tr>
				           		<td>${ costList.divisionThree }</td>
				           		<td>
				           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
				           		</td>
				           </tr>
	        			</c:if>
	        		</c:if>
	        	</c:forEach>
	        </tbody>
	    </table>
	</div>
	<br><br>
	<div class="panel-body" style="background:white" id="fontTest">
		<!-- 납입관리 div -->
                    <h4>납입 관리</h4>
                    <div align="center">
                    	<table>
                    		<tr>
                    			<td>
                    				<!-- 납입의뢰서(은행용) div -->
                    				<div>
                    					<fieldset>
                    						<legend><h5>납입의뢰서(은행용)</h5></legend>
                    							<div class="panel-body">
												<table class="table table-hover" style="text-align: center;">
													<tbody>
														<tr>
															<td>당월 부과액</td>
															<td>
																<fmt:formatNumber value="${ costList[0].sumMaintenanceCost }" pattern="#,###" />
															</td>
														</tr>
														<tr>
															<td>할인 총계</td>
															<td>0</td>
														</tr>
														<tr>
															<td>미납금액</td>
															<td>0</td>
														</tr>
														<tr>
															<td>미납 연체료</td>
															<td>0</td>
														</tr>
													</tbody>
												</table>
											</div>
											<br><br>
											<div class="panel-body">
												<table class="table table-hover" style="text-align: center;">
													<tbody>
														<tr>
															<td>납기 내 금액</td>
															<td>
																<fmt:formatNumber value="${ costList[0].sumMaintenanceCost }" pattern="#,###" />
															</td>
														</tr>
														<tr>
															<td>납기 후 연체료</td>
															<td>
																<fmt:formatNumber value="${ costList[0].sumMaintenanceCost * 0.02 }" pattern="#,###" />
															</td>
														</tr>
														<tr>
															<td>납기 후 금액</td>
															<td>
																<fmt:formatNumber value="${ costList[0].sumMaintenanceCost + costList[0].sumMaintenanceCost * 0.02 }" pattern="#,###" />
															</td>
														</tr>
														<tr>
															<td>납부 기한</td>
															<td>
																${fn:substring(costList[0].paymentEndDt,0,10)}
															</td>
														</tr>
													</tbody>
												</table>
											</div>
                    					</fieldset>
								</div>
                    			</td>
                    			<td style="width:5%; border-right:1px solid lightgray">

                    			</td>
                    			<td style="width:5%">

                    			</td>
                    			<td>
                    				<!-- 납입영수증(입주자용) div -->
                    				<div>
                    					<fieldset>
                    						<legend><h5>납입 영수증(입주자용)</h5></legend>
                    						<table>
                    						<tr>
                    							<td>
                    								<!-- 사용요금 div -->
                    								<table>
                    									<tr>
                    										<td>
                    											<div class="panel-body">
																<table class="table table-bordered">
																	<tbody>
																		<c:forEach var="costList" items="${ costList }">
																			<c:if test="${ costList.divisionThree == '난방비' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
														        			<c:if test="${ costList.divisionThree == '급탕비' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
														        			<c:if test="${ costList.divisionThree == '가스사용료' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
														        			<c:if test="${ costList.divisionThree == '전기료' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
														        			<c:if test="${ costList.divisionThree == '수도료' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
                    										</td>
                    									</tr>
                    									<tr>
                    										<td>
                    											<div class="panel-body">
																<table class="table table-bordered">
																	<tbody>
																		<c:forEach var="costList" items="${ costList }">
																			<c:if test="${ costList.divisionThree == '급탕비' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
														        			<c:if test="${ costList.divisionThree == '가스사용료' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
														        			<c:if test="${ costList.divisionThree == '전기료' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
														        			<c:if test="${ costList.divisionThree == '수도료' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
                    										</td>
                    									</tr>
                    									<tr>
                    										<td>
                    											<div class="panel-body">
																<table class="table table-bordered">
																	<tbody>
																		<c:forEach var="costList" items="${ costList }">
																			<c:if test="${ costList.divisionThree == '정화조오물수수료' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
														        			<c:if test="${ costList.divisionThree == '생활폐기물수수료' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
														        			<c:if test="${ costList.divisionThree == '입대의 운영비' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
														        			<c:if test="${ costList.divisionThree == '건물보험료' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
														        			<c:if test="${ costList.divisionThree == '선관위 운영비' }">
														        				<tr>
																	           		<td>${ costList.divisionThree }</td>
																	           		<td>
																	           			<fmt:formatNumber value="${ costList.paymentAmount }" pattern="#,###" />
																	           		</td>
																	           </tr>
														        			</c:if>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
                    										</td>
                    									</tr>
                    								</table>
											</td>
                    							<td>
                    								<!-- 금액부과 div -->
                    								<table>
                    									<tr>
                    										<td>
                    											<div class="panel-body">
									                            <table class="table table-hover" style="text-align:center;">
									                                <tbody>
									                                   <tr>
									                                   		<td>당월 부과액</td>
									                                   		<td>
									                                   			<fmt:formatNumber value="${ costList[0].sumMaintenanceCost }" pattern="#,###" />
									                                   		</td>
									                                   </tr>
									                                   <tr>
									                                   		<td>할인총계</td>
									                                   		<td>0</td>
									                                   </tr>
									                                   <tr>
									                                   		<td>미납금액</td>
									                                   		<td>0</td>
									                                   </tr>
									                                   <tr>
									                                   		<td>미납 연체료</td>
									                                   		<td>0</td>
									                                   </tr>
									                                </tbody>
									                            </table>
                       										</div>
                    										</td>
                    									</tr>
                    									<tr>
                    										<td>
                    											<div class="panel-body">
									                            <table class="table table-hover" style="text-align:center;">
									                                <tbody>
									                                   <tr>
																			<td>납기 내 금액</td>
																			<td>
																				<fmt:formatNumber value="${ costList[0].sumMaintenanceCost }" pattern="#,###" />
																			</td>
																		</tr>
																		<tr>
																			<td>납기 후 연체료</td>
																			<td>
																				<fmt:formatNumber value="${ costList[0].sumMaintenanceCost * 0.02 }" pattern="#,###" />
																			</td>
																		</tr>
																		<tr>
																			<td>납기 후 금액</td>
																			<td>
																				<fmt:formatNumber value="${ costList[0].sumMaintenanceCost + costList[0].sumMaintenanceCost * 0.02 }" pattern="#,###" />
																			</td>
																		</tr>
																		<tr>
																			<td>납부 기한</td>
																			<td>
																				${fn:substring(costList[0].paymentEndDt,0,10)}
																			</td>
																		</tr>
									                                </tbody>
									                            </table>
                       										</div>
                    										</td>
                    									</tr>
                    								</table>
                    							</td>
                    						</tr>
                    					</table>
                    					</fieldset>
                    				</div>
                    			</td>
                    		</tr>
                    	</table>
                    </div>
	</div>
</div>


</body>
</html>