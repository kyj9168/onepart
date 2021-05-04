<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
								<tr>
									<td><br><br><br></td>
								</tr>
								<tr>
									<td></td>
									<td>
										<select class="form-control input-sm" id="compareSelect">
	                                           <c:forEach var="month" begin="1" end="12">
	                                           		<option value='<c:out value="month"></c:out>'>${ month }월</option>
	                                           </c:forEach>
	                                    </select>
									</td>
								</tr>
							</table>
						</form>
						<br>
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
			                                        <td style="font-weight:bold;">3월</td>
			                                        <td style="font-weight:bold;">4월</td>
			                                        <td style="font-weight:bold;">5월</td>
			                                        <td style="font-weight:bold;">6월</td>
			                                        <td style="font-weight:bold;">7월</td>
			                                        <td style="font-weight:bold;">8월</td>
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                   <tr>
			                                   		<td>인건비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>제사무비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>제세공과금</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>피복비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>교육훈련비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>차량유지비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>그 외 부대비용</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>청소비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>경비비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>소독비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>승강기유지비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>수선비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>시설유지비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>안전점검비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>재해예방비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>위탁관리수수료</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
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
			                                        <td style="font-weight:bold;">3월</td>
			                                        <td style="font-weight:bold;">4월</td>
			                                        <td style="font-weight:bold;">5월</td>
			                                        <td style="font-weight:bold;">6월</td>
			                                        <td style="font-weight:bold;">7월</td>
			                                        <td style="font-weight:bold;">8월</td>
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                   <tr>
			                                   		<td>난방비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>급탕비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>가스사용료</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>전기료</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>수도료</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>정화조오물 수수료</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>생활폐기물 수수료</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>입대의 운영비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>건물보험료</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>선관위 운영비</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
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
			                                        <td style="font-weight:bold;">3월</td>
			                                        <td style="font-weight:bold;">4월</td>
			                                        <td style="font-weight:bold;">5월</td>
			                                        <td style="font-weight:bold;">6월</td>
			                                        <td style="font-weight:bold;">7월</td>
			                                        <td style="font-weight:bold;">8월</td>
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                   <tr>
			                                   		<td>월 사용액</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>충당금 잔액</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   </tr>
			                                    <tr>
			                                   		<td>적립요율</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
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
			                                        <td style="font-weight:bold;">3월</td>
			                                        <td style="font-weight:bold;">4월</td>
			                                        <td style="font-weight:bold;">5월</td>
			                                        <td style="font-weight:bold;">6월</td>
			                                        <td style="font-weight:bold;">7월</td>
			                                        <td style="font-weight:bold;">8월</td>
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                   <tr>
			                                   		<td>잡수입</td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
			                                   		<td></td>
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

			        <!-- 장충금 / 잡수입 그래프 div -->

				</div>
		<!-- end #content -->
	</div>
</body>
</html>