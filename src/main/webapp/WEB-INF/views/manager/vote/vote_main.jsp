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
<div style="width:85%; margin:0 auto; background:white">
	<br>
	<!-- 현재 진행중인 투표 div -->
	<table style="width:95%; margin:0 auto;">
		<tr>
			<td>
				<div class="form-group">
				<br>
                    <span class="label label-warning" style="font-size:1.5em;">진행중</span>
                </div>
			</td>
			<td></td>
			<td style="width:15%">
				<a href="#modal-dialog_test" data-toggle="modal" class="btn btn-success" id="">선관위 선임 및 해임</a>
			</td>
		</tr>
	</table>
	<div>
		<div class="panel-body" style="background:white" align="center">
			<table class="table table-hover" style="text-align: center; width:100%">
				<thead>
                       <tr>
                           <th class="text-center">투표번호</th>
                           <th class="text-center">투표종류</th>
                           <th class="text-center">투표명</th>
                           <th class="text-center">투표현황</th>
                           <th class="text-center">투표종료날짜</th>
                       </tr>
                   </thead>
				<tbody>
					<c:forEach var="ingVoteList" items="${ ingVoteList }">
						<tr onclick="detailAllTypeVote(${ingVoteList.voteSeq}, '${ ingVoteList.voteKind }', '${ ingVoteList.voteStatus }')" data-toggle="modal">
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
	</div>
</div>
<br>
<br>
<div style="width:85%; margin:0 auto; background:white">
<br>
	<!-- 최근 완료된 투표 div -->
	<div>
		<table style="width:95%; margin:0 auto;">
		<tr>
			<td>
				<div class="form-group">
                    <br>
                    <span class="label label-info" style="font-size:1.5em; width: 75px;">종료</span>
                </div>
			</td>
		</tr>
	</table>
		<div class="panel-body" style="background:white" align="center">
			<table class="table table-hover" style="text-align: center; width:100%">
				<thead>
                       <tr>
                           <th class="text-center">투표번호</th>
                           <th class="text-center">투표종류</th>
                           <th class="text-center">투표명</th>
                           <th class="text-center">투표현황</th>
                           <th class="text-center">투표종료날짜</th>
                       </tr>
                   </thead>
				<tbody>
					<c:forEach var="endVoteList" items="${ endVoteList }">
						<tr onclick="detailAllTypeVote(${endVoteList.voteSeq}, '${ endVoteList.voteKind }', '${ endVoteList.voteStatus }')">
							<td>${ endVoteList.voteSeq }</td>
							<td>${ endVoteList.voteKind }</td>
							<td>${ endVoteList.voteNm }</td>
							<td>${ endVoteList.voteStatus }</td>
							<td>${fn:substring(endVoteList.endDt,0,10)}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<br>
<!-- 선관위 등록 modal -->
<div class="modal fade" id="modal-dialog_test">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">선관위 관리</h4>
			</div>
			<div class="modal-body">
				<br>
				<table style="margin:0 auto">
					<tr>
						<td>
							<span class="label label-warning" style="font-size:1.5em;">현재 선임된 선관위 리스트</span>
						</td>
					</tr>
				</table>
				<br><br>
				<table class="table table-hover" style="text-align: center; width:100%" id="superintendTable">
					<thead>
                       <tr>
                           <th class="text-center">No</th>
                           <th class="text-center">직위</th>
                           <th class="text-center">이름</th>
                           <th class="text-center">거주 세대</th>
                           <th class="text-center">해임</th>
                       </tr>
                     </thead>
                     <tbody>
                       <c:forEach var="superintendList" items="${ superintendList }">
                       <tr>
                       		<td>${ superintendList.residentSeq }</td>
                       		<c:if test="${ superintendList.aptAuthCd == 5 }">
	                       		<td>위원장</td>
                       		</c:if>
                       		<c:if test="${ superintendList.aptAuthCd == 6 }">
	                       		<td>위원</td>
                       		</c:if>
                       		<td>${ superintendList.residentNm }</td>
                       		<c:set var="dong" value="${fn:substring(superintendList.aptDetailInfoSeq,2,5)}"></c:set>
                       		<c:set var="ho" value="${fn:substring(superintendList.aptDetailInfoSeq,6,9)}"></c:set>
                       		<td>${ dong }동 ${ ho }호</td>
                       		<td>
                       			<a onclick="deleteSuperientend(${superintendList.residentSeq}, '${superintendList.residentNm}')" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                       		</td>
                       </tr>
                       </c:forEach>
                     </tbody>
				</table>
				<br><br>
				<table style="width:90%; margin:0 auto;">
					<tr>
						<td>
							<div class="form-group">
                                <a style="width: 100%" href="#modal-dialog_test2" data-toggle="modal" class="btn btn-success" id="newCandidate">새 위원 선임</a>
                            </div>
						</td>
						<td style="width:5%"></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
			</div>
		</div>
	</div>
</div>
<!-- 선관위 선임 modal -->
<div class="modal fade" id="modal-dialog_test2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">새 선관위 선임</h4>
			</div>
			<div class="modal-body">
				<table style="width:100%; margin:0 auto;">
                       		<tr>
                       			<td>
                       				 <select class="form-control input-sm" id="choiceKind">
	                      					<option value="위원장">위원장</option>
	                      					<option value="위원">위원</option>
	                           		</select>
                       			</td>
                       			<td style="width:2%"></td>
                       			<td style="width:65%">
                       				<input style="width:100%;" type="text" class="form-control" id="candidateName" readonly="readonly">
                       				<input type="hidden" id="candidateResidentSeq">
                       			</td>
                       			<td style="width:2%"></td>
                       			<td>
                       				<a class="btn btn-primary" style="width: 100%" id="plusCandidateBtn">추가</a>
                       			</td>
                       		</tr>
                       		<tr><td><br></td></tr>
                       		<tr id="candidateTableHide">
                       			<td colspan="5">
                       				<table style="width:100%; height:30px; margin:0 auto;">
				                      	<tr>
				                      		<td>
				                      			<select class="form-control input-sm" id="candidateInfoDong">
				                      					<option>원하는 동 선택</option>
				                                  <c:forEach var="dong" begin="101" end="105">
				                                  		<option value='${ dong }'>${ dong }동</option>
				                                  </c:forEach>
				                           		</select>
				                      		</td>
				                      		<td style="width:3%"></td>
				                      		<td>
				                      			<select class="form-control input-sm" id="candidateInfoHo">
				                      					<option>원하는 호 선택</option>
				                           		</select>
				                      		</td>
				                      		<td style="width:3%"></td>
				                      		<td>
				                      			<select class="form-control input-sm" id="candidateInfoName">
				                      					<option>원하는 이름 선택</option>
				                           		</select>
				                      		</td>
				                      	</tr>
				                      	<tr>
				                      		<td>
				                      			<br><br>
				                      		</td>
				                      	</tr>
				                      </table>
                       			</td>
                       		</tr>
						</table>
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" onclick="registerSuperientend();">선관위 선임</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	/* 선거 및 투표 상세보기 (투표기간) function */
	function detailAllTypeVote(voteSeq, voteKind, voteStatus) {
		var voteSeq = voteSeq;
		if(voteKind == '일반투표' && voteStatus == '투표기간'){
			$.ajax({
				url:"/onepart/manager/detailvote_general",
				type:"get",
				dataType:"html",
				data:{
						voteSeq:voteSeq,
						voteKind:voteKind,
						voteStatus:voteStatus
					},
				success:function(result){
					$("#content").html(result);
				}
			});
		}else if(voteKind == '일반투표' && voteStatus == '투표종료'){
			console.log("end");
			$.ajax({
				url:"/onepart/manager/detailvote_general_end",
				type:"get",
				dataType:"html",
				data:{
						voteSeq:voteSeq,
						voteKind:voteKind,
						voteStatus:voteStatus
					},
				success:function(result){
					$("#content").html(result);
				}
			});
		}else if(voteKind == '선거' && voteStatus == '투표기간'){
			$.ajax({
				url:"/onepart/manager/detailvote_candidate",
				type:"get",
				dataType:"html",
				data:{
						voteSeq:voteSeq,
						voteKind:voteKind,
						voteStatus:voteStatus
					},
				success:function(result){
					$("#content").html(result);
				}
			});
		}else if(voteKind == '선거' && voteStatus == '투표종료'){
			console.log("end");
			$.ajax({
				url:"/onepart/manager/detailvote_candidate_end",
				type:"get",
				dataType:"html",
				data:{
						voteSeq:voteSeq,
						voteKind:voteKind,
						voteStatus:voteStatus
					},
				success:function(result){
					$("#content").html(result);
				}
			});
		}else{
			alert("현재 선택하신 선거는 상세보기가 불가능합니다. \n투표가 진행중인 선거만 상세보기를 하실 수 있습니다.")
		}
	}

	$(function(){
		/* 선관위 선임 및 해임 페이지 이동 function */
		$("#superintendApply").click(function(){
			$.ajax({
				url:"/onepart/manager/delegationSuperintend",
				type:"get",
				dataType:"html",
				success:function(result){
					$("#content").html(result);
				}
			});
		});
	});

	/* 선관위 해임 function */
	function deleteSuperientend(residentSeq, residentNm) {
		if(confirm("\n " + residentNm + "님을 선관위에서 해임하시겠습니까? \n\n\n 선거관리 법률상 해임처리가 완료되면 \n 해당 선관위 위임 기간이 종료되기 전까지는 재 선임이 불가능하며, \n 이에 오는 불이익에 원파트는 법적 책임이 없음을 안내합니다.")){
			$.ajax({
				url:"/onepart/manager/deleteSuperientend",
				type:"get",
				data:{residentSeq:residentSeq},
				success:function(result){
					console.log(result);
					$("#superintendTable tbody").remove();

					var $tbody = $("<tbody>");
					for(var i = 0; i < result.superintendList.length; i++){
						console.log(result.superintendList[i].aptAuthCd);
						var residentSeq = result.superintendList[i].residentSeq;
						var residentNm = result.superintendList[i].residentNm;
						var $tr = $("<tr>");
						var $tdresidentSeq = $("<td>");
						var $tdaptAuthCd = $("<td>");
						var resulttdaptAuthCd;
						if(result.superintendList[i].aptAuthCd == 5){
							resulttdaptAuthCd = '위원장';
						}else{
							resulttdaptAuthCd = '위원';
						}
						var $tdresidentNm = $("<td>");
						var $tddongho = $("<td>");
						var $tddeleteSuperientend = $("<td>");
						var apartArr = result.superintendList[i].aptDetailInfoSeq.split("_");
						var dong = apartArr[1];
						var ho = apartArr[2];
						var resultApart = dong + "동 " + ho + "호"
						var $buttondeleteSuperientend = $("<a class='btn btn-xs btn-icon btn-circle btn-danger' data-click='panel-remove'><i class='fa fa-times'></i></a>")

						$tdresidentSeq.append(result.superintendList[i].residentSeq);
						$tdaptAuthCd.append(resulttdaptAuthCd);
						$tdresidentNm.append(result.superintendList[i].residentNm);
						$tddongho.append(resultApart);
						$tddeleteSuperientend.append($buttondeleteSuperientend).click(function(){
							deleteSuperientend(residentSeq, residentNm);
						});

						$tr.append($tdresidentSeq);
						$tr.append($tdaptAuthCd);
						$tr.append($tdresidentNm);
						$tr.append($tddongho);
						$tr.append($tddeleteSuperientend);
						$tbody.append($tr);
					}

					$("#superintendTable").append($tbody);

				}
			});
		}

	}

	/* 아파트 동호수 테이블 관리 function */
	$(function(){
		/* 숨기기 */
		$("#newCandidate").click(function(){
			$("#candidateTableHide").hide();

			$("#candidateName").val("");
			$("#candidateResidentSeq").val("");

		});
		/* 보이기 */
		$("#plusCandidateBtn").click(function(){
			$("#candidateTableHide").show();
		});
	});

	/* 선택된 동에 따라 호수 변화 function */
	$(function(){
		var bdNm = 0;

		$("#candidateInfoDong").change(function(){
			bdNm = $(this).val();
			console.log(bdNm);

			$.ajax({
				url:"/onepart/resident/changeBdNm",
				data:{bdNm:bdNm},
				type:"get",
				success:function(data){
					console.log(data);
					$("#candidateInfoHo option").remove();
					var $option1 = $("<option>").text("원하는 호 선택");

					$("#candidateInfoHo").append($option1);

					console.log(data.hoList[0].rmNm);

					for(var i = 0; i < data.hoList.length; i++){
						console.log("aa");
						var $optionText = data.hoList[i].rmNm + "호";
						var $optionHo = $("<option>").val(data.hoList[i].rmNm);
						$optionHo.append($optionText);
						$("#candidateInfoHo").append($optionHo);
					}

				},
			});
		});

		/* 원하는 호에 따라 이름 변화 function */
		$("#candidateInfoHo").change(function(){
			var rmNm = $(this).val();
			console.log(bdNm);
			console.log(rmNm);

			$.ajax({
				url:"/onepart/resident/changeRmNm",
				data:{
						bdNm:bdNm,
						rmNm:rmNm
					 },
				type:"get",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success:function(data){
					console.log(data);
					$("#candidateInfoName option").remove();
					var $option1 = $("<option>").text("원하는 이름 선택");

					$("#candidateInfoName").append($option1);

					for(var i = 0; i < data.nameList.length; i++){
						console.log("aa");
						var $optionText = decodeURIComponent(data.nameList[i].residentNm);
						var $optionHo = $("<option>").text(data.nameList[i].residentNm).val(data.nameList[i].residentSeq);
						$("#candidateInfoName").append($optionHo);
					}

				},
			});

		});

		/* 선택한 입주자 제목 input에 추가 function */
		$("#candidateInfoName").change(function(){
			console.log($("#candidateInfoName option:selected").text());

			$("#candidateName").val($("#candidateInfoName option:selected").text());
			$("#candidateResidentSeq").val($(this).val());
		});

	});

	/* 선관위 선임 function */
	function registerSuperientend() {
		var residentSeq = $("#candidateResidentSeq").val();
		var choiceKind = $("#choiceKind").val();

		console.log(residentSeq);
		console.log(choiceKind);

		/* 선임된 선관위 위원장이 1명이상 여부 파악 function */
		if(choiceKind == '위원장'){
			$.ajax({
				url:"/onepart/manager/confirmSuperientendMember",
				type:"get",
				success:function(result){
					if(result.resultNum > 0){
						console.log(result);
						alert("선관위 위원장은 한명만 선임하실 수 있습니다.");
					}else{
						$.ajax({
							url:"/onepart/manager/insertSuperientend",
							type:"get",
							data:{
									residentSeq:residentSeq,
									choiceKind:choiceKind
								},
							success:function(result){
								console.log(result);
								$("#superintendTable tbody").remove();

								var $tbody = $("<tbody>");
								for(var i = 0; i < result.superintendList.length; i++){
									var residentSeq = result.superintendList[i].residentSeq;
									var residentNm = result.superintendList[i].residentNm;
									console.log(result.superintendList[i].aptAuthCd);
									var $tr = $("<tr>");
									var $tdresidentSeq = $("<td>");
									var $tdaptAuthCd = $("<td>");
									var resulttdaptAuthCd;
									if(result.superintendList[i].aptAuthCd == 5){
										resulttdaptAuthCd = '위원장';
									}else{
										resulttdaptAuthCd = '위원';
									}
									var $tdresidentNm = $("<td>");
									var $tddongho = $("<td>");
									var $tddeleteSuperientend = $("<td>");
									var apartArr = result.superintendList[i].aptDetailInfoSeq.split("_");
									var dong = apartArr[1];
									var ho = apartArr[2];
									var resultApart = dong + "동 " + ho + "호"
									var $buttondeleteSuperientend = $("<a class='btn btn-xs btn-icon btn-circle btn-danger' data-click='panel-remove'><i class='fa fa-times'></i></a>")

									$tdresidentSeq.append(result.superintendList[i].residentSeq);
									$tdaptAuthCd.append(resulttdaptAuthCd);
									$tdresidentNm.append(result.superintendList[i].residentNm);
									$tddongho.append(resultApart);
									$tddeleteSuperientend.append($buttondeleteSuperientend).click(function(){
										deleteSuperientend(residentSeq, residentNm);
									});

									$tr.append($tdresidentSeq);
									$tr.append($tdaptAuthCd);
									$tr.append($tdresidentNm);
									$tr.append($tddongho);
									$tr.append($tddeleteSuperientend);
									$tbody.append($tr);
								}

								$("#superintendTable").append($tbody);

							}
						});
					}
				}
			});
		}else{
			console.log("위원선임")
			$.ajax({
				url:"/onepart/manager/insertSuperientend",
				type:"get",
				data:{
						residentSeq:residentSeq,
						choiceKind:choiceKind
					},
				success:function(result){
					console.log(result);
					$("#superintendTable tbody").remove();

					var $tbody = $("<tbody>");
					for(var i = 0; i < result.superintendList.length; i++){
						var residentSeq = result.superintendList[i].residentSeq;
						var residentNm = result.superintendList[i].residentNm;
						console.log(result.superintendList[i].aptAuthCd);
						var $tr = $("<tr>");
						var $tdresidentSeq = $("<td>");
						var $tdaptAuthCd = $("<td>");
						var resulttdaptAuthCd;
						if(result.superintendList[i].aptAuthCd == 5){
							resulttdaptAuthCd = '위원장';
						}else{
							resulttdaptAuthCd = '위원';
						}
						var $tdresidentNm = $("<td>");
						var $tddongho = $("<td>");
						var $tddeleteSuperientend = $("<td>");
						var apartArr = result.superintendList[i].aptDetailInfoSeq.split("_");
						var dong = apartArr[1];
						var ho = apartArr[2];
						var resultApart = dong + "동 " + ho + "호"
						var $buttondeleteSuperientend = $("<a class='btn btn-xs btn-icon btn-circle btn-danger' data-click='panel-remove'><i class='fa fa-times'></i></a>")

						$tdresidentSeq.append(result.superintendList[i].residentSeq);
						$tdaptAuthCd.append(resulttdaptAuthCd);
						$tdresidentNm.append(result.superintendList[i].residentNm);
						$tddongho.append(resultApart);
						$tddeleteSuperientend.append($buttondeleteSuperientend).click(function(){
							deleteSuperientend(residentSeq, residentNm);
						});

						$tr.append($tdresidentSeq);
						$tr.append($tdaptAuthCd);
						$tr.append($tdresidentNm);
						$tr.append($tddongho);
						$tr.append($tddeleteSuperientend);
						$tbody.append($tr);
					}

					$("#superintendTable").append($tbody);

				}
			});
		}
	}

</script>
</body>
</html>