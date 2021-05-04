<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/common.js"></script>

<style type="text/css">
	#residentStatisticsArea {
		height: 260px;
	}

</style>

<script type="text/javascript">

	var residentStatistics = function(){
		"use strict"
		return {
			residentStatistics : function(){
				$.ajax({
					url : 'main/residentStatus',
					type : 'post',
					success : function(data){
						var residentStatusVO = data.residentStatusVO;

						// 입주 현황
						var residentPercent = residentStatusVO.residentPercent;
						$('#residentStatisticsPro').css('width',residentStatusVO.residentPercent+'%');
						$('#residentStatisticsPro').text(residentStatusVO.residentPercent+'%');

						// 현재 총 입주자 인원 수
						$('#residentCount').text(residentStatusVO.residentTotalCount + " 명");

						// 현재 총 입주자 인원 수
						$('#countPerHousehold').text(residentStatusVO.countPerHousehold + " 명");

						// 현재 총 입주자 인원 수
						$('#enrollCarCount').text(residentStatusVO.enrollCarCount + " 대");
					}
				});
			},
			survey : function() {
				getIngSurveyList();
			},
			vote : function() {
				getIngVoteList();
			}
		}
	}();

	$(document).ready(function() {
		residentStatistics.residentStatistics();
		residentStatistics.survey();
		residentStatistics.vote();
	});


	function getIngSurveyList(currentPage) {

		$.ajax({
			url : '/onepart/resident/selectIngSurvey',
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
					$tr.append($surveyPeriodTd);

					tableTbody.append($tr);

				}

				/* 페이징 버튼 값 입력 */
				var ingSurveyListPagination = $('#ingSurveyListPagination');
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

	function getIngVoteList(currentPage) {
		$.ajax({
			url : 'main/ingVoteInfo',
			type : 'post',
			data : {currentPage:currentPage},
			async: false,
			success : function(result){
				console.log('ingVoteInfo succ');

				var ingVoteList = result.ingVoteList;
				//

				// table
				var tableTbody = $('#ingVoteList tbody');
				tableTbody.children().remove();
				for(var i in ingVoteList){
					var $tr = $('<tr/>');
					var $voteSeqTd = $('<td/>', {text:ingVoteList[i].voteSeq});
					var $voteKindTd = $('<td/>', {text:ingVoteList[i].voteKind});
					var $voteNmTd = $('<td/>', {text:ingVoteList[i].voteNm});
					var $voteStatusTd = $('<td/>', {text:ingVoteList[i].voteStatus});
					var $endDtTd = $('<td/>', {text:ingVoteList[i].endDt});

					$tr.append($voteSeqTd);
					$tr.append($voteKindTd);
					$tr.append($voteNmTd);
					$tr.append($voteStatusTd);
					$tr.append($endDtTd);

					tableTbody.append($tr);
				} // end for

				// paging
				var pi = result.pi;
				var ingVoteListPagination = $('#ingVoteListPagination');
				ingVoteListPagination.children().remove();

				var $firstLi;
				var $firstA;
				if(pi.currentPage <= 1){
					$firstLi = $('<li>', {class:'disabled'});
					$firstA = $('<a>', {html:'<<'});
					$firstLi.append($firstA);
				} else {
					$firstLi = $('<li>');
					$firstA = $('<a>', {html:'<<', href:'javascript:getIngVoteList(1);'});
					$firstLi.append($firstA);
				}

				ingVoteListPagination.append($firstLi);
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
						$repeatA = $('<a>', {html:p, href:'javascript:getIngVoteList('+p+');'});
						$repeatLi.append($repeatA);
					}
					ingVoteListPagination.append($repeatLi);

				} // end for

				var $listLi;
				var $listA;
				if(pi.currentPage < pi.maxPage){
					$listLi = $('<li>');
					$listA = $('<a>', {html:'>>', href:'javascript:getIngVoteList('+pi.maxPage+');'});
					$listLi.append($listA);
				} else {
					$listLi = $('<li>', {class:'disabled'});
					$listA = $('<a>', {html:'>>'});
					$listLi.append($listA);
				}
				ingVoteListPagination.append($listLi);

			}

		});
	}

</script>
</head>
<body>

	<div class="bg-white col-md-12" id="residentStatisticsArea">
    	<h3>[입주민 통계]</h3>
    	<hr>
		<div class="col-md-12 p-0">
			<div class="col-md-3 p-0">
		   		<h4><i class="fa fa-home pull-left fa-fw"></i>입주 현황</h4>
			</div>
			<div class="col-md-9">
		   		<div class="progress progress-striped active" style="width:60%;">
					<div class="progress-bar" id="residentStatisticsPro"></div>
		        </div>
			</div>
		</div>

		<div class="col-md-12 p-0">
			<div class="col-md-3 p-0">
				<h4><i class="fa fa-user pull-left fa-fw"></i>현재 총 입주자 인원 수</h4>
			</div>
			<div class="col-md-9">
				<h4><b id="residentCount"></b></h4>
			</div>
		</div>

		<div class="col-md-12 p-0">
			<div class="col-md-3 p-0">
				<h4><i class="fa fa-pie-chart pull-left fa-fw"></i>세대당 평균 인원 수</h4>
			</div>
			<div class="col-md-9"><h4><b id="countPerHousehold"></b></h4></div>
		</div>

		<div class="col-md-12 p-0">
			<div class="col-md-3 p-0">
				<h4><i class="fa fa-car pull-left fa-fw"></i>등록 차량 수</h4>
			</div>
			<div class="col-md-9"><h4><b id="enrollCarCount"></b></h4></div>
		</div>
	</div>


	<!-- 설문조사 -->
	<div class="bg-white b-t-15 col-md-12" id="surveyArea">
    	<h3>[진행 중인 설문조사]</h3>
    	<hr>
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
							<th>설문 기간</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>

				<div class="pageingBtnArea" style="text-align: right;">
					<ul class="pagination m-t-0 m-b-10" id="ingSurveyListPagination"></ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 민원 접수 현황 -->
	<div class="bg-white b-t-15 col-md-12" id="voteArea">
    	<h3>[진행 중인 투표]</h3>
    	<hr>

    	<div id="voteTableArea">
		<span class="badge badge-inverse m-t-15 m-l-15" id="voteStatus">진행 중</span>
			<div class="panel-body">
				<table class="table surveyTable" id="ingVoteList">
					<thead>
						<tr>
							<th>투표번호</th>
							<th>투표종류</th>
							<th>투표명</th>
							<th>투표현황</th>
							<th>투표종료날짜</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>

				<div class="pageingBtnArea" style="text-align: right;">
					<ul class="pagination m-t-0 m-b-10" id="ingVoteListPagination"></ul>
				</div>
			</div>
		</div>

	</div>

</body>
</html>