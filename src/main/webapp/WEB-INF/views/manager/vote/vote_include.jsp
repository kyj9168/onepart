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

	/* 진행중인 선거보기 */
	$("#detailvote_candidate").data("menu-url", "/onepart/manager/detailvote_candidate");
	/* 진행중인 투표보기 */
	$("#detailvote_general").data("menu-url", "/onepart/manager/detailvote_general");
	/* 완료된 선거보기 */
	$("#endvote_candidate").data("menu-url", "/onepart/manager/endvote_candidate");
	/* 완료된 투표보기 */
	$("#endvote_general").data("menu-url", "/onepart/manager/endvote_general");
	/* 선관위 선임 맻 해임 */
	$("#delegationSuperintend").data("menu-url", "/onepart/manager/delegationSuperintend");

	/* 진행중인 선거보기 */
	$("#detailvote_candidate").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 진행중인 투표보기 */
	$("#detailvote_general").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 완료된 선거보기 */
	$("#endvote_candidate").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 완료된 투표보기 */
	$("#endvote_general").click(function(){
		var voteUrl = $(this).data("menu-url");
		$.ajax({
			url:voteUrl,
			dataType:"html",
			success:function(result){
				$("#content").html(result);
			}
		});
	});
	/* 선관위 선임 맻 해임 */
	$("#delegationSuperintend").click(function(){
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
</script>

<!-- 타이틀 -->
<div style="width:85%; margin:0 auto">
	<h3 style="font-weight:bold;">우리 아파트 투표</h3>
</div>
</body>
</html>