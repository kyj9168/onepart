<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#titleH1 {
		display: inline-block;
		margin-right: 2%;
	}

	#surveyStatus {
		font-size: 1.5em;
	}

	#TbsurveyInfo {
		width: 50%;
	}

	#endSurvey:hover {
		background: #ff5b57;
		cursor:no-drop;
	}
</style>
<script src="${contextPath}/resources/plugins/DataTables/js/jquery.dataTables.js"></script>
<script src="${contextPath}/resources/js/table-manage-default.demo.min.js"></script>
<script src="${contextPath}/resources/js/apps.min.js"></script>
<link href="${contextPath}/resources/plugins/DataTables/css/data-table.css" rel="stylesheet" />
<script type="text/javascript">

	/* char color array */
	var backgroundColorList =
		['rgba(255, 99, 132, 0.2)',
		'rgba(54, 162, 235, 0.2)',
		'rgba(255, 206, 86, 0.2)',
		'rgba(75, 192, 192, 0.2)',
		'rgba(153, 102, 255, 0.2)',
		'rgba(255, 159, 64, 0.2)',
		'rgba(48, 47, 48, 0.2)',
		'rgba(248, 162, 252, 0.2)'];

	var borderColorList =
		['rgba(255, 99, 132, 1)',
		'rgba(54, 162, 235, 1)',
		'rgba(255, 206, 86, 1)',
		'rgba(75, 192, 192, 1)',
		'rgba(153, 102, 255, 1)',
		'rgba(255, 159, 64, 1)',
		'rgba(48, 47, 48, 1)',
		'rgba(248, 162, 252, 1)'];


	$(function(){
		// 설문 통계 정보 세팅
		getSelectedInfo();
	});

	// 설문 통계 정보 세팅
	function getSelectedInfo(){

		var surveySeq = '${surveyVO.surveySeq}';

		$.ajax({
			url : '/onepart/resident/getSelectedInfo',
			type : 'post',
			/* contentType : "application/json", */
			async: false,
			data : {surveySeq:surveySeq},
			success : function(data) {
				var surveyQstnList = data.surveyQstnList;
				var surveyQstnOptionList = data.surveyQstnOptionList;

				var surveyInfoBody = $('#surveyInfoBody');

				for(var i in surveyQstnList){
					var surveyQstnNum = surveyQstnList[i].surveyQstnNum;
					var surveyQstnTitle = surveyQstnList[i].surveyQstnTitle;
					var surveyQstnType = surveyQstnList[i].surveyQstnType;

					var surveyQstnTypeStr = '';
					if(surveyQstnType == 1){
						surveyQstnTypeStr = "단답형";
					} else if(surveyQstnType == 2){
						surveyQstnTypeStr = "장문형";
					} else if(surveyQstnType == 3){
						surveyQstnTypeStr = "객관식";
					} else if(surveyQstnType == 4){
						surveyQstnTypeStr = "체크박스";
					}

					var title = surveyQstnTitle + '(' + surveyQstnTypeStr + ')';
					var $h3 = $('<h3>', {text:title});
					surveyInfoBody.append($h3);

					var $hr = $('<hr>');
					// 타입별 통계 정보 가져오기
					// 단답형
					if(surveyQstnType == 1 || surveyQstnType == 2){
						getSelectedStatisticsType1(surveySeq, surveyQstnType, surveyInfoBody, surveyQstnNum);
					} else if(surveyQstnType == 3 || surveyQstnType == 4){
						getSelectedStatisticsType4(surveySeq, surveyQstnType, surveyInfoBody, surveyQstnNum);
					}



					surveyInfoBody.append($hr);
				}
			},
			error : function(error) {
				console.log('error');
			}
		});
	}

	// 단답형 && 장문형
	function getSelectedStatisticsType1(surveySeq, surveyQstnType, surveyInfoBody, surveyQstnNum) {
		$.ajax({
			url : '/onepart/resident/getSelectedStatisticsType1',
			type : 'post',
			async: false,
			data : {
				surveySeq : surveySeq,
				surveyQstnType : surveyQstnType,
				surveyQstnNum : surveyQstnNum
				},
			success : function(data){
				console.log(data);
				var tableId = "dataTable"+surveyQstnNum;
				var surveyArr = data.surveyStatisticsVOList;
				var $table_responsiveDiv = $('<div>', {class:'table-responsive'});
				var $data_tableTable =  $('<table>', {id:tableId, class:"table table-striped table-bordered"});

				$table_responsiveDiv.append($data_tableTable);

				if(!surveyArr){
					var $noneDataI = $('<i>', {class:'fa fa-times', style:'color:red;'})
					var $h3 = $('<h4>', {text:' 데이터가 존재하지 않습니다.'});
					$h3.prepend($noneDataI);
					surveyInfoBody.append($h3);
				} else {
					surveyInfoBody.append($table_responsiveDiv);
				}


				var dataSet = [];

				for(var i in surveyArr){
					var data = [];
					var surveyData = surveyArr[i];

					data.push(surveyData.bdNm);
					data.push(surveyData.rmNm);
					data.push(surveyData.selectedAnswer);
					dataSet.push(data);
				}
				$('#'+tableId).DataTable( {
			        data: dataSet,
			        columns: [
			            { title: "동" },
			            { title: "호" },
			            { title: "답변" },
			        ]
			    });
			}
		});
	}

	// 체크박스
	function getSelectedStatisticsType4(surveySeq, surveyQstnType, surveyInfoBody, surveyQstnNum) {
		$.ajax({
			url : '/onepart/resident/getSelectedStatisticsType4',
			type : 'post',
			async: false,
			data : {
				surveySeq : surveySeq,
				surveyQstnType : surveyQstnType,
				surveyQstnNum : surveyQstnNum
				},
				success : function(data){
					console.log("================================================================");
					console.log(data);

					var optionInfoList = data.list[0];
					var countInfoList = data.list[1];

					var canvasId = surveyQstnNum + "_char";

					var $canvas = $("<canvas>", {id:canvasId, height:"50%", width:"50%"});
					surveyInfoBody.append($canvas);

					var optionInfoListLength  = optionInfoList.length;
					var labelsValue = [];
					for(var i=0; i<optionInfoList.length; i++){
						labelsValue.push(optionInfoList[i]);
		        	}

					var countInfoListLength = countInfoList.length;
					var dataValue = [];
					for(var i=0; i<countInfoList.length; i++){
						dataValue.push(countInfoList[i]);
		        	}

					console.log("labelsValue : " + labelsValue);
					console.log("dataValue : " + dataValue);

					var colorList = [];
					for(var i=0; i<countInfoList.length; i++){
						colorList.push(backgroundColorList[i]);
					}

					var boarderList = [];
					for(var i=0; i<countInfoList.length; i++){
						boarderList.push(borderColorList[i]);
					}

					var graphType = "bar"
					if(surveyQstnType == 3){
						graphType = 'doughnut';
					}

					console.log("colorList:::" + colorList);

					$(function(){
						var ctx = document.getElementById(canvasId);
						var myChart = new Chart(ctx, {
						    type: graphType,
						    data: {
						        labels: labelsValue,
						        datasets: [{
						            label: '',
						            data: dataValue,
						            backgroundColor: colorList,
						            borderColor: boarderList,
						            borderWidth: 1
						        }]
						    },
						    options: {
						        scales: {
						            yAxes: [{
						                ticks: {
						                    beginAtZero: true,
						                    stacked: true
						                }
						            }]
						        }
						    }
						});
					});

				}

		});

	}

</script>
<script type="text/javascript">




</script>
</head>
<body>
	<div class="row">
	    <div class="col-md-1"></div>
	    <div class="col-md-10">
			<h3>설문조사</h3>
			<br>

			<div class="tab-content">
				<div class="tab-pane fade active in" id="default-tab-1">
					<div id="surveyInfoHeader">

						<h2 id="titleH1">${ surveyVO.surveyTitle }</h2>

						<!-- 진행 여부 -->
						<c:if test="${ surveyVO.surveyStatus == 1}">
							<span class="badge badge-inverse" id="surveyStatus">진행 예정</span>
						</c:if>
						<c:if test="${ surveyVO.surveyStatus == 2}">
							<span class="badge badge-Primary" id="surveyStatus">진행 중</span>
						</c:if>
						<c:if test="${ surveyVO.surveyStatus == 3}">
							<span class="badge badge-Danger" id="surveyStatus">종료</span>
						</c:if>

						<!-- 참여 여부 -->
						<c:if test="${ surveyVO.residentSeq == 0}">
							<span class="label label-danger" id="surveyStatus">미참여</span>
						</c:if>

						<c:if test="${ surveyVO.residentSeq != 0}">
							<span class="label label-primary" id="surveyStatus">참여 완료</span>
						</c:if>

						<table class="table" id="TbsurveyInfo">
							<tr>
								<td colspan="2"><h4>${ surveyVO.surveySimpleIntro }</h4></td>
							</tr>
							<tr>
								<td>설문 기간</td>
								<td>${ surveyVO.surveyPeriod }</td>
							</tr>
							<tr>
								<td>참여율</td>
								<td>
									<div class="progress progress-striped active">
                                        <div class="progress-bar" style="width: ${ prtcptPercentStr }%">${ prtcptPercentStr }%</div>
                                    </div>
								</td>
							</tr>
						</table>

						<!-- 설문에 참여를 안했을 때, -->
						<c:if test="${surveyVO.residentSeq == 0 }">

							<!-- 설문 타입이 세대주, 로그인 유저가 세대주일 때 -->
							<c:if test="${ surveyVO.surveyType == 2 && sessionScope.loginUser.householdAuthType == 2 && surveyVO.surveyStatus == 2 }">
								<a href="#modal-dialog" class="btn btn-info btn-block" data-toggle="modal">[ 설문조사 참여하기 ]</a>
							</c:if>
							<!-- 설문 타입이 일반, 모두 -->
							<c:if test="${ surveyVO.surveyType == 1 && surveyVO.surveyStatus == 2 }">
								<a href="#modal-dialog" class="btn btn-info btn-block" data-toggle="modal">[ 설문조사 참여하기 ]</a>
							</c:if>
						</c:if>

						<!-- 설문에 참여할 수 없는 경우 -->
						<!-- 설문을 완료했을 때, -->
						<c:if test="${surveyVO.residentSeq != 0 && surveyVO.surveyStatus == 2 }">
							<a class="btn btn-danger btn-block" data-toggle="modal" id="endSurvey">[ 설문조사에 참여하셨습니다. ]</a>
						</c:if>
						<c:if test="${ surveyVO.surveyType == 2 && sessionScope.loginUser.householdAuthType != 2 && surveyVO.surveyStatus == 2 }">
							<a class="btn btn-danger btn-block" data-toggle="modal" id="endSurvey">[ 본 설문은 세대주만 참여 가능합니다. ]</a>
						</c:if>
						<c:if test="${surveyVO.surveyStatus == 1 }">
							<a class="btn btn-danger btn-block" data-toggle="modal" id="endSurvey">[ 설문조사 기간이 아닙니다. ]</a>
						</c:if>
						<c:if test="${surveyVO.surveyStatus == 3 }">
							<a class="btn btn-danger btn-block" data-toggle="modal" id="endSurvey">[ 설문조사가 종료되었습니다. ]</a>
						</c:if>
					</div>
				</div>
			</div>

			<br>

			<div class="tab-content">
				<div class="tab-pane fade active in" id="default-tab-1" align="center">
					<div id="surveyInfoBody" style="width: 80%;">
	                    <div class="table-responsive"></div>
					</div>
				</div>
			</div>

		</div>
		<div class="col-md-1"></div>
	</div>

	<!-- modal include -->
	<jsp:include page="surveyDetailModal.jsp"/>

</body>
</html>