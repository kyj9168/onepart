<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#tableArea, #searchArea{
		background:white;
		margin-left: 9%;
		margin-right: 9%;
		margin-bottom : 5%;
	}

	#titleArea {
		margin-left: 9%;
		margin-right: 9%;
		margin-bottom : 1%;
	}


	tbody > tr:hover{
		background:#00acac;
	}

	.pageingBtnArea {
		text-align: center;
	}

	.table {
	}

	thead th {
	}

	.badge {
		font-size: 1.5em;
	}

	.panel-body {
		height: 520px;
	}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	$(function(){
		/* 진행 중 리스트 가져오기 */
		getIngSurveyList();
		/* 진행 예정 리스트 가져오기 */
		getexpectedSurveyList();
		/* 종료 리스트 가져오기 */
		getfinishSurveyList();
	});

	/* 진행 중 리스트 가져오기 */
	function getIngSurveyList(currentPage) {

		$.ajax({
			url : 'selectIngSurvey',
			type : 'post',
			data : {currentPage:currentPage},
			async: false,
			dataType: 'json',
			success : function(result){
				console.log('selectIngSurvey succ');
				console.log(result);

				var ingSurveyVOList = result.ingSurveyVOList;
				var pi = result.pi;

				var tableTbody = $('#ingSurveyList tbody');
				tableTbody.children().remove();

				/* 테이블 값 입력 */
				for(var i in ingSurveyVOList){
					var $tr = $('<tr/>');
					var $surveySeqTd = $('<td/>', {text:ingSurveyVOList[i].surveySeq});
					var $surveyTitleTd = $('<td/>', {text:ingSurveyVOList[i].surveyTitle});
					var $surveyStatusTd = $('<td/>', {text:'진행 중'});

					var $surveyTypeTd;
					if(ingSurveyVOList[i].surveyType == 1){
						$surveyTypeTd = $('<td/>', {text:'일반 설문'});
					} else if(ingSurveyVOList[i].surveyType == 2){
						$surveyTypeTd = $('<td/>', {text:'세대별 설문'});
					}

					var $prtcptTfTd;
					if(ingSurveyVOList[i].residentSeq == 0){
						$prtcptTfTd = $('<td/>', {text:"미참여", style:"color:red;"});
					} else {
						$prtcptTfTd = $('<td/>', {text:"참여 완료"});
					}

					var $surveyPeriodTd = $('<td/>', {text:ingSurveyVOList[i].surveyPeriod});

					$tr.append($surveySeqTd);
					$tr.append($surveyTitleTd);
					$tr.append($surveyStatusTd);
					$tr.append($surveyTypeTd);
					$tr.append($prtcptTfTd);
					$tr.append($surveyPeriodTd);

					tableTbody.append($tr);

				}

				/* 페이징 버튼 값 입력 */

				var ingSurveyListPagination = $('#ingSurveyListPagination')
				ingSurveyListPagination.children().remove();

				var $firstLi;
				var $firstA;
				if(pi.currentPage <= 1){
					$firstLi = $('<li>', {class:'disabled'});
					$firstA = $('<a>', {html:'<<'});
					$firstLi.append($firstA);
				} else {
					$firstLi = $('<li>');
					$firstA = $('<a>', {html:'<<', href:'javascript:getIngSurveyList(1);'});
					$firstLi.append($firstA);
				}

				ingSurveyListPagination.append($firstLi);
				//getIngSurveyList
				for(var p=pi.startPage; p<=pi.endPage; p++){

					var $repeatLi;
					var $repeatA;

					if(p == pi.currentPage) {
						$repeatLi = $('<li>', {class:"active"});
						$repeatA = $('<a>', {html:p});
						$repeatLi.append($repeatA);
					}
					if(p != pi.currentPage) {
						$repeatLi = $('<li>');
						$repeatA = $('<a>', {html:p, href:'javascript:getIngSurveyList('+p+');'});
						$repeatLi.append($repeatA);
					}
					ingSurveyListPagination.append($repeatLi);

				} // end for

				var $listLi;
				var $listA;
				if(pi.currentPage < pi.maxPage){
					$listLi = $('<li>');
					$listA = $('<a>', {html:'>>', href:'javascript:getIngSurveyList('+pi.maxPage+');'});
					$listLi.append($listA);
				} else {
					$listLi = $('<li>', {class:'disabled'});
					$listA = $('<a>', {html:'>>'});
					$listLi.append($listA);
				}
				ingSurveyListPagination.append($listLi);
			},
			error : function(error){
				console.log("error");
			}
		});
	}

	/* 진행 예정 리스트 가져오기 */
	function getexpectedSurveyList(currentPage) {

		$.ajax({
			url : 'selectexpectedSurvey',
			type : 'post',
			data : {currentPage:currentPage},
			async: false,
			dataType: 'json',
			success : function(result){
				console.log('selectexpectedSurvey succ');
				console.log(result);

				var expectedSurveyVOList = result.expectedSurveyVOList;
				var pi = result.pi;

				var tableTbody = $('#expectedSurveyList tbody');
				tableTbody.children().remove();

				/* 테이블 값 입력 */
				for(var i in expectedSurveyVOList){
					var $tr = $('<tr/>');
					var $surveySeqTd = $('<td/>', {text:expectedSurveyVOList[i].surveySeq});
					var $surveyTitleTd = $('<td/>', {text:expectedSurveyVOList[i].surveyTitle});
					var $surveyStatusTd = $('<td/>', {text:'진행 예정'});
					var $surveyTypeTd;
					if(expectedSurveyVOList[i].surveyType == 1){
						$surveyTypeTd = $('<td/>', {text:'일반 설문'});
					} else if(expectedSurveyVOList[i].surveyType == 2){
						$surveyTypeTd = $('<td/>', {text:'세대별 설문'});
					}

					var $prtcptTfTd;
					if(expectedSurveyVOList[i].residentSeq == 0){
						$prtcptTfTd = $('<td/>', {text:"미참여"});
					} else {
						$prtcptTfTd = $('<td/>', {text:"참여 완료"});
					}

					var $surveyPeriodTd = $('<td/>', {text:expectedSurveyVOList[i].surveyPeriod});

					$tr.append($surveySeqTd);
					$tr.append($surveyTitleTd);
					$tr.append($surveyStatusTd);
					$tr.append($surveyTypeTd);
					$tr.append($prtcptTfTd);
					$tr.append($surveyPeriodTd);


					tableTbody.append($tr);

				}

				/* 페이징 버튼 값 입력 */

				var expectedSurveyListPagination = $('#expectedSurveyListPagination');
				expectedSurveyListPagination.children().remove();

				var $firstLi;
				var $firstA;
				if(pi.currentPage <= 1){
					$firstLi = $('<li>', {class:'disabled'});
					$firstA = $('<a>', {html:'<<'});
					$firstLi.append($firstA);
				} else {
					$firstLi = $('<li>');
					$firstA = $('<a>', {html:'<<', href:'javascript:getexpectedSurveyList(1);'});
					$firstLi.append($firstA);
				}

				expectedSurveyListPagination.append($firstLi);
				//getIngSurveyList
				for(var p=pi.startPage; p<=pi.endPage; p++){

					var $repeatLi;
					var $repeatA;

					if(p == pi.currentPage) {
						$repeatLi = $('<li>', {class:"active"});
						$repeatA = $('<a>', {html:p});
						$repeatLi.append($repeatA);
					}
					if(p != pi.currentPage) {
						$repeatLi = $('<li>');
						$repeatA = $('<a>', {html:p, href:'javascript:getexpectedSurveyList('+p+');'});
						$repeatLi.append($repeatA);
					}
					expectedSurveyListPagination.append($repeatLi);

				} // end for

				var $listLi;
				var $listA;
				if(pi.currentPage < pi.maxPage){
					$listLi = $('<li>');
					$listA = $('<a>', {html:'>>', href:'javascript:getexpectedSurveyList('+pi.maxPage+');'});
					$listLi.append($listA);
				} else {
					$listLi = $('<li>', {class:'disabled'});
					$listA = $('<a>', {html:'>>'});
					$listLi.append($listA);
				}
				expectedSurveyListPagination.append($listLi);
			},
			error : function(error){
				console.log("error");
			}
		});
	}

	/* 종료 리스트 가져오기 */
	function getfinishSurveyList(currentPage) {

		$.ajax({
			url : 'selectfinishSurvey',
			type : 'post',
			data : {currentPage:currentPage},
			async: false,
			dataType: 'json',
			success : function(result){
				console.log('finishSurveyList succ');
				console.log(result);

				var finishSurveyVOList = result.finishSurveyVOList;
				var pi = result.pi;

				var tableTbody = $('#finishSurveyList tbody');
				tableTbody.children().remove();

				/* 테이블 값 입력 */
				for(var i in finishSurveyVOList){
					var $tr = $('<tr/>');
					var $surveySeqTd = $('<td/>', {text:finishSurveyVOList[i].surveySeq});
					var $surveyTitleTd = $('<td/>', {text:finishSurveyVOList[i].surveyTitle});

					var $surveyStatusTd = $('<td/>', {text:'종료'});


					var $surveyTypeTd;
					if(finishSurveyVOList[i].surveyType == 1){
						$surveyTypeTd = $('<td/>', {text:'일반 설문'});
					} else if(finishSurveyVOList[i].surveyType == 2){
						$surveyTypeTd = $('<td/>', {text:'세대별 설문'});
					}


					var $prtcptTfTd;
					if(finishSurveyVOList[i].residentSeq == 0){
						$prtcptTfTd = $('<td/>', {text:"미참여"});
					} else {
						$prtcptTfTd = $('<td/>', {text:"참여 완료"});
					}

					var $surveyPeriodTd = $('<td/>', {text:finishSurveyVOList[i].surveyPeriod});

					$tr.append($surveySeqTd);
					$tr.append($surveyTitleTd);
					$tr.append($surveyStatusTd);
					$tr.append($surveyTypeTd);
					$tr.append($prtcptTfTd);
					$tr.append($surveyPeriodTd);


					tableTbody.append($tr);

				}

				/* 페이징 버튼 값 입력 */

				var finishSurveyListPagination = $('#finishSurveyListPagination');
				finishSurveyListPagination.children().remove();

				var $firstLi;
				var $firstA;
				if(pi.currentPage <= 1){
					$firstLi = $('<li>', {class:'disabled'});
					$firstA = $('<a>', {html:'<<'});
					$firstLi.append($firstA);
				} else {
					$firstLi = $('<li>');
					$firstA = $('<a>', {html:'<<', href:'javascript:getfinishSurveyList(1);'});
					$firstLi.append($firstA);
				}

				finishSurveyListPagination.append($firstLi);
				//getIngSurveyList
				for(var p=pi.startPage; p<=pi.endPage; p++){

					var $repeatLi;
					var $repeatA;

					if(p == pi.currentPage) {
						$repeatLi = $('<li>', {class:"active"});
						$repeatA = $('<a>', {html:p});
						$repeatLi.append($repeatA);
					}
					if(p != pi.currentPage) {
						$repeatLi = $('<li>');
						$repeatA = $('<a>', {html:p, href:'javascript:getfinishSurveyList('+p+');'});
						$repeatLi.append($repeatA);
					}
					finishSurveyListPagination.append($repeatLi);

				} // end for

				var $listLi;
				var $listA;
				if(pi.currentPage < pi.maxPage){
					$listLi = $('<li>');
					$listA = $('<a>', {html:'>>', href:'javascript:getfinishSurveyList('+pi.maxPage+');'});
					$listLi.append($listA);
				} else {
					$listLi = $('<li>', {class:'disabled'});
					$listA = $('<a>', {html:'>>'});
					$listLi.append($listA);
				}
				finishSurveyListPagination.append($listLi);
			},
			error : function(error){
				console.log("error");
			}
		});
	}
</script>

</head>
<body>
<!-- begin row -->
	<div class="row" id="titleArea">
		<h3>설문조사</h3>
	</div>

	<!-- 진행 중 -->
	<div id="tableArea">
		<span class="badge badge-inverse m-t-15 m-l-15" id="surveyStatus">진행 중</span>
		<div class="panel-body">
			<table class="table surveyTable" id="ingSurveyList">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>상태</th>
						<th>설문 타입</th>
						<th>참여 여부</th>
						<th>설문 기간</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>

			<div class="pageingBtnArea">
				<ul class="pagination m-t-0 m-b-10" id="ingSurveyListPagination"></ul>
			</div>
		</div>
	</div>

	<!-- 진행 예정 -->
	<div id="tableArea">
		<span class="badge badge-inverse m-t-15 m-l-15" id="surveyStatus">진행 예정</span>
		<div class="panel-body">
			<table class="table surveyTable" id="expectedSurveyList">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>상태</th>
						<th>설문 타입</th>
						<th>참여 여부</th>
						<th>설문 기간</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>

			<div class="pageingBtnArea">
				<ul class="pagination m-t-0 m-b-10" id="expectedSurveyListPagination"></ul>
			</div>
		</div>
	</div>

	<!-- 종료 -->
	<div id="tableArea">
		<span class="badge badge-inverse m-t-15 m-l-15" id="surveyStatus">종료</span>
		<div class="panel-body">
			<table class="table surveyTable" id="finishSurveyList">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>상태</th>
						<th>설문 타입</th>
						<th>참여 여부</th>
						<th>설문 기간</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>

			<div class="pageingBtnArea">
				<ul class="pagination m-t-0 m-b-10" id="finishSurveyListPagination"></ul>
			</div>
		</div>
	</div>

</body>
</html>