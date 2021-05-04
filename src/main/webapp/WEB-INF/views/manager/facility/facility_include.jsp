<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 화면 ajax처리 script -->
<script type="text/javascript">
	$(document).ready(function() {

		/* 새 시설물 등록 (예약) */
		$("#newFacility_general").data("menu-url", "/onepart/manager/newFacility_general");
		/* 새 시설물 등록 (좌석) */
		$("#newFacility_seat").data("menu-url", "/onepart/manager/newFacility_seat");
		/* 시설물 수정 (예약) */
		$("#facility_modify_general").data("menu-url", "/onepart/manager/facility_modify_general");
		/* 시설물 수정 (좌석) */
		$("#facility_modify_seat").data("menu-url", "/onepart/manager/facility_modify_seat");

		/* 시설물 예약 상세보기 */
		$("#facility_reservationDetail").click(function(){
			var voteUrl = $(this).data("menu-url");
			$.ajax({
				url:voteUrl,
				dataType:"html",
				success:function(result){
					$("#content").html(result);
				}
			});
		});
		/* 새 시설물 등록 (예약) */
		$("#newFacility_general").click(function(){
			var voteUrl = $(this).data("menu-url");
			$.ajax({
				url:voteUrl,
				dataType:"html",
				success:function(result){
					$("#content").html(result);
				}
			});
		});
		/* 새 시설물 등록 (좌석) */
		$("#newFacility_seat").click(function(){
			var voteUrl = $(this).data("menu-url");
			$.ajax({
				url:voteUrl,
				dataType:"html",
				success:function(result){
					$("#content").html(result);
				}
			});
		});
		/* 시설물 수정 (예약) */
		$("#facility_modify_general").click(function(){
			var voteUrl = $(this).data("menu-url");
			$.ajax({
				url:voteUrl,
				dataType:"html",
				success:function(result){
					$("#content").html(result);
				}
			});
		});
		/* 시설물 수정 (좌석) */
		$("#facility_modify_seat").click(function(){
			var voteUrl = $(this).data("menu-url");
			$.ajax({
				url:voteUrl,
				dataType:"html",
				success:function(result){
					$("#content").html(result);
				}
			});
		});
	});

	/* 시설물 예약 상세보기 */
	function detailReservation(facRsrvSeq) {
		console.log(facRsrvSeq);
		$.ajax({
			url:"/onepart/manager/facility_reservationDetail",
			dataType:"html",
			data:{facRsrvSeq:facRsrvSeq},
			success:function(result){
				$("#content").html(result);
			}
		});
	}
</script>
<!-- 타이틀 -->
<div style="width:85%; margin:0 auto">
	<br>
	<table style="width:100%; margin-bottom:-10px;">
		<tr>
			<td><h2>시설물 관리</h2></td>
			<td style="width:30%"><a id="newFacility_general" class="btn btn-success " style="width:100%; margin-bottom:-10px;">새 시설물 등록&nbsp;(예약)</a></td>
			<td style="width:5%"></td>
			<td style="width:30%"><a id="newFacility_seat" class="btn btn-success" style="width:100%; margin-bottom:-10px;">새 시설물 등록&nbsp;(좌석)</a></td>
		</tr>
	</table>
	<hr>
	<br>
</div>
</body>
</html>