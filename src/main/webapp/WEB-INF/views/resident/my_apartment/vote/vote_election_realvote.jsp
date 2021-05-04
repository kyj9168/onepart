<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.jSignature {
		height:300px !important;
	}
</style>
</head>
<body>
<jsp:include page="../vote/vote_include.jsp"></jsp:include>
<jsp:include page="../vote/vote_detail_include.jsp"></jsp:include>
<div style="width:85%; margin:0 auto">
	<table style="width:100%">
		<tr>
			<td>
				<div class="form-group">
                    <h4>후보정보</h4>
                </div>
			</td>
			<td style="width:15%" align="center">
				<c:if test="${ voteUser.voteSeq == null }">
					<span class="badge badge-danger" style="height:28px; font-size:1.25em;">미완료</span>
				</c:if>
				<c:if test="${ voteUser.voteSeq != null }">
					<span class="badge badge-success" style="height:28px; font-size:1.25em;">완료</span>
				</c:if>
			</td>
			<td style="width:15%" align="center">
				<c:if test="${ voteUser.voteSeq == null }">
					<a class="btn btn-success" style="width:100%" data-toggle="modal" id="insertElectionVoteResult">투표완료</a>
				</c:if>
			</td>
		</tr>
	</table>
	<!-- 후보 개개인 정보 div -->
	<div class="panel-body" style="background:white" align="center">
		<div style="width:95%">
			<ul class="media-list media-list-with-divider">
				<c:forEach var="candidateList" items="${ candidateList }">
					<!-- 한후보 정보 div -->
					<li style="margin-bottom:-10px;">
						<table style="width:95%; margin:0 auto;">
							<tr>
								<td style="width:85%"><h4>후보${ candidateList.cndtNo }번 ${ candidateList.residentNm }
								&nbsp;&nbsp;&nbsp; <small style="font-size:1em">${ candidateList.bdNm }동 ${ candidateList.rmNm }호 거주</small></h4></td>
								<td align="right">
									<button class="btn btn-white" style="width:100%" id="" name="choiceBtn" onclick="return noForm();">선택하기</button>
									<input type="hidden" value="${ candidateList.electVoteCndtSignupSeq }">
								</td>
							</tr>
						</table>
					</li>
					<li class="media media-lg" style="padding:15px; margin-top:10px">
						<table style="width:95%; margin:0 auto;">
							<tr>
								<td>
									<a href="javascript:;" class="pull-left">
										<img class="media-object" src="${ contextPath }/resources/uploadFiles/reservation/${ candidateList.changeNm }" alt="" style="height:250px; width:auto;">
									</a>
								</td>
								<td style="width:10%"></td>
								<td>
									<div class="media-body" style="padding-top:1%">
										<h4 class="media-heading">후보자 간단정보</h4>
										${ candidateList.simpleInfo }
										<br><br><br>
										<h4 class="media-heading">후보자 상세정보</h4>
										${ candidateList.detailInfo }
										<br><br><br>
										<h4 class="media-heading">기타사항</h4>
										${ candidateList.etcInfo }
									</div>
								</td>
							</tr>
						</table>
					</li>
		        </c:forEach>
			</ul>
			<input type="hidden" id="modifyCandidateResult">
		</div>
	</div>
</div>
<!-- 서명하기 modal -->
<!-- <div class="modal fade" id="modal-dialog_sign">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">서명하기</h4>
			</div>
			<div class="modal-body">
				<br>
				<div class="signature" style="height:300px; border:1px solid lightgray"></div>
			</div>
			<h5 align="center">마우스 드래그로 서명하세요</h5>
			<br>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" onclick="aa();">서명 및 인증받기</a>
			</div>
		</div>
	</div>
</div> -->
<script type="text/javascript">
	$(function(){
		/* 선택한 후보의 버튼 class 변경하기 */
		$("button[name=choiceBtn]").each(function(){
			$(this).click(function(){
				if($(this).hasClass("btn-white")){
					$("button[name=choiceBtn]").each(function(){
						if($(this).hasClass("btn-success")){
							$(this).addClass("btn-white");
							$(this).removeClass("btn-success");
						}else{

						}
					})
					$(this).removeClass("btn-white");
					$(this).addClass("btn-success");
					$("#modifyCandidateResult").val($(this).parent().children('input[type=hidden]').val())
				}else{
					$(this).addClass("btn-white");
					$(this).removeClass("btn-success");
				}
			});
		});

		/* 선택 후 선거내역 insert하고 이전 페이지로 되돌리는 function */
		$("#insertElectionVoteResult").click(function(){
			var electVoteSeq = $("#electVoteSeq").val();
			var electVoteCndtSignupSeq =$("#modifyCandidateResult").val();
			//var signature = $("#signature").val();

			console.log(electVoteSeq);
			console.log(electVoteCndtSignupSeq);
			//console.log(signature);
			$.ajax({
				url:"/onepart/resident/insertElectionVote",
				type:"get",
				dataType:"html",
				data:{
						electVoteSeq:electVoteSeq,
						electVoteCndtSignupSeq:electVoteCndtSignupSeq
					},
				success:function(result){
					$.ajax({
						url:"/onepart/resident/menuVote",
						dataType:"html",
						success:function(result){
							$("#content").html(result);
						}
					});
				}
			});

		});
	});
</script>
</body>
</html>