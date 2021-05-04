<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<!-- 화면 ajax처리 script -->
<body>
<script type="text/javascript">
$(document).ready(function() {

	/* 우리집 관리비 비교 */
	$("#maintenancecompare").data("menu-url", "/onepart/resident/maintenancecompare");
	/* 관리비 상세보기 */
	$("#maintenancedetail").data("menu-url", "/onepart/resident/maintenancedetail");
	/* 관리비 사용내역 */
	$("#maintenanceuseDetail").data("menu-url", "/onepart/resident/maintenanceuseDetail");
	/* 관리비 납부하기 */
	$("#payment").data("menu-url", "/onepart/resident/payment");
	/* 해당 관리비 사용내역 상세보기 */
	$("#useDetailMonth").data("menu-url", "/onepart/resident/useDetailMonth");

	/* 우리집 관리비 비교 */
	$("#maintenancecompare").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 관리비 상세보기 */
	$("#maintenancedetail").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 관리비 사용내역 */
	$("#maintenanceuseDetail").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 관리비 납부하기 */
	$("#payment").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 해당 관리비 사용내역 상세보기 */
	$("#useDetailMonth").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});

	/* select변화에 따른 servlet호출 script */
	$("#compareSelect").change(function(){
		var result = $(this).val();

		if(result == 'year'){
			$.ajax({
				url:"/onepart/resident/maintenancecompare2",
				dataType:"html",
				success:function(result){
					$("#content").html(result);
				}
			});
		}else if(result == 'month'){
			$.ajax({
				url:"/onepart/resident/maintenancecompare",
				dataType:"html",
				success:function(result){
					$("#content").html(result);
				}
			});
		}else{
			$.ajax({
				url:"/onepart/resident/maintenancecompare3",
				dataType:"html",
				success:function(result){
					$("#content").html(result);
				}
			});
		}
	});
});
</script>
<!-- 타이틀 -->
<div style="width:90%; margin:0 auto">
	<br>
	<table style="width:100%; margin-bottom:-10px;">
		<tr>
			<td><h3 style="font-weight:bold;">우리집 관리비</h3></td>
			<td align="right"><a id="payment" class="btn btn-success" style="width:50%">납부하기</a></td>
		</tr>
	</table>
	<br>
</div>
<!-- 타이틀 div -->
<div style="width:90%; margin:0 auto">
	<div class="panel-body" style="background:white" align="center">
		<table style="width:100%">
			<tr>
				<td><h3 style="margin:auto 0">${fn:substring(loginUser.aptDetailInfoSeq,2,5)}동 ${fn:substring(loginUser.aptDetailInfoSeq,6,9)}호  ${ costList[0].divisionYear } ${ costList[0].divisionMonth }분</h3></td>
			</tr>
		</table>
		<br><br>
		<!-- 기본내역 div -->
		<div>
			<div class="col-md-12 p-0">
				<div class="col-md-6" style="height:250px; border-right:1px solid lightgray;">
					<div style="height:100px; width:80%; margin:auto auto; margin-top:20%;">
					  	<h3 style="font-weight:bold;">당월 납부액</h3>
					  	<h2>
					  		<fmt:formatNumber value="${ costList[0].sumMaintenanceCost }" pattern="#,###" />원
					  	 </h2>
					</div>
				</div>
				<div class="col-md-6" style="height:250px">
					<div style="height:250px; width:80%; margin:auto auto; margin-top:7%;">
					  	<table style="width: 90%; margin-top:17%">
					  		<tr>
					  			<td style="font-weight:bold; font-size:1.8em;">전월 미납 금액</td>
					  			<td style="font-size:1.8em;">0원</td>
					  		</tr>
					  		<tr>
					  			<td style="height:15px"></td>
					  		</tr>
					  		<tr>
					  			<td style="font-weight:bold; font-size:1.8em;">미납 연체료</td>
					  			<td style="font-size:1.8em;">0원</td>
					  		</tr>
					  		<tr>
					  			<td style="height:15px"></td>
					  		</tr>
					  		<tr>
					  			<td style="font-weight:bold; font-size:1.8em;">납부 마감일</td>
					  			<td style="font-size:1.8em;">
					  				${fn:substring(costList[0].paymentEndDt,0,10)}
					  			</td>
					  		</tr>
					  	</table>
					</div>
				</div>
			</div>
		</div>
	  	<br>
	</div>
	<hr>
	<!-- 선택버튼 div -->
	<div>
		<table style="width: 100%; height: 100%; margin: -2% auto;">
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td><a id="maintenancecompare" class="btn btn-danger"
					style="width: 100%">우리집 관리비 비교</a></td>
				<td style="width: 5%"></td>
				<td><a id="maintenancedetail" class="btn btn-danger"
					style="width: 100%">관리비 상세보기</a></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
		</table>
	</div>
	<hr style="width: 100%">
</div>
</body>
</html>