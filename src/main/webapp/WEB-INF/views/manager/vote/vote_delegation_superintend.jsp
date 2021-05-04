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
<!-- 후보관리 및 후보등록 div -->
<div style="width:85%; margin:0 auto">
	<!-- title div -->
	<table style="width:100%">
		<tr>
			<td>
				<div class="form-group">
                    <h4>선관위 선임 및 해임</h4>
                </div>
			</td>
			<td></td>
			<td style="width:15%">
				<a class="btn btn-success" style="width:100%" id="superintendApply">새 위원 선임</a>
			</td>
		</tr>
	</table>
	<!-- 등록된 후보 리스트 div -->
	<div>
		<div class="panel-body" style="background:white" align="center">
		<!-- 임기 입력 div -->
<!-- 			<table class="table table-hover" style="text-align: center; width:100%">
				<tr>
					<td><h4>임기 (기본2년)</h4></td>

					<td style="width:40%"><input type="date" style="width:100%"></td>
					<td><h4> &nbsp;~ </h4></td>
					<td style="width:40%"><input type="date" style="width:100%"></td>
				</tr>
			</table> -->
			<!-- 선관위 위원 div -->
			<div>
				<table class="table table-hover" style="text-align: center; width:100%">
					<thead>
                       <tr>
                           <th class="text-center">No</th>
                           <th class="text-center">직위</th>
                           <th class="text-center">이름</th>
                           <th class="text-center">거주 세대</th>
                           <th class="text-center">수정</th>
                           <th class="text-center">해임</th>
                       </tr>
                     </thead>
                     <tbody>
                       <c:forEach var="superintendList" items="${ superintendList }">
                       <tr>
                       		<td>${ superintendList.residentSeq }</td>
                       		<c:if test="${ superintendList.aptAuthCd == 5 }">
	                       		<td>위원장</td>
                       		</c:if>
                       		<c:if test="${ superintendList.aptAuthCd == 6 }">
	                       		<td>위원</td>
                       		</c:if>
                       		<td>${ superintendList.residentNm }</td>
                       		<c:set var="dong" value="${fn:substring(superintendList.aptDetailInfoSeq,2,5)}"></c:set>
                       		<c:set var="ho" value="${fn:substring(superintendList.aptDetailInfoSeq,6,9)}"></c:set>
                       		<td>${ dong }동 ${ ho }호</td>
                       		<td>
                       			<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                       		</td>
                       		<td>
                       			<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                       		</td>
                       </tr>
                       </c:forEach>
                     </tbody>
				</table>
			</div>
		</div>
		<br><br>
		<!-- 위원선임 div -->
	</div>
</div>

</body>
</html>