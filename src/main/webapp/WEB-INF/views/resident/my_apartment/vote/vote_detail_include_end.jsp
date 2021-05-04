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
<div style="width:85%; margin:0 auto">
	<table style="width:100%">
		<tr>
			<td>
				<div class="form-group">
                    <h4>투표정보</h4>
                </div>
			</td>
		</tr>
	</table>
<c:if test="${ vote != null }">
	<div class="panel-body" style="background:white" align="center">
	<!-- 상세정보 div -->
		<table style="width:95%; margin:0 auto;">
			<tr>
				<td style="width:70%;"><h3>${ vote.gnrVoteName }</h3>
					<span class="badge badge-primary" style="height:28px; font-size:1.25em;">종료</span>
					<span class="badge badge-inverse" style="height:28px; font-size:1.25em;">${votePercent }%</span>
					<input type="hidden" value="${ vote.gnrVoteSeq }" id="gnrVoteSeq">
				</td>
			</tr>
		</table>
		<table style="margin:0 auto">
			<tr>
				<td>
					<hr>
					<h5>기간 : ${ vote.gnrVoteStartDt } ~ ${ vote.gnrVoteEndDt }</h5>
					<hr>
				</td>
			</tr>
		</table>
		<br>
		<h4>상세정보</h4>
		<p>
			${ vote.gnrVoteDetail }
		</p>
		<br>
	</div>
</c:if>
<c:if test="${ vote2 != null }">
	<div class="panel-body" style="background:white" align="center">
	<!-- 상세정보 div -->
		<table style="width:95%; margin:0 auto;">
			<tr>
				<td style="width:70%;"><h3>${ vote2.electNm }</h3>
					<span class="badge badge-primary" style="height:28px; font-size:1.25em;">종료</span>
					<span class="badge badge-inverse" style="height:28px; font-size:1.25em;">${votePercent }%</span>
					<input type="hidden" value="${ vote2.electVoteSeq }" id="electVoteSeq">
				</td>
			</tr>
		</table>
		<table style="margin:0 auto">
			<tr>
				<td>
					<hr>
					<h5>기간 : ${ vote2.voteStartDt } ~ ${ vote2.voteEndDt }</h5>
					<hr>
				</td>
			</tr>
		</table>
		<br>
		<h4>상세정보</h4>
		<p>
			${ vote2.electVoteDetail }
		</p>
		<br>
	</div>
</c:if>
</div>
<br><br>
</body>
</html>