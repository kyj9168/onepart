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
Resident Manager
	<i class="fa fa-2x fa-users"></i><h2 class="text-muted m-l-5">입주민 관리</h2>
	<div align="right">
		<button type="button" class="btn btn-success m-r-4 m-b-4"">선택사항 일괄삭제</button>
	</div>
	<hr>
	<div class="panel-body" align="center">
		<table class="table">
			<thead>
				<tr>
					<th>선택</th>
					<th>회원 고유번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>휴대전화</th>
					<th>이메일</th>
					<th>아파트 동/호 고유번호</th>
					<th>세대원 구분</th>
					<th>등록일자</th>
					<th>권한 코드</th>
					<th>생년월일</th>
					<th>관리자 승인 여부</th>
					<th>성별</th>

				</tr>
			</thead>
			<tbody>
			<c:forEach var="residentList" items="${ list }">
				<tr>
					<td><input type="checkbox" name="" value="" /></td>
					<td>${residentList.residentSeq }</td>
					<td>${residentList.residentId }</td>
					<td>${residentList.residentNm }</td>
					<td>${residentList.residentPhone }</td>
					<td>${residentList.residentEmail }</td>
					<td>${residentList.aptDetailInfoSeq }</td>
					<td>${residentList.householdAuthType }</td> <!-- 세대원구분 -->
					<td>${residentList.residentEnrollDt }</td>
					<td>${residentList.aptAuthCd }</td><!-- 권한코드 -->
					<td>${residentList.residentBirth }</td>
					<td>${residentList.confirmTf }</td>
					<td>${residentList.residentGender }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div align="center">
		<ul class="pagination m-t-0 m-b-10" >
			<li class="disabled"><a href="javascript:;">«</a></li>
			<li class="active"><a href="javascript:;">1</a></li>
			<li><a href="javascript:;">2</a></li>
			<li><a href="javascript:;">3</a></li>
			<li><a href="javascript:;">4</a></li>
			<li><a href="javascript:;">5</a></li>
			<li><a href="javascript:;">»</a></li>
		</ul>
	</div>
	<div align="center">
		<form class="navbar-form full-width" id="">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="검색">
				<button type="submit" class="btn btn-search">
					<span class="fa fa-search"></span>
				</button>
			</div>
		</form>
	</div>
	<script>
	$(function(){
		$("#moveResidentUpdate").data("menu-url", "/onepart/resident/moveResidentUpdate");

		$("#moveResidentUpdate").click(function(){
			var menuUrl = $(this).data("menu-url");
			console.log(menuUrl);

			$.ajax({
				url :menuUrl,
				dataType : "html",
				success:function(result){
					$("#content").html(result);
				}

			});
		});

	});
	</script>
</body>
</html>