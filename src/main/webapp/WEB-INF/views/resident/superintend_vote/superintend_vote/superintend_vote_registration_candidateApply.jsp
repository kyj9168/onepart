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
<jsp:include page="../superintend_vote/superintend_vote_include.jsp"></jsp:include>
<jsp:include page="../superintend_vote/superintend_vote_detail_include.jsp"></jsp:include>
<!-- 후보신청서 관리 div -->
<div style="width:85%; margin:0 auto">
	<!-- title div -->
	<table style="width:95%">
		<tr>
			<td>
				<div class="form-group">
                    <h4>후보신청서 관리</h4>
                </div>
			</td>
		</tr>
	</table>
	<!-- 신청서 리스트 div -->
	<div class="panel-body" style="background:white" align="center">
		<div class="panel-body">
			<table class="table table-hover" style="text-align: center;">
				<thead>
					<tr>
						<td style="font-weight: bold;">No</td>
						<td style="font-weight: bold;">제목</td>
						<td style="font-weight: bold;">후보구분</td>
						<td style="font-weight: bold;">작성자</td>
						<td style="font-weight: bold;">제출일</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="candidateApplyList" items="${ candidateApplyList }">
						<tr onclick="detailCandidateApply(${ candidateApplyList.electVoteCndtSignupSeq })">
							<td>${ candidateApplyList.electVoteCndtSignupSeq }</td>
							<td>${ candidateApplyList.residentNm }님의 후보자 등록신청서</td>
							<td>${ ev.electNm }</td>
							<td>${ candidateApplyList.residentNm }</td>
							<td>${ candidateApplyList.cndtSignupDt }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
	/* 후보 신청서 상세보기 function */
	function detailCandidateApply(electVoteCndtSignupSeq) {
		var electVoteCndtSignupSeq = electVoteCndtSignupSeq;
		var electVoteSeq = $("#electVoteSeq").val();
		$.ajax({
			url:"/onepart/resident/candApplyDetail",
			dataType:"html",
			data:{
					electVoteSeq:electVoteSeq,
					electVoteCndtSignupSeq:electVoteCndtSignupSeq
				 },
			success:function(result){
				$("#content").html(result);
			}
		});
	}
</script>
</body>
</html>