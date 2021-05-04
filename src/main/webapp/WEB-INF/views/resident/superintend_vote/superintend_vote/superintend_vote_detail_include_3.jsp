<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${ ev != null }">
	<!-- 선거정보 div -->
	<div style="width:85%; margin:0 auto">
		<!-- title div -->
		<table style="width:100%">
			<c:if test="${ sit != 'offline' }">
				<tr>
					<td>
						<div class="form-group">
		                    <h4>선거정보</h4>
		                </div>
					</td>
					<td style="width:50%"></td>
				</tr>
			</c:if>
		</table>
		<div class="panel-body" style="background:white" align="center">
		<!-- 선거상세정보 div -->
		<table style="width:95%">
			<tr>
				<td><h2>${ ev.electNm }</h2></td>
				<td style="height:25px;">
					<span class="badge badge-primary" style="font-size:1.25em">투표종료</span>
				</td>
				<td style="height:25px;">
					<span class="badge badge-inverse" style="font-size:1.25em">${votePercent}%</span>
				</td>
				<td style="width:5%"></td>
			</tr>
			<tr>
				<td colspan="5"><h5>기간 : ${fn:substring(ev.cnddEnrollStartDt,0,10)} ~ ${fn:substring(ev.cnddEnrollEndDt,0,10)}</h5></td>
			</tr>
			<tr>
				<td colspan="5">
					<div class="form-group">
	                   <label for="exampleInputEmail1" style="font-weight:bold;">상세정보</label>
	                   <p>
	                   		${ ev.electVoteDetail }
	                   </p>
	               </div>
				</td>
			</tr>
		</table>
		</div>
	</div>
	<br><br><br>
</c:if>
<c:if test="${ gv != null }">
	<!-- 선거정보 div -->
	<div style="width:85%; margin:0 auto">
		<!-- title div -->
		<table style="width:100%">
			<c:if test="${ sit != 'offline' }">
				<tr>
					<td>
						<div class="form-group">
		                    <h4>투표정보</h4>
		                </div>
					</td>
					<td style="width:50%"></td>
					<td style="width:15%">
						 <a class="btn btn-success" style="width:100%" onclick="sendMessageResident()">문자발송</a>
					</td>
					<td style="width:1%"></td>
					<td style="width:15%">
						<a class="btn btn-success" style="width:100%" id="offlineVote" href="#modal-dialog_test" data-toggle="modal">오프라인 투표모드 전환</a>
						<input type="hidden" value="${ gv.gnrVoteSeq }" id="electVoteSeq" name="electVoteSeq">
						<input type="hidden" value="${ voteKind }" id="voteKind" name="voteKind">
					</td>
				</tr>
			</c:if>
			<c:if test="${ sit == 'offline' }">
				<tr>
					<td>
						<div class="form-group">
		                    <h4>투표정보</h4>
		                </div>
					</td>
					<td style="width:50%"></td>
					<td style="width:15%">
					</td>
					<td style="width:1%"></td>
					<td style="width:15%">
						<a class="btn btn-success" style="width:100%" id="offlineVote" href="#modal-dialog_test2" data-toggle="modal">오프라인 투표모드 해제</a>
						<input type="hidden" value="${ gv.gnrVoteSeq }" id="electVoteSeq" name="electVoteSeq">
						<input type="hidden" value="${ voteKind }" id="voteKind" name="voteKind">
					</td>
				</tr>
			</c:if>
		</table>
		<div class="panel-body" style="background:white" align="center">
		<!-- 선거상세정보 div -->
		<table style="width:95%">
			<tr>
				<td><h2>${ gv.gnrVoteName }</h2></td>
				<td style="height:25px;">
					<span class="badge badge-primary" style="font-size:1.25em">선거 기간</span>
				</td>
				<td style="height:25px;">
					<span class="badge badge-inverse" style="font-size:1.25em">${votePercent}%</span>
				</td>
				<td style="width:5%"></td>
			</tr>
			<tr>
				<td colspan="5"><h5>기간 : ${fn:substring(gv.gnrVoteStartDt,0,10)} ~ ${fn:substring(gv.gnrVoteEndDt,0,10)}</h5></td>
			</tr>
			<tr>
				<td colspan="5">
					<div class="form-group">
	                   <label for="exampleInputEmail1" style="font-weight:bold;">상세정보</label>
	                   <p>
	                   		${ gv.gnrVoteDetail }
	                   </p>
	               </div>
				</td>
			</tr>
		</table>
		</div>
	</div>
	<br><br><br>
</c:if>
<!-- 후보등록 modal -->
<div class="modal fade" id="modal-dialog_test">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">오프라인 투표모드 전환</h4>
			</div>
			<div class="modal-body" style="text-align:center">
			<br>
				오프라인 투표 모드로 변경하시겠습니까? <br>
				오프라인 투표 외의 모든 기능을 수행할 수 없으며 , <br>
				오프라인 모드를 해제 후에 사용 가능합니다.
			<br>
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" onclick="goOfflineVote();">오프라인 투표모드로</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	/* 오프라인 투표번호 view 전환 */
	function goOfflineVote() {
		console.log("off");
		var electVoteSeq = $("#electVoteSeq").val();
		var voteKind = $("#voteKind").val();
		$.ajax({
			url:"/onepart/resident/changeOffline",
			dataType:"html",
			data:{
					electVoteSeq:electVoteSeq,
					voteKind:voteKind
				},
			success:function(result){
				/* $('#modal-dialog_test').modal("hide"); */
				$('.modal-backdrop').remove();
				$('.modal-open').css("overflow", "visible");
				$("#content").html(result);
			}
		});
	}

	function sendMessageResident() {
		var voteUrl = $(this).data("menu-url");
		var electVoteSeq = $("#electVoteSeq").val();
		var voteKind = $("#voteKind").val();
		console.log("message");
		console.log(electVoteSeq);
		console.log(voteKind);
		$.ajax({
			url:"/onepart/resident/sendMessageResident",
			dataType:"html",
			data:{
					electVoteSeq:electVoteSeq,
					voteKind:voteKind
				 },
			success:function(result){
				$("#content").html(result);
			}
		});
	}

</script>
</body>
</html>