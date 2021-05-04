<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/moment_ko.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.daterangepicker.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/daterangepicker.min.css">
<link href="${contextPath}/resources/plugins/switchery/switchery.min.css" rel="stylesheet">
<link href="${contextPath}/resources/plugins/powerange/powerange.min.css" rel="stylesheet">
<style type="text/css">
	.m-b-5 {
    margin-bottom: 0px!important;
	}
</style>
</head>
<jsp:include page="../superintend_vote/superintend_vote_include.jsp"></jsp:include>
<body>
<div class="col-md-14 ui-sortable" style="width:85%; margin:0 auto">
	<!-- 상단 탭 화면 -->
	<ul
		class="nav nav-tabs nav-tabs-inverse nav-justified nav-justified-mobile"
		data-sortable-id="index-2" id="panelUl">
		<li class="active"><a href="#latest-post" data-toggle="tab"><i
				class="fa fa-picture-o m-r-5"></i> <span class="hidden-xs">메인</span></a></li>
		<li class=""><a href="#purchase" data-toggle="tab"><i
				class="fa fa-shopping-cart m-r-5"></i> <span class="hidden-xs">선거개최</span></a></li>
		<li class=""><a href="#email" data-toggle="tab"><i
				class="fa fa-envelope m-r-5"></i> <span class="hidden-xs">투표등록</span></a></li>
	</ul>
	<div class="tab-content" data-sortable-id="index-3"
		style="height: 100%">
		<!-- 첫번째 탭 div -->
		<br>
		<div class="tab-pane fade active in" id="latest-post"
			style="height: 100%">
			<div class="slimScrollDiv"
				style="position: relative; overflow: hidden; width: auto; height: 100%;">
				<br>
				<div>
					<table style="width:15%;">
						<tr>
							<td align="center">
								<span class="label label-warning" style="font-size:1.5em;">진행중</span>
							</td>
						</tr>
					</table>
				</div>
				<!-- 진행중인 선거 표 div -->
				<div class="panel-body">
					<table class="table table-hover" style="text-align: center;">
						<thead>
							<tr>
								<td style="font-weight: bold;">투표번호</td>
								<td style="font-weight: bold;">투표종류</td>
								<td style="font-weight: bold;">투표 명</td>
								<td style="font-weight: bold;">현황</td>
								<td style="font-weight: bold;">종료날짜</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ingVoteList" items="${ ingVoteList }">
								<tr onclick="detailAllTypeVote(${ingVoteList.voteSeq}, '${ ingVoteList.voteKind }', '${ ingVoteList.voteStatus }')">
									<td>${ ingVoteList.voteSeq }</td>
									<td>${ ingVoteList.voteKind }</td>
									<td>${ ingVoteList.voteNm }</td>
									<td>${ ingVoteList.voteStatus }</td>
									<td>${ ingVoteList.endDt }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 선거결과보기 및 정렬 div -->
				<br> <br>
				<div>
					<table style="width:15%;">
						<tr>
							<td align="center">
								<span class="label label-info" style="font-size:1.5em; width: 75px;">종료</span>
							</td>
						</tr>
					</table>
				</div>
				<!-- 선거결과보기 표 div -->
				<div class="panel-body">
					<table class="table table-hover" style="text-align: center;">
						<thead>
							<tr>
								<td style="font-weight: bold;">투표번호</td>
								<td style="font-weight: bold;">투표종류</td>
								<td style="font-weight: bold;">투표 명</td>
								<td style="font-weight: bold;">현황</td>
								<td style="font-weight: bold;">종료날짜</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="endVoteList" items="${ endVoteList }">
								<tr onclick="detailAllTypeVote(${endVoteList.voteSeq}, '${ endVoteList.voteKind }', '${ endVoteList.voteStatus }')">
									<td>${ endVoteList.voteSeq }</td>
									<td>${ endVoteList.voteKind }</td>
									<td>${ endVoteList.voteNm }</td>
									<td>${ endVoteList.voteStatus }</td>
									<td>${ endVoteList.endDt }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="slimScrollRail"
						style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
				</div>
			</div>
		</div>
		<!-- 두번째 탭 div -->
		<div class="tab-pane fade" id="purchase" style="height: 100%">
			<div class="slimScrollDiv"
				style="position: relative; overflow: hidden; width: auto; height: 100%;">
				<!-- 선거개최 div -->
				<br>
				<div>
					<table style="width:90%; margin:0 auto;">
						<tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1" style="font-weight:bold;">선거명</label>
                                       <input style="width:100%;" type="text" class="form-control" id="electNm" name="electNm">
                                   </div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1" style="font-weight:bold;">선거구별</label>
                                       <select class="form-control input-sm" id="electionCandidate" style="height:30px;">
										<option value="electionCandidate_1">입대의 회장</option>
										<option value="electionCandidate_2">입대의 감사</option>
										<option value="electionCandidate_3">동대표</option>
									</select>
                                   </div>
                                   <input type="hidden" id="electType" name="electType">
							</td>
						</tr>
						<!-- <tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1" style="font-weight:bold;">임기</label>
                                       <input style="width:100%;" type="date" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                   </div>
							</td>
						</tr> -->
						<tr>
							<td><br><br></td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
                                    <label for="exampleInputEmail1" style="font-weight:bold;">★선거기간★</label>
                                </div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1">후보등록 기간</label>
                                       <p id="dandidateEnroll" style="background-color:#49e; color:white;padding:3px; cursor:pointer; border-radius:4px; height:35px; text-align:center;">클릭하여 후보등록 기간을 선택하세요.</p>
                                   </div>
                                   <input type="hidden" id="cnddEnrollStartDt" name="cnddEnrollStartDt">
                                   <input type="hidden" id="cnddEnrollEndDt" name="cnddEnrollEndDt">
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1">선거운동 기간</label>
                                       <p id="campaign" style="background-color:#49e; color:white;padding:3px; cursor:pointer; border-radius:4px; height:35px; text-align:center;">클릭하여 선거운동 기간을 선택하세요.</p>
                                   </div>
                                   <input type="hidden" id="campaignStartDt" name="campaignStartDt">
                                   <input type="hidden" id="campaignEndDt" name="campaignEndDt">
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1">투표 기간</label>
                                       <p id="realVote" style="background-color:#49e; color:white;padding:3px; cursor:pointer; border-radius:4px; height:35px; text-align:center;">클릭하여 투표 기간을 선택하세요.</p>
                                   </div>
                                   <input type="hidden" id="voteStartDt" name="voteStartDt">
                                   <input type="hidden" id="voteEndDt" name="voteEndDt">
							</td>
						</tr>
						<tr>
							<td><br><br></td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1" style="font-weight:bold;">오프라인 투표장소</label>
                                       <input style="width:100%;" type="text" class="form-control" id="electVoteOfflinePlace" name="electVoteOfflinePlace">
                                   </div>
							</td>
						</tr>
						<tr>
							<td><br><br></td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1" style="font-weight:bold;">선거 상세정보</label>
                                       <textarea class="form-control" placeholder="Textarea" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 141px; resize:none;" id="electVoteDetail" name="electVoteDetail"></textarea>
                                   </div>
							</td>
						</tr>
						<tr>
							<td><br><br></td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1" style="font-weight:bold;">선거권 부여</label>
                                       <select class="form-control input-sm" id="voteAccept" style="height:30px;">
										<option value="allVote">모든 세대주</option>
										<option value="anyVote">동별로 부여</option>
									</select>
                                   </div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group" id="voteBdNmDiv">
                                       <select class="form-control input-sm" id="voteBdNm" style="height:30px;">
										<c:forEach var="month" begin="101" end="105">
                                           		<option value="${ month }">${ month }동</option>
                                           </c:forEach>
									</select>
                                   </div>
                                   <input type="hidden" id="bdNm" name="bdNm">
							</td>
						</tr>
						<tr>
							<td><br><br><br></td>
						</tr>
					</table>
					<table style="width:90%; margin:0 auto;">
						<tr>
							<td>
								<div class="form-group">
                                       <a class="btn btn-success" style="width: 100%" id="electionVoteInsertBtn">등록</a>
                                   </div>
							</td>
							<td style="width:5%"></td>
							<td>
								<div class="form-group">
                                       <a class="btn btn-danger" style="width: 100%" id="electionVoteCancelBtn">취소</a>
                                   </div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="slimScrollBar ui-draggable"
				style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div>
			<div class="slimScrollRail"
				style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
		</div>
		<!-- 세번째 탭 div -->
		<div class="tab-pane fade" id="email" style="height: 100%">
			<div class="slimScrollDiv"
				style="position: relative; overflow: hidden; width: auto; height: 100%;">
				<!-- 투표등록 div -->
				<br>
				<div id="generalVoteInsert">
					<table style="width:90%; margin:0 auto;">
						<tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1" style="font-weight:bold;">투표명</label>
                                       <input style="width:100%;" type="text" class="form-control" id="gnrVoteName" name="gnrVoteName">
                                   </div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group" style="margin-bottom:0px;">
                                    <label for="exampleInputEmail1" style="font-weight:bold;">투표구별</label>
                                </div>
								<div class="form-group" style="margin-bottom:10px;">
									<!-- <span class="switchery" style="background-color: rgb(255, 91, 87); border-color: rgb(255, 91, 87); box-shadow: rgb(255, 91, 87) 0px 0px 0px 16px inset; transition: border 0.5s ease 0s, box-shadow 0.5s ease 0s, background-color 1.5s ease 0s;">
										<small style="left: 20px; transition: left 0.25s ease 0s;"></small>
									</span> -->
                                   &nbsp;&nbsp;&nbsp;<input type="checkbox" id="votekind1" name="votekind" value="1"><label for="exampleInputEmail1">&nbsp;&nbsp;&nbsp;일반투표</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;<input type="checkbox" id="votekind2" name="votekind" value="2"><label for="exampleInputEmail1">&nbsp;&nbsp;&nbsp;익명투표</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;<input type="checkbox" id="votekind3" name="votekind" value="3"><label for="exampleInputEmail1">&nbsp;&nbsp;&nbsp;복수선택</label>
                                    <input type="hidden" id="gnrVoteType" name="gnrVoteType">
                                </div>
							</td>
						</tr>
						<tr style="margin-bottom: 15px;">
							<td>
								<div class="form-group" style="margin-bottom: 45px;">
                                       <label for="exampleInputEmail1" style="font-weight:bold;">투표 종료기간</label>
                                       <p id="testDatepicker" style="background-color:#49e; color:white;padding:3px; cursor:pointer; border-radius:4px; height:35px; text-align:center;">클릭하여 투표 기간을 선택하세요.</p>
                                       <input type="hidden" id="gnrVoteEndDt" name="gnrVoteEndDt">
                                   </div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1" style="font-weight:bold;">오프라인 투표장소</label>
                                       <input style="width:100%;" type="text" class="form-control" id="gnrVoteOfflinePlace" name="gnrVoteOfflinePlace" placeholder="Enter email">
                                   </div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1" style="font-weight:bold;">투표 상세정보</label>
                                       <textarea id="gnrVoteDetail" name="gnrVoteDetail" class="form-control" placeholder="Textarea" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 141px; resize:none;"></textarea>
                                   </div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
                                       <label for="exampleInputEmail1" style="font-weight:bold;">투표권 부여</label>
                                       <select class="form-control input-sm" id="conChoiceVote" style="height:30px;">
											<option value="allVote">모든 세대주</option>
											<option value="anyVote">동별로 부여</option>
										</select>
										<input type="hidden" id="gnrVoteGrant" name="gnrVoteGrant">
										<input type="hidden" id="bdNm" name="bdNm">
                                   </div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group" id="conDiv" style="opacity:0;">
										<c:forEach var="month" begin="101" end="105">
                                           		&nbsp;&nbsp;&nbsp;<input type="checkbox" value="${ month }" name="generalVoteing"><label for="exampleInputEmail1">&nbsp;&nbsp;&nbsp;${ month }동</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         </c:forEach>
                                   </div>
							</td>
						</tr>
						<tr>
							<td><br><br><br></td>
						</tr>
					</table>
					<!-- 후보등록 div -->
					<table style="width:90%; margin:0 auto;" id="candidateTable">
						<tr>
							<td>
								<div class="form-group">
                                     <label for="exampleInputEmail1" style="font-weight:bold;">후보등록</label>
                                </div>
							</td>
							<td style="width:30%; text-align:right">
								<div class="form-group">
                                    <a href="#modal-dialog_test" data-toggle="modal" class="btn btn-default" style="width:15%" id="newCandidateBtn">+</a>
                                </div>
							</td>
						</tr>
					</table>
					<input type="hidden" id="voteCandidateArr" name="voteCandidateArr">
					<br><br>
					<table style="width:90%; margin:0 auto;">
						<tr>
							<td>
								<div class="form-group">
                                       <a class="btn btn-success" style="width: 100%" id="generalVoteInsertBtn">등록</a>
                                   </div>
							</td>
							<td style="width:5%"></td>
							<td>
								<div class="form-group">
                                       <a class="btn btn-danger" style="width: 100%" id="generalVoteCancelBtn">취소</a>
                                   </div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="slimScrollBar ui-draggable"
				style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div>
			<div class="slimScrollRail"
				style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
		</div>
	</div>
</div>
<!-- 후보등록 modal -->
<div class="modal fade" id="modal-dialog_test">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">새 후보추가</h4>
			</div>
			<div class="modal-body">
				<table style="width:95%; margin:0 auto;">
                    <tr>
               			<td>
               				 <label for="exampleInputEmail1" style="font-weight:bold;">후보이름</label>
               			</td>
               			<td style="width:10%"></td>
               			<td style="width:75%">
               				<input style="width:100%;" type="text" class="form-control" id="registerName">
               			</td>
                    </tr>
                    <tr><td></td></tr>
                    <tr>
						<td colspan="3">
							<div class="form-group">
                                <label for="exampleInputEmail1" style="font-weight:bold;">상세정보</label>
                                <textarea class="form-control" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 141px; resize:none;" id="registerDetailInfo"></textarea>
                            </div>
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" onclick="registerCandidate();">후보등록</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	/* datepicker function */
	$('#testDatepicker').dateRangePicker({

	   	 getValue: function()
	   		{
	   			return this.innerHTML;
	   		},
	   		setValue: function(s)
	   		{
	   			this.innerHTML = s;
	   		}
	    });

    /* 투표권 부여내역에 따른 checkbox 변경 function */
    $(function(){
    	$("#conChoiceVote").change(function(){
	    	console.log($("#conChoiceVote").val());
	    	if($("#conChoiceVote").val() == 'anyVote'){
				$("#conDiv").css("opacity", 1);
	    	}else{
	    		$("#conDiv").css("opacity", 0);
	    	}
    	})
    });

    var candidateNum = 1;
    var candidateArr = new Array();
    /* 후보 화면 등록 function */
    function registerCandidate() {
		var $tr = $("<tr>");
		var $td = $("<td colspan='2'>")
		var $panelDiv = $("<div class='panel panel-inverse' data-sortable-id='ui-widget-15' style='border:0.5px solid black'>");
		var $headDiv = $("<div class='panel-heading'>");
		var $headBtnDiv = $("<div class='panel-heading-btn'>");
		var $btn1 = $('<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload">');
		var $icon1 = $('<i class="fa fa-repeat">');
		var $btn2 = $('<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove">');
		var $icon2 = $('<i class="fa fa-times">');
		var $panelH4 = $('<h4 class="panel-title">')
		var register = $("#registerName").val();
		var registerName = "후보" + candidateNum + ". " + register;
		var $bodyDiv = $('<div class="panel-body">');
		var $panelP = $("<p>");
		var registerDetailInfo = $("#registerDetailInfo").val();

		$panelP.append(registerDetailInfo);
		$bodyDiv.append($panelP);

		$btn1.append($icon1);
		$btn2.append($icon2);
		$headBtnDiv.append($btn1);
		$headBtnDiv.append($btn2);
		$panelH4.append(registerName);
		$headDiv.append($headBtnDiv);
		$headDiv.append($panelH4);

		$panelDiv.append($headDiv);
		$panelDiv.append($bodyDiv);

		$td.append($panelDiv);
		$tr.append($td);

    	$("#candidateTable").append($tr);


    	/* 후보 추가시 배열에 담아 해당 배열 value값 담는 function */
		var candidateInfo = candidateNum + ":" + register + ":" + registerDetailInfo;
		candidateArr.push(candidateInfo);
		$("#voteCandidateArr").val(candidateArr);

    	candidateNum++;
	}

    /* 클릭시마다 모달창 value 비우기 function */
    $(function(){
    	$("#newCandidateBtn").click(function(){
    		console.log("클릭크");
    		$("#registerName").val("");
			$("#registerDetailInfo").val("");
    	})
    });

    /* 투표구별 checkbox 한개만 선택 function */
    $(function(){
    	$("input[type='checkbox'][name='votekind']").click(function(){
    		if($(this).prop("checked")){
				$("input[type='checkbox'][name='votekind']").prop("checked", false);
				$(this).prop("checked", true);
			}
    	});
    });

    /* 투표구별 check시 해당 value값 담는 function */
    $(function(){
    	$("input[type='checkbox'][name='votekind']").click(function(){
    		if($(this).prop("checked")){
				$("#gnrVoteType").val("");
				$("#gnrVoteType").val($(this).val());
			}
    	});
    });

    /* datepicker 값 변경시 해당 value값 담는 function */
	$("#testDatepicker").change(function(){
		var facSeq = $("#facSeq").val();
		var testDatepicker = $("#testDatepicker").val();
		var first = testDatepicker.substr(6,10);
		var second = testDatepicker.substr(0,5);
		var propUseDt = first + "/" + second;
		$("#gnrVoteEndDt").val(propUseDt);
	});
	$(function(){
    	$("#testDatepicker").bind("DOMSubtreeModified", function(){
    		console.log($(this).text());
    		var propUseDt = $(this).text().substr(14,24);
    		console.log(propUseDt);
    		$("#gnrVoteEndDt").val(propUseDt);
    		console.log($("#gnrVoteEndDt").val());
    	})
    });

    /* 투표권 부여 select 값에 따라 해당 value값 담는 function */
	$(function(){
		$("#gnrVoteGrant").val('1');
		$("#conChoiceVote").change(function(){
			console.log($(this).val());
			if($(this).val() == 'allVote'){
				$("#gnrVoteGrant").val('1');
			}else{
				$("#gnrVoteGrant").val('2');

			}
		});
	});

    /* 동별로 투표권 부여시 해당 호수 value값 추가하는 function */
    var bdNmArr = new Array();
	$(function(){
		$("input[type='checkbox'][name='generalVoteing']").click(function(){
    		if($(this).prop("checked")){
    			bdNmArr.push($(this).val())
    			$("#bdNm").val(bdNmArr);
			}else{
				bdNmArr.splice(bdNmArr.indexOf($(this).val()), 1);
				$("#bdNm").val(bdNmArr);
			}
    	});
	});

    /* 해당 투표 insert하는 function */
    $(function(){
    	$("#generalVoteInsertBtn").click(function(){

    		var gnrVoteName = $("#generalVoteInsert #gnrVoteName").val();
    		var gnrVoteType = $("#generalVoteInsert #gnrVoteType").val();
    		var gnrVoteEndDt = $("#generalVoteInsert #gnrVoteEndDt").val();
    		var gnrVoteOfflinePlace = $("#generalVoteInsert #gnrVoteOfflinePlace").val();
    		var gnrVoteDetail = $("#generalVoteInsert #gnrVoteDetail").val();
    		var gnrVoteGrant = $("#generalVoteInsert #gnrVoteGrant").val();
    		var voteCandidateArr = $("#generalVoteInsert #voteCandidateArr").val();
    		var bdNm = $("#generalVoteInsert #bdNm").val();

    		console.log(gnrVoteName);
    		console.log(gnrVoteType);
    		console.log(gnrVoteEndDt);
    		console.log(gnrVoteOfflinePlace);
    		console.log(gnrVoteDetail);
    		console.log(gnrVoteGrant);
    		console.log(voteCandidateArr);
    		console.log(bdNm);

    		var data = {
    				'gnrVoteName':gnrVoteName,
    				'gnrVoteTypeStr':gnrVoteType,
    				'gnrVoteEndDt':gnrVoteEndDt,
    				'gnrVoteOfflinePlace':gnrVoteOfflinePlace,
    				'gnrVoteDetail':gnrVoteDetail,
    				'gnrVoteGrantStr':gnrVoteGrant,
    				'voteCandidateArr':voteCandidateArr,
    				'bdNmArr':bdNm
    		}

	        $.ajax({
	            type: "get",
	            url: "/onepart/resident/insert_newVote_general",
	            data: {
    				'gnrVoteName':gnrVoteName,
    				'gnrVoteType':gnrVoteType,
    				'gnrVoteEndDt':gnrVoteEndDt,
    				'gnrVoteOfflinePlace':gnrVoteOfflinePlace,
    				'gnrVoteDetail':gnrVoteDetail,
    				'gnrVoteGrant':gnrVoteGrant,
    				'voteCandidateArr':voteCandidateArr,
    				'bdNmArr':bdNm
    			},
	            success: function (data) {
	        		console.log("success");
	            	$.ajax({
	        			url:"/onepart/resident/menuSuperintendVote",
	        			dataType:"html",
	        			success:function(result){
	        				$("#content").html(result);
	        			}
	        		});
	            },
	            error: function (e) {

	            }
	        });
    	});
    });

    /* 후보등록기간 rangePicker function */
    $('#dandidateEnroll').dateRangePicker({

   	 getValue: function()
   		{
   			return this.innerHTML;
   		},
   		setValue: function(s)
   		{
   			this.innerHTML = s;
   		}
    });

    /* 후보등록기간 값 변화 시 input value 등록 function */
    $(function(){
    	$("#dandidateEnroll").bind("DOMSubtreeModified", function(){
    		console.log($(this).text());
    		var cnddEnrollStartDt = $(this).text().substr(0,10);
    		var cnddEnrollEndDt = $(this).text().substr(14,24);
    		$("#cnddEnrollStartDt").val(cnddEnrollStartDt);
    		$("#cnddEnrollEndDt").val(cnddEnrollEndDt);
    	})
    });

    /* 선거운동기간 rangePicker function */
    $('#campaign').dateRangePicker({

   	 getValue: function()
   		{
   			return this.innerHTML;
   		},
   		setValue: function(s)
   		{
   			this.innerHTML = s;
   		}
    });

    /* 선거운동기간 값 변화 시 input value 등록 function */
	$(function(){
    	$("#campaign").bind("DOMSubtreeModified", function(){
    		console.log($(this).text());
    		var campaignStartDt = $(this).text().substr(0,10);
    		var campaignEndDt = $(this).text().substr(14,24);
    		$("#campaignStartDt").val(campaignStartDt);
    		$("#campaignEndDt").val(campaignEndDt);
    	})
    });

    /* 투표기간 rangePicker function */
    $('#realVote').dateRangePicker({

   	 getValue: function()
   		{
   			return this.innerHTML;
   		},
   		setValue: function(s)
   		{
   			this.innerHTML = s;
   		}
    });

    /* 투표기간 값 변화 시 input value 등록 function */
	$(function(){
    	$("#realVote").bind("DOMSubtreeModified", function(){
    		console.log($(this).text());
    		var voteStartDt = $(this).text().substr(0,10);
    		var voteEndDt = $(this).text().substr(14,24);
    		$("#voteStartDt").val(voteStartDt);
    		$("#voteEndDt").val(voteEndDt);
    	})
    });

    /* 선거구별 값 변화 시 input value 등록 function */
	$(function(){
		$("#voteBdNmDiv").hide();
		$("#voteAccept").find("option").attr("disabled", "disabled");

		$("#electType").val('1');
		$("#electionCandidate").change(function(){
			console.log($(this).val());
			if($(this).val() == 'electionCandidate_1'){
				$("#electType").val('1');
				$("#voteAccept").find("option:eq(0)").prop("selected", true);
				$("#voteAccept").find("option:eq(1)").attr("disabled", "disabled");
				$("#voteBdNmDiv").hide();
			}else if($(this).val() == 'electionCandidate_2'){
				$("#electType").val('2');
				$("#voteAccept").find("option:eq(0)").prop("selected", true);
				$("#voteBdNmDiv").hide();
			}else{
				$("#electType").val('3');
				$("#voteAccept").find("option:eq(1)").prop("selected", true);
				$("#voteBdNmDiv").show();

			}
		});
	});

    /* 투표권 동별부여 시 동 value 배열에 담아 input value 등록 function */
	$(function(){
		$("#voteBdNm").change(function(){
			console.log($(this).val());
			$("#bdNm").val($(this).val());
		});
	});

    /* 해당선거 insert function */
    $(function(){
    	$("#electionVoteInsertBtn").click(function(){
			var electNm = $("#electNm").val();
			var electType = $("#electType").val();
			var electVoteDetail = $("#electVoteDetail").val();
			var cnddEnrollStartDt = $("#cnddEnrollStartDt").val();
			var cnddEnrollEndDt = $("#cnddEnrollEndDt").val();
			var campaignStartDt = $("#campaignStartDt").val();
			var campaignEndDt = $("#campaignEndDt").val();
			var voteStartDt = $("#voteStartDt").val();
			var voteEndDt = $("#voteEndDt").val();
			var electVoteOfflinePlace = $("#electVoteOfflinePlace").val();
			var bdNm = $("#bdNm").val();

			console.log(electNm)


    		$.ajax({
	            type: "get",
	            url: "/onepart/resident/insert_newVote_election",
	            data: {
    				'electNm':electNm,
    				'electType':electType,
    				'electVoteDetail':electVoteDetail,
    				'cnddEnrollStartDt':cnddEnrollStartDt,
    				'cnddEnrollEndDt':cnddEnrollEndDt,
    				'campaignStartDt':campaignStartDt,
    				'campaignEndDt':campaignEndDt,
    				'voteStartDt':voteStartDt,
    				'voteEndDt':voteEndDt,
    				'electVoteOfflinePlace':electVoteOfflinePlace,
    				'bdNm':bdNm
    			},
	            success: function (data) {
	        		console.log("success");
	            	$.ajax({
	        			url:"/onepart/resident/menuSuperintendVote",
	        			dataType:"html",
	        			success:function(result){
	        				$("#content").html(result);
	        			}
	        		});
	            },
	            error: function (e) {

	            }
	        });
    	});
    });

    /* 현재 진행중인 투표 클릭 row의 상세보기 페이지 전환 function */
    function detailAllTypeVote(voteSeq, voteKind, voteStatus) {
		console.log(voteSeq);
		console.log(voteKind);
		console.log(voteStatus);

		if(voteStatus == '후보등록기간'){
			/* view 페이지 전환 (후보등록기간) */
			$.ajax({
				url:"/onepart/resident/superintend_vote_registration_main",
				type:"get",
				data:{'voteSeq':voteSeq},
				success:function(result){
    				$("#content").html(result);
    			}
			});

		}else if(voteStatus == '투표기간'){
			/* view 페이지 전환 (투표기간) */
			$.ajax({
				url:"/onepart/resident/votingRealvote",
				type:"get",
				data:{
						'voteSeq':voteSeq,
						'voteKind':voteKind,
						'voteStatus':voteStatus
					 },
				success:function(result){
    				$("#content").html(result);
    			}
			});

		}else if(voteStatus == '투표종료'){
			$.ajax({
				url:"/onepart/resident/endRealvote",
				type:"get",
				data:{
						'voteSeq':voteSeq,
						'voteKind':voteKind,
						'voteStatus':voteStatus
					 },
				success:function(result){
    				$("#content").html(result);
    			}
			});
		}else{
		}
			/* view 페이지 전환 (선거운동기간) */
			$.ajax({
				url:"/onepart/resident/superintend_vote_exercise_main",
				type:"get",
				data:{'voteSeq':voteSeq},
				success:function(result){
    				$("#content").html(result);
    			}
			});
		}
</script>
<script>
		/* $(document).ready(function() {
			FormSliderSwitcher.init();
		}); */
</script>
<script src="${contextPath}/resources/plugins/switchery/switchery.min.js"></script>
<script src="${contextPath}/resources/plugins/powerange/powerange.min.js"></script>
<script src="${contextPath}/resources/js/form-slider-switcher.demo.min.js"></script>
</body>
</html>