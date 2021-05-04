<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- 후보관리 및 후보등록 div -->
<div style="width:85%; margin:0 auto">
	<table style="width:100%">
		<tr>
			<td>
				<div class="form-group">
                    <h4>등록된 후보</h4>
                </div>
			</td>
			<td></td>
			<td style="width:15%">
				<a class="btn btn-success" style="width:100%" href="#modal-dialog_test" data-toggle="modal" id="newCandidate">새후보 추가</a>
			</td>
		</tr>
	</table>
	<!-- 등록된 후보 리스트 div -->
	<div class="panel-body" style="background:white" align="center">
		<div style="width:95%">
			<ul class="media-list media-list-with-divider">
				<c:forEach var="candidateList" items="${ candidateList }">
					<!-- 한후보 정보 div -->
					<li style="margin-bottom:-10px;">
						<table style="width:95%; margin:0 auto;">
							<tr>
								<td style="width:30%"><h4>후보${ candidateList.cndtNo }번 ${ candidateList.residentNm }
								&nbsp;&nbsp;&nbsp; <small style="font-size:1em">${ candidateList.bdNm }동 ${ candidateList.rmNm }호 거주</small></h4></td>
							</tr>
						</table>
					</li>
					<li class="media media-lg" style="padding:15px; margin-top:10px">
						<table style="width:95%; margin:0 auto;">
							<tr>
								<td>
									<a href="javascript:;" class="pull-left">
										<img class="media-object" src="${contextPath }/resources/uploadFiles/reservation/${ candidateList.changeNm }" alt="" style="height:250px; width:auto;">
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
		</div>
	</div>
</div>
<!-- 새 후보등록 modal -->
<div class="modal fade" id="modal-dialog_test">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">새 후보등록</h4>
			</div>
			<div class="modal-body">
				<table style="width:100%; margin:0 auto;">
                       		<tr>
                       			<td>
                       				<input type="hidden" value="${ maxCndtNo }" id="maxCndtNo">
                       			</td>
                       			<td>
                       				 <label for="exampleInputEmail1" style="font-weight:bold;">후보명</label>
                       			</td>
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
                       			<td colspan="4">
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
                       		<tr><td><br></td></tr>
                       		<tr>
								<td colspan="5">
									<div class="form-group">
		                                      <label for="exampleInputEmail1" style="font-weight:bold;">간단정보</label>
		                                      <textarea class="form-control" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 141px; resize:none" id="simpleInfo"></textarea>
		                                  </div>
								</td>
							</tr>
							<tr><td><br></td></tr>
							<tr>
								<td colspan="5">
									<div class="form-group">
		                                      <label for="exampleInputEmail1" style="font-weight:bold;">상세정보</label>
		                                      <textarea class="form-control" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 141px; resize:none" id="detailInfo"></textarea>
		                                  </div>
								</td>
							</tr>
							<tr><td><br></td></tr>
							<tr>
								<td colspan="5">
									<div class="form-group">
		                                      <label for="exampleInputEmail1" style="font-weight:bold;">기타사항</label>
		                                      <textarea class="form-control" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 141px; resize:none" id="etcInfo"></textarea>
		                                  </div>
								</td>
							</tr>
							<tr><td><br></td></tr>
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

	/* 후보등록 완료시 insert하고 이전페이지로  돌아가는 function */
	function registerCandidate() {
		var residentSeq = $("#candidateResidentSeq").val();
		var simpleInfo = $("#simpleInfo").val();
		var detailInfo = $("#detailInfo").val();
		var etcInfo = $("#etcInfo").val();
		var electVoteSeq = $("#electVoteSeq").val();
		var maxCndtNo = $("#maxCndtNo").val();
		var realCndtNo = parseInt( maxCndtNo, 10 );
		var cndtNo = realCndtNo + 1;
		console.log(residentSeq);
		console.log(simpleInfo);
		console.log(detailInfo);
		console.log(etcInfo);
		console.log("cndtNo : " + cndtNo);

		$.ajax({
			url:"/onepart/resident/insertElectionVoteCandidate",
			type:"get",
			data:{
					residentSeq:residentSeq,
					simpleInfo:simpleInfo,
					detailInfo:detailInfo,
					etcInfo:etcInfo,
					electVoteSeq:electVoteSeq,
					cndtNo:cndtNo
				},
			success:function(){
				console.log("success");
				electVoteSeq = $("#electVoteSeq").val();
				$.ajax({
					url:"/onepart/resident/superintend_vote_registration_main",
					dataType:"html",
					type:"get",
					data:{voteSeq:electVoteSeq},
					success:function(result){
						$('#modal-dialog_test').modal("hide");
						$('.modal-backdrop').remove();
						$('.modal-open').css("overflow", "visible");
						$("#content").html(result);
					}

				});
			},error:function(){
				alert("후보등록을 하지 않은 입주자입니다.")
			}
		});

	}
</script>
</body>
</html>