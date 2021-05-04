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
	<div id="content" class="content" style="margin:0 auto;"> 
					<!-- 관리비 사용내역 게시판 div -->
					<h4>관리비 사용내역</h4>
					<div align="right">
						<table>
							<tr>
								<td>
									<select class="form-control input-sm" id="compareSelect">
	                                           <c:forEach var="year" begin="2014" end="2019">
	                                           		<option value='<c:out value="year"></c:out>'>${ year }년</option>
	                                           </c:forEach>
	                                  </select>
								</td>
								<td>
									<select class="form-control input-sm" id="compareSelect">
	                                           <c:forEach var="month" begin="1" end="12">
	                                           		<option value='<c:out value="month"></c:out>'>${ month }월</option>
	                                           </c:forEach>
	                                  </select>
								</td>
							</tr>
						</table>
					</div>
					<div class="panel-body">
                            <table class="table table-hover" style="text-align:center;">
                                <thead>
                                    <tr>
                                        <td style="font-weight:bold; width:50%">년</td>
                                        <td style="font-weight:bold;">월</td>
                                    </tr>
                                </thead>
                                <tbody>
                                   <tr id="useDetailMonth">
                                   		<td>2019년</td>
                                   		<td>8월</td>
                                   </tr>
                                   <tr>
                                   		<td>2019년</td>
                                   		<td>7월</td>
                                   </tr>
                                   <tr>
                                   		<td>2019년</td>
                                   		<td>6월</td>
                                   </tr>
                                   <tr>
                                   		<td>2019년</td>
                                   		<td>5월</td>
                                   </tr>
                                   <tr>
                                   		<td>2019년</td>
                                   		<td>4월</td>
                                   </tr>
                                   <tr>
                                   		<td>2019년</td>
                                   		<td>3월</td>
                                   </tr>
                                   <tr>
                                   		<td>2019년</td>
                                   		<td>2월</td>
                                   </tr>
                                   <tr>
                                   		<td>2019년</td>
                                   		<td>1월</td>
                                   </tr>
                                </tbody>
                            </table>
                        </div>
				</div>
		<!-- end #content -->
</body>
</html>