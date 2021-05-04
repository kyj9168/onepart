<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
</head>
<body>
<jsp:include page="../vote/vote_include.jsp"></jsp:include>
<!-- 전체 div -->
<div style="width:85%; margin:0 auto">
	<form action="" method="post" enctype="multipart/form-data" id="fileUploadForm2">
	<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this, 1)">
		<!-- 신청서 제출 div -->
		<table style="width:100%">
		<tr>
			<td>
				<div class="form-group">
                    <h4>신청서 제출</h4>
                </div>
			</td>
			<td></td>
		</tr>
	</table>
	<div class="panel-body" style="background:white" align="center">
		<br>
		<table style="width:95%; text-align:left;">
			<tr>
				<td style="width:7%">제목</td>
				<td style="width:45%" align="left"><input class="form-control" type="text" style="width:90%; height:100%" value="${ sessionScope.loginUser.residentNm }님의 후보자 등록신청서"></td>
				<td style="width:10%">후보구분</td>
				<td>
					<select class="form-control input-sm" id="conChoice">
						<option>선택하세요</option>
						<c:forEach var="candidateVoteList" items="${ candidateVoteList }">
							<option value="${ candidateVoteList.voteSeq }_${ candidateVoteList.voteNm }">${ candidateVoteList.voteNm }</option>
						</c:forEach>
                    </select>
					<input type="hidden" id="electVoteSeq" name="electVoteSeq">
				</td>
			</tr>
			<tr>
				<td colspan="4"><br></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<!-- 신청서 div -->
					<div>
						<br>
						<table border="1" style="width:100%; height:900px; text-align:center;">
							<tr style="text-align:center;">
								<td colspan=3 id="candidateCondition" style="height:120px">
								</td>
								<td rowspan="4">
									<div id="contentImgArea1">
										<img id="contentImg1" src="/sixDestiny/images/imageSelect.png" style="width:100%; height:100">
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:15%">동 - 호</td>
								<td colspan="2" style="height:80px">${fn:substring(loginUser.aptDetailInfoSeq,2,5)}동 ${fn:substring(loginUser.aptDetailInfoSeq,6,9)}호</td>
							</tr>
							<tr>
								<td>성 명</td>
								<td colspan="2" style="height:80px">${ loginUser.residentNm }</td>
							</tr>
							<tr>
								<td>등록기준지</td>
								<td colspan="2" style="height:80px">경기도 안양시 만안구 석수3동</td>
							</tr>
							<tr>
								<td>주소</td>
								<td colspan="3" style="height:80px">경기도 안양시 만안구 석수3동 코오롱하늘채 ${fn:substring(loginUser.aptDetailInfoSeq,2,5)}동 ${fn:substring(loginUser.aptDetailInfoSeq,6,9)}호</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td style="width:35%; height:80px">19${fn:substring(loginUser.residentBirth,0,2)}년 ${fn:substring(loginUser.residentBirth,2,4)}월 ${fn:substring(loginUser.residentBirth,4,6)}일</td>
								<td style="width:15%">성별</td>
								<c:if test="${ loginUser.residentGender == 'F' }">
									<td>여자</td>
								</c:if>
								<c:if test="${ loginUser.residentGender == 'M' }">
									<td>남자</td>
								</c:if>
							</tr>
							<tr>
								<td>최종학력</td>
								<td colspan="3" style="height:80px">
									<input type="text" style="width:95%; height:50px; border:none;" id="finalEdu" name="finalEdu">
								</td>
							</tr>
							<tr>
								<td>직장명</td>
								<td style="height:80px">
									<input type="text" style="width:95%; height:50px; border:none;" id="workNm" name="workNm">
								</td>
								<td>직위</td>
								<td>
									<input type="text" style="width:95%; height:50px; border:none;" id="workPosition" name="workPosition">
								</td>
							</tr>
							<tr>
								<td>직장주소</td>
								<td colspan="3" style="height:80px">
									<input type="text" style="width:95%; height:50px; border:none;" id="workAdd" name="workAdd">
								</td>
							</tr>
							<tr>
								<td rowspan="5">경력 및 이력</td>
								<td style="height:80px">년 월 일</td>
								<td colspan="2">경력 및 이력사항</td>
							</tr>
							<tr>
								<td>
									<p id="careerTm11" style="background-color:lightgray; color:black;padding:3px; cursor:pointer; border-radius:4px; height:35px; text-align:center;">select</p>
									<input type="hidden" style="width:95%; height:50px; border:none;" id="careerTm1" name="careerTm1">
								</td>
								<td colspan="2" style="height:80px">
									<input type="text" style="width:95%; height:50px; border:none;" id="careerCon1" name="careerCon1">
								</td>
							</tr>
							<tr>
								<td>
									<p id="careerTm22" style="background-color:lightgray; color:black;padding:3px; cursor:pointer; border-radius:4px; height:35px; text-align:center;">select</p>
									<input type="hidden" style="width:95%; height:50px; border:none;" id="careerTm2" name="careerTm2">
								</td>
								<td colspan="2" style="height:80px">
									<input type="text" style="width:95%; height:50px; border:none;" id="careerCon2" name="careerCon2">
								</td>
							</tr>
							<tr>
								<td>
									<p id="careerTm33" style="background-color:lightgray; color:black;padding:3px; cursor:pointer; border-radius:4px; height:35px; text-align:center;">select</p>
									<input type="hidden" style="width:95%; height:50px; border:none;" id="careerTm3" name="careerTm3">
								</td>
								<td colspan="2" style="height:80px">
									<input type="text" style="width:95%; height:50px; border:none;" id="careerCon3" name="careerCon3">
								</td>
							</tr>
							<tr>
								<td>
									<p id="careerTm44" style="background-color:lightgray; color:black;padding:3px; cursor:pointer; border-radius:4px; height:35px; text-align:center;">select</p>
									<input type="hidden" style="width:95%; height:50px; border:none;" id="careerTm4" name="careerTm4">
								</td>
								<td colspan="2" style="height:80px">
									<input type="text" style="width:95%; height:50px; border:none;" id="careerCon4" name="careerCon4">
								</td>
							</tr>
							<tr>
								<td colspan="4" style="height:100px">
									<br>
									위와 같이 후보자등록을 신청합니다. <br>
									입후보자 : 김 은 혜  &nbsp;&nbsp;<a id="buttonModal">(인)</a><br><br>
									선거관리위원회위원장 귀하
									<br>
									<br>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
		<p style="font-weight:bold;">
			<br><br>
			해당 신청서는 선거관리위원회에게 자동으로 전송될 예정이며 <br>
			후보등록 확정 시 신청하신 본인의 휴대전화 문자로 발송해 드립니다. <br>
		</p>
		<br><br>
		<div align="center">
			<table style="width:95%">
				<tr>
					<td><a class="btn btn-success" style="width: 100%" id="applyCandidate">제출</a></td>
					<td style="width:5%"></td>
					<td><a class="btn btn-danger" style="width: 100%" id="cancelCandidate">취소</a></td>
				</tr>
			</table>
		</div>
		<br>
	</div>
	</form>
</div>
<br><br><br>
<script>
	/* datepicker function */
	$('#careerTm11').dateRangePicker({

	   	 getValue: function()
	   		{
	   			return this.innerHTML;
	   		},
	   		setValue: function(s)
	   		{
	   			this.innerHTML = s;
	   		}
	});
	$('#careerTm22').dateRangePicker({

	   	 getValue: function()
	   		{
	   			return this.innerHTML;
	   		},
	   		setValue: function(s)
	   		{
	   			this.innerHTML = s;
	   		}
	});
	$('#careerTm33').dateRangePicker({

	   	 getValue: function()
	   		{
	   			return this.innerHTML;
	   		},
	   		setValue: function(s)
	   		{
	   			this.innerHTML = s;
	   		}
	});
	$('#careerTm44').dateRangePicker({

	   	 getValue: function()
	   		{
	   			return this.innerHTML;
	   		},
	   		setValue: function(s)
	   		{
	   			this.innerHTML = s;
	   		}
	});
	$(function(){
		$("#careerTm11").bind("DOMSubtreeModified", function(){
    		console.log($(this).text());
    		$("#careerTm1").val($(this).text());
    	});
		$("#careerTm22").bind("DOMSubtreeModified", function(){
    		console.log($(this).text());
    		$("#careerTm2").val($(this).text());
    	});
		$("#careerTm33").bind("DOMSubtreeModified", function(){
    		console.log($(this).text());
    		$("#careerTm3").val($(this).text());
    	});
		$("#careerTm44").bind("DOMSubtreeModified", function(){
    		console.log($(this).text());
    		$("#careerTm4").val($(this).text());
    	});

	});

	/* 신청서 폼 변경 script */
	$(function(){
		var name;
		var electVoteSeq;
		$("#conChoice").change(function(){
			var result = $(this).val();
			var resultArr = result.split('_');
			electVoteSeq = resultArr[0];
			$("#electVoteSeq").val(electVoteSeq);
			name = resultArr[1];
			console.log(result);
			var $h4 = $("<h4>");
			$("#candidateCondition h4").remove();
			$h4.append(name);
			$h4.append("<br>");
			$h4.append("후 보 자 등 록 신 청 서");
			$("#candidateCondition").append($h4);
		});
		/* 신청서 제출 및 insert function */
		$("#applyCandidate").click(function(event){
			event.preventDefault();
			console.log("click");
			var finalEdu = $("#finalEdu").val();
			var workNm = $("#workNm").val();
			var workPosition = $("#workPosition").val();
			var workAdd = $("#workAdd").val();
			var careerTm1 = $("#careerTm1").val();
			var careerTm2 = $("#careerTm1").val();
			var careerTm3 = $("#careerTm1").val();
			var careerTm4 = $("#careerTm1").val();
			var careerCon1 = $("#careerCon1").val();
			var careerCon2 = $("#careerCon2").val();
			var careerCon3 = $("#careerCon3").val();
			var careerCon4 = $("#careerCon4").val();

			var form = $('#fileUploadForm2')[0];
			var data = new FormData(form);

			/* var data = {
							finalEdu:finalEdu,
							workNm:workNm,
							workPosition:workPosition,
							workAdd:workAdd,
							careerTm1:careerTm1,
							careerTm2:careerTm2,
							careerTm3:careerTm3,
							careerTm4:careerTm4,
							careerCon1:careerCon1,
							careerCon2:careerCon2,
							careerCon3:careerCon3,
							careerCon4:careerCon4,
							electVoteSeq:electVoteSeq
						} */

			$.ajax({
				url:"/onepart/resident/applyCandidate",
				enctype: 'multipart/form-data',
				data:data,
				type:"post",
				processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
				success:function(result){
					$.ajax({
						url:"/onepart/resident/menuVote",
						dataType:"html",
						success:function(result){
							$("#content").html(result);
						}
					});
				}
			});

		});
	});
	/* 이미지 업로드 script */
	$(function(){
		$("#thumbnailImg1").hide();

		$("#contentImgArea1").click(function(){
            $("#thumbnailImg1").click();
         });
	});

	function loadImg(value, num) {
        if(value.files && value.files[0]) {
           var reader = new FileReader();

           reader.onload = function(e) {
              switch(num){
                 case 1 : $("#contentImg1").attr("src", e.target.result); break;
                 case 2 : $("#contentImg2").attr("src", e.target.result); break;
                 case 3 : $("#contentImg3").attr("src", e.target.result); break;
              }
           }

           reader.readAsDataURL(value.files[0]);
        }
     }

</script>
</body>
</html>