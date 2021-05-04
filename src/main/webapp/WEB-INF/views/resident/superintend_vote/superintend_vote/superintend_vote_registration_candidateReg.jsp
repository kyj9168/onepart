<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<head>
	<meta charset="utf-8">
	<title>Color Admin | Compose</title>
</head>
</head>
<body>
<jsp:include page="../superintend_vote/superintend_vote_include.jsp"></jsp:include>
<jsp:include page="../superintend_vote/superintend_vote_detail_include.jsp"></jsp:include>
<!-- 후보등록 요청 div -->
<div style="width:85%; margin:0 auto">
	<!-- title div -->
	<table style="width:100%">
		<tr>
			<td>
				<div class="form-group">
                    <h4>후보등록 요청</h4>
                </div>
			</td>
		</tr>
	</table>
	<!-- 전송내용 작성 div -->
	<div class="panel-body" style="background:white" align="center">
		<br>
		<table style="width:90%" style="margin:0 auto">
			<tr>
				<td colspan="4">
					<div class="form-group">
                        <label for="exampleInputEmail1" style="font-weight:bold;">전송내용</label>
                        <textarea class="form-control" placeholder="Textarea" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 200px; resize:none;"></textarea>
                    </div>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td style='width:10%'>
					<label for="exampleInputEmail1" style="font-weight:bold;">전송인</label>
				</td>
				<td>
					<input style="width:100%;" type="text" class="form-control" id="exampleInputEmail1">
				</td>
				<td style="width:2%"></td>
				<td style="width:10%">
					 <a class="btn btn-white" style="width:100%" href="#modal-dialog_test" data-toggle="modal" id="addSend">추가</a>
				</td>
			</tr>
		</table>
		<br><br><br>
		<table style="width:90%; margin:0 auto;">
			<tr>
				<td>
					<div class="form-group">
                                    <a class="btn btn-success" style="width: 100%" id="applyGo">전송</a>
                                </div>
				</td>
				<td style="width:5%"></td>
				<td>
					<div class="form-group">
                                    <a class="btn btn-danger" style="width: 100%" id="votingCandidate">취소</a>
                                </div>
				</td>
			</tr>
		</table>
	</div>
</div>
<!-- 전송인 추가 modal -->
<div class="modal fade" id="modal-dialog_test">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">전송인 추가</h4>
			</div>
			<div class="modal-body">
                 <table style="width:95%; margin:0 auto;">
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
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" id="plusSendMessageReg">전송인 추가</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	/* 클릭시마다 모달창 value 비우기 function */
	$(function(){
		$("#addSend").click(function(){
			console.log("클릭크");
			$("#candidateInfoDong").val("");
			$("#candidateInfoHo").val("");
			$("#candidateInfoName").val("");
			$("#residentPhone").val("");
		})
	});

	/* 선택된 동에 따라 호수 변화 function */
	$(function(){
		var bdNm = 0;
		var sendReg = "";

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
						var $optionHo = $("<option>").val($optionText);
						$optionHo.append($optionText);
						$("#candidateInfoName").append($optionHo);
					}

					/* 전송인 input에 value추가 function */
					$("#plusSendMessageReg").click(function(){
						sendReg += $("#residentPhone").val();
						console.log(sendReg)
					});

				},
			});

		});

	});


</script>
</body>
</html>