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

	/* 후보등록기간 메인페이지 */
	$("#votingCandidate").data("menu-url", "/onepart/resident/votingCandidate");
	/* 후보등록 요청 */
	$("#candidateRegistration").data("menu-url", "/onepart/resident/candidateRegistration");
	/* 메세지 전송 */
	$("#applyGo").data("menu-url", "/onepart/resident/votingCandidate");
	/* 후보신청서 관리 */
	//$("#candidateApply").data("menu-url", "/onepart/resident/regicandidateApply");
	/* 후보관리 및 후보등록 */
	$("#candidateSupervise").data("menu-url", "/onepart/resident/candidateSupervise");
	/* 투표기간 메인페이지 */
	$("#votingRealvote").data("menu-url", "/onepart/resident/votingRealvote");
	/* 선거명부인 메세지 전송 */
	//$("#sendMessageResident").data("menu-url", "/onepart/resident/sendMessageResident");
	/* 오프라인 투표모드 전환 */
	$("#changeOffline").data("menu-url", "/onepart/resident/changeOffline");
	/* 선거결과 상세보기 */
	$("#endingCandidate").data("menu-url", "/onepart/resident/endingCandidate");
	/* 투표결과 상세보기 */
	$("#endingGeneral").data("menu-url", "/onepart/resident/endingGeneral");
	/* 후보등록 신청서 상세보기 */
	//$("#candApplyDetail").data("menu-url", "/onepart/resident/candApplyDetail");

	/* 후보등록기간 메인페이지 */
	$("#votingCandidate").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 후보등록 요청 */
	$("#candidateRegistration").click(function(){
		var voteUrl = $(this).data("menu-url");
		var electVoteSeq = $("#electVoteSeq").val()
		$.ajax({
			url:voteUrl,
			dataType:"html",
			data:{electVoteSeq:electVoteSeq},
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 메세지 전송 */
	$("#applyGo").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 후보신청서 관리 */
	/* $("#candidateApply").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	}); */
	/* 후보관리 및 후보등록 */
	$("#candidateSupervise").click(function(){
		var voteUrl = $(this).data("menu-url");
		var electVoteSeq = $("#electVoteSeq").val();
		$.ajax({
			url:voteUrl,
			dataType:"html",
			data:{electVoteSeq:electVoteSeq},
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 투표기간 메인페이지 */
	$("#votingRealvote").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 선거명부인 메세지 전송 */
	$("#sendMessageResident").click(function(){
		var voteUrl = $(this).data("menu-url");
		var electVoteSeq = $("#electVoteSeq").val();
		var voteKind = $("#voteKind").val();
		console.log("message");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			data:{
					electVoteSeq:electVoteSeq,
					voteKind:voteKind
				 },
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 오프라인 투표모드 전환 */
	$("#changeOffline").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 선거결과 상세보기 */
	$("#endingCandidate").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 투표결과 상세보기 */
	$("#endingGeneral").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 후보등록 신청서 상세보기 */
	/* $("#candApplyDetail").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	}); */
});
</script>
<!-- 타이틀 -->
<div style="width:85%; margin:0 auto">
	<br>
	<table style="width:100%; margin-bottom:-10px;">
		<tr>
			<td><h3 style="font-weight:bold;">선거관리 위원회</h3></td>
		</tr>
	</table>
	<br>
</div>
</body>
</html>