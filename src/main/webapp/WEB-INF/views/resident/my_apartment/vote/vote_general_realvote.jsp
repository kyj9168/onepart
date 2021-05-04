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
					<a class="btn btn-success" style="width:100%" data-toggle="modal" id="insertGeneralVoteResult">투표완료</a>
				</c:if>
				<c:if test="${ voteUser.voteSeq != null }">
					<a class="btn btn-danger" style="width:100%" id="updateGeneralVoteResult">수정완료</a>
				</c:if>
			</td>
		</tr>
	</table>
	<!-- 후보정보 div -->
	<div class="panel-body" style="background:white" align="center">
		<!-- 각 후보정보 div -->
		<div>
			<br>
			<c:if test="${ voteUser.candidateSeq != null }">
				<table style="width:95%">
					<c:forEach var="candidateList" items="${ candidateList }">
						<tr>
							<td style="width:40%; text-align:center;">
								<hr>
								<h4>${ candidateList.cndtNm }</h4>
								<hr>
							</td>
						</tr>
						<tr>
							<td style="width:95%; text-align:center;" >
								<h5>상세정보</h5>
								<p>
									${ candidateList.cndtDetail }
								</p>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${ voteUser.candidateSeq == null }">
				<table style="width:95%">
					<c:forEach var="candidateList" items="${ candidateList }">
						<tr>
							<td style="width:40%; text-align:center;">
								<hr>
								<h4>${ candidateList.cndtNm }</h4>
								<hr>
							</td>
							<td>
								<button class="btn btn-white" style="width:100%" id="" name="choiceBtn" onclick="return noForm();">선택하기</button>
								<input type="hidden" value="${ candidateList.gnrVoteCndtEnrollSeq }">
							</td>
						</tr>
						<tr>
							<td style="width:95%; text-align:center;" >
								<h5>상세정보</h5>
								<p>
									${ candidateList.cndtDetail }
								</p>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
		<input type="hidden" id="modifyCandidateResult">
		<br>
		<br>
	</div>
</div>
<!-- 서명하기 modal -->
<%-- <div class="modal fade" id="modal-dialog_sign">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">서명하기</h4>
			</div>
			<div class="modal-body">
				<div id="signature-pad" class="m-signature-pad">
       	 			<div class="m-signature-pad--body">
		            <canvas></canvas>
				        </div>
				        <div class="m-signature-pad--footer">
				            <div class="description">사인해 주세요~</div>
				            <button type="button" class="button clear" data-action="clear">지우기</button>
				            <button type="button" class="button save" data-action="save">저장</button>
				        </div>
				    </div>
				</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" id="insertGeneralVoteResult">서명 및 인증받기</a>
			</div>
		</div>
	</div>
</div> --%>
<!-- modal include -->
<%-- <jsp:include page="vote_signForm.jsp"/> --%>
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

		/* 선택 후 투표내역 insert하고 이전 페이지로 되돌리는 function */
		$("#insertGeneralVoteResult").click(function(){
			var gnrVoteSeq = $("#gnrVoteSeq").val();
			var gnrVoteCndtEnrollSeq =$("#modifyCandidateResult").val();
			//var signature = $("#signature").val();

			console.log(gnrVoteSeq);
			console.log(gnrVoteCndtEnrollSeq);
			//console.log(signature);
			$.ajax({
				url:"/onepart/resident/insertGeneralVote",
				type:"get",
				dataType:"html",
				data:{
						gnrVoteSeq:gnrVoteSeq,
						gnrVoteCndtEnrollSeq:gnrVoteCndtEnrollSeq
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

	/* 폼전송 방지 function */
	function noForm() {
		return false;
	}
</script>
</body>
</html>