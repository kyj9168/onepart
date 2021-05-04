<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Color Admin | Wizards + Validation</title>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body class="pace-top">
<div>
	<!-- 시설물 정보 div -->
	<div style="width:85%; margin:0 auto">
	<br>
	<h2>시설물 예약하기</h2>
	<br><br><br>
		<ul class="result-list">
             <li>
                 <div class="result-image" style="width:20%">
                     <a href="javascript:;"><img src="${ contextPath }/resources/uploadFiles/reservation/${ reserv.changeNm }" alt="" /></a>
                 </div>
                 <div class="result-info" style="width:65%">
                 	<br>
                     <h4 class="title"><a href="javascript:;">${ reserv.facNm }</a></h4>
                     <br>
                     <p class="desc" style="margin-bottom:5px">
                        	 위치 : ${ reserv.facPosition }
                     </p>
                     <p class="desc" style="margin-bottom:5px">
                         	이용시간 : ${ reserv.facAvailWeekOfDay } ${ reserv.facAvailTm }
                     </p>
                     <p class="desc" style="margin-bottom:5px">
                         	이용료 : 시간당 ${ reserv.facDefaultFee }원
                     </p>
                     <p class="desc" style="margin-bottom:5px">
                         	수용인원 : ${ reserv.facMaxHead }명
                     </p>
                     <p class="desc" style="margin-bottom:5px">
                         	면적 : ${ reserv.facSquareMeasure }m^
                     </p>
                     <br>
                 </div>
                 <div class="result-price" align="center">
                 	<div style="margin:auto auto;">
                 	<h4>상세보기 QR code</h4>
                     <img src="${ contextPath }/resources/images/QR Code.PNG" alt="" style="width:50%" />
                     </div>
                 </div>
             </li>
        </ul>
	</div>
	<br><br><br><br>
	<!-- 시설물 예약 wizard div -->
	<div class="register register-with-news-feed" style="width:85%; margin:0 auto;">
	<!-- begin 위자드 -->
	<div class="row">
    	<div class="col-md-12">
             <div class="panel panel-inverse">
                 <div class="panel-heading">
                    <h4 class="panel-title">예약 진행하기</h4>
                 </div>
                 <div class="panel-body">
                 <form action="" method="POST" data-parsley-validate="true" name="form-wizard">
					<!-- 예약 진행 순서 -->
					<div id="wizard" >
						<ol style="padding-left:0px">
							<li style="width: 26%">
							   약관동의
							    <small>공공시설물을 예약하기 위한 약관동의와
								주의사항을 확인합니다.</small>
							</li>
							<li style="width: 27%">
							    시설물정보 및 예약사항
							    <small>공공시설물의 상세정보를 확인하고
							    원하는 시간대 및 상세 예약사항을 작성합니다.</small>
							</li>
							<li style="width: 28%">
							    신청인 정보
							    <small>신청인 정보를 작성합니다.</small>
							</li>
							<li style="width: 19%">
							  예약완료
							    <small></small>
							</li>
						</ol>
						<!-- 1. 약관동의 -->
						<div class="wizard-step-1">
							<fieldset>
								<legend class="pull-left width-full">약관동의</legend>
                                     <div class="row">
                                          <div style="width:90%; margin:0 auto;">
												<div class="form-group">
                                              	<br>
                                              	<label style="font-weight:bold">개인정보 수집</label>
													<div>
														<textarea placeholder="불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지
														" cols="5" style="resize:none; width:100%; height:200px" readonly="readonly" ></textarea>
													</div>
												</div>
												<br><br>
											<div class="form-group">
											<label style="font-weight:bold">시설 이용시 주의사항</label>
												<div>
													<textarea placeholder="불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지
													" cols="5" style="resize:none; width:100%; height:200px" readonly="readonly" ></textarea>
												</div>
											</div>
											<br><br>
											<div class="form-group">
												<table>
													<tr>
														<td style="font-weight:bold;">위 내용을 충분히 숙지하였으며 약관 동의 후 예약을 진행하시겠습니까?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
														<td>
															<input type="checkbox" name="agreeCheck"data-parsley-group="wizard-step-1" required>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														</td>
														<td>
															<input type="checkbox" name="agreeCheck" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아니요
														</td>
													</tr>
												</table>
											</div>
                                         </div>
                                    </div>
							</fieldset>
						</div>
						<!-- 2.시설물정보 및 예약사항 -->
						<div class="wizard-step-2">
							<fieldset>
								<legend class="pull-left width-full">시설물정보 및 예약사항</legend>
                                       <div class="row">
                                            <div style="width:90%; margin:0 auto;">
                                             	<div class="form-group block1">
                                                <br>
												<label style="font-weight:bold">예약날짜 설정</label>
													<table style="width:100%">
														<tr>
															<td style="width:100%"><input type="text" id="testDatepicker" placeholder="클릭하세요" name="test" class="form-control pull-right" data-parsley-group="wizard-step-2" style="width:100%; height:100%"></td>
														</tr>
														<tr>
															<td><br></td>
														</tr>
														<tr>
															<td colspan="2">
																<c:set var="time" value="${ reserv.facAvailTm }"></c:set>
																<c:set var="result1" value="${fn:substring(time,0,2) }"></c:set>
																<c:set var="result2" value="${ fn:substring(time,8,10) }"></c:set>
																<fmt:parseNumber var="start" type="number" value="${ result1 }"/>
																<fmt:parseNumber var="end" type="number" value="${ result2 }"/>
																<c:forEach begin="${ start }" end="${ end }" var="result">
																<input type="checkbox" name="timeCheckbox" disabled value="${ result }:00">&nbsp;&nbsp; ${ result }:00 &nbsp;&nbsp;&nbsp;&nbsp;
																</c:forEach>
															</td>
														</tr>
													</table>
												</div>
												<br><br>
												<div>
													<a style="font-weight:bold; color:black;" onclick="voiceInfo(1);">상세정보 </a><small> 클릭시 음성으로 들으실 수 있습니다.</small>
													<div>
														<textarea placeholder="${ reserv.facDetailInfo }" data-placeholder="${ reserv.facDetailInfo }" cols="5" style="resize:none; width:100%; height:80px" readonly="readonly" id="facDetailInfo"></textarea>
														<input type="hidden" value="${ contextPath }" id="contextPath">
													</div>
												</div>
												<br>
												<div>
													<a style="font-weight:bold; color:black;" onclick="voiceInfo(2);">예약안내 </a><small> 클릭시 음성으로 들으실 수 있습니다.</small>
													<div>
														<textarea placeholder="${ reserv.facRsrvInfo }" data-placeholder="${ reserv.facRsrvInfo }" cols="5" style="resize:none; width:100%; height:80px" readonly="readonly" id="facRsrvInfo"></textarea>
													</div>
												</div>
												<br>
												<div>
													<a style="font-weight:bold; color:black;" onclick="voiceInfo(3);">이용안내 </a><small> 클릭시 음성으로 들으실 수 있습니다.</small>
													<div>
														<textarea placeholder="${ reserv.facUseInfo }" data-placeholder="${ reserv.facUseInfo }" cols="5" style="resize:none; width:100%; height:80px" readonly="readonly" id="facUseInfo"></textarea>
													</div>
												</div>
												<br>
                                                 <div class="form-group">
                                                     <label style="font-weight:bold">이용날짜</label>
                                                     <div class="controls">
                                                         <input type="text" id="propUseDt" class="form-control" data-parsley-group="wizard-step-2" required readonly/>
                                                     </div>
                                                 </div>
                                                 <br>
                                                 <div class="form-group">
                                                     <label style="font-weight:bold">이용시간</label>
                                                     <div class="controls">
                                                         <input type="text" id="propUseTm" class="form-control" data-parsley-group="wizard-step-2" required readonly/>
                                                     </div>
                                                 </div>
                                                 <br>
                                                 <div class="form-group">
                                                     <label style="font-weight:bold">총 사용시간</label>
                                                     <div class="controls">
                                                         <input type="text" id="allUserTm" class="form-control" data-parsley-group="wizard-step-2" required readonly/>
                                                         <input type="hidden" id="facDefaultFee" value="${ reserv.facDefaultFee }"/>
                                                         <input type="hidden" id="facSeq" value="${ reserv.facSeq }"/>
                                                         <input type="hidden" id="residentSeq" value="${ sessionScope.loginUser.residentSeq }"/>
                                                     </div>
                                                 </div>
                                                 <br>
                                                 <div class="form-group">
                                                     <label style="font-weight:bold">사용료 (원)</label>
                                                     <div class="controls">
                                                         <input type="text" id="toalFee" class="form-control" data-parsley-group="wizard-step-2" required readonly/>
                                                     </div>
                                                 </div>
                                                 <br>
                                                 <div class="form-group">
                                                     <a style="font-weight:bold; color:black;" onclick="voiceWrite(1);">사용목적 </a>
                                                     <div class="controls">
                                                         <textarea id="usePurpose" style="resize:none" rows="10" cols="50" name="username" class="form-control" data-parsley-group="wizard-step-2" required></textarea>
                                                     </div>
                                                 </div>
                                                 <br>
                                                 <div class="form-group">
                                                     <a style="font-weight:bold; color:black;" onclick="voiceWrite(2);">기타사항 </a>
                                                     <div class="controls">
                                                         <textarea id="etc" style="resize:none" rows="10" cols="50" name="username" class="form-control" data-parsley-group="wizard-step-2" required></textarea>
                                                     </div>
                                                </div>
                                           </div>
                                      </div>
                             </fieldset>
						</div>
						<!-- 3.신청인 정보 -->
						<div class="wizard-step-3">
							<fieldset>
								<legend class="pull-left width-full">신청인 정보</legend>
                                       <div class="row">
                                           <div style="width:90%; margin:0 auto;">
                                           	 <div class="form-group">
                                                   <label style="font-weight:bold">개인 / 단체</label>
                                                   <div class="controls">
                                                       <input type="checkbox" id="rsrvGroupType" name="choiceCheck" data-parsley-group="wizard-step-3" required value="one"/> 개인 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                       <input type="checkbox" id="rsrvGroupType" name="choiceCheck" data-parsley-group="wizard-step-3" required value="more"/> 단체
                                                   </div>
                                               </div>
                                               <div class="form-group" id="hiddenDiv">
                                                   <label style="font-weight:bold">사용인원 (명)</label>
                                                   <div class="controls">
                                                       <input type="text" id="useHeadCount"/>
                                                   </div>
                                               </div>
                                                <div class="form-group">
                                                   <label style="font-weight:bold">신청인 / 신청단체 명</label>
                                                   <div class="controls">
                                                       <input type="text" id="rsrvNm" class="form-control" data-parsley-group="wizard-step-3" required />
                                                   </div>
                                               </div>
                                                <div class="form-group">
                                                   <label style="font-weight:bold">연락처</label>
                                                   <div class="controls">
                                                       <input type="text" id="rsrvPhone" class="form-control" data-parsley-group="wizard-step-3" required value="${ loginUser.residentPhone }"/>
                                                   </div>
                                               </div>
                                               <c:set var="detail" value="${fn:split(loginUser.aptDetailInfoSeq, '_')}"></c:set>
                                                <div class="form-group">
                                                   <label style="font-weight:bold">거주 동</label>
                                                   <div class="controls">
                                                       <input type="text" name="username" class="form-control" data-parsley-group="wizard-step-3" required value="${ detail[1] }동"/>
                                                   </div>
                                               </div>
                                                <div class="form-group">
                                                   <label style="font-weight:bold">거주 호</label>
                                                   <div class="controls">
                                                       <input type="text" name="username" class="form-control" data-parsley-group="wizard-step-3" required value="${ detail[2] }호"/>
                                                   </div>
                                               </div>
                                          </div>
                                     </div>
                            </fieldset>
						</div>
						<!-- 4. 신청서 작성완료 -->
						<div>
						    <div class="jumbotron m-b-0 text-center">
                                <h1>작성 완료!</h1>
                                <p>예약신청서 작성 완료되었습니다 제출버튼 클릭 시 관리자에게 전송되고 메인페이지로 돌아갑니다.</p>
                                <p id="returnMain"><a class="btn btn-success btn-lg" onclick="return applyReservation();">제출</a></p>
                            </div>
						</div>
					</div>
				</form>
            	</div>
             </div>
         </div>
     </div>
     </div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		/* 약관동의 checkbox 중복선택 방지 function */
		$("input[type='checkbox'][name='agreeCheck']").click(function(){
			console.log("click");
			if($(this).prop("checked")){
				console.log("true");
				$("input[type='checkbox'][name='agreeCheck']").prop("checked", false);
				$(this).prop("checked", true);
			}
		});
		/* 개인 및 단체 checkbox 중복선택 방지 function */
		$("input[type='checkbox'][name='choiceCheck']").click(function(){
			console.log("click");
			if($(this).prop("checked")){
				console.log("true");
				$("input[type='checkbox'][name='choiceCheck']").prop("checked", false);
				$(this).prop("checked", true);
			}

			if($(this).val() == 'more'){
				$("#hiddenDiv").show();
			}else{
				$("#hiddenDiv").hide();
			}
		});

		$("#hiddenDiv").hide();

		$( "#testDatepicker" ).datepicker({
	    });
		/* datepicker 값 변할 때 마다 이용날짜 값 변동 및 예약가능 시간 구분 fucntion */
		$("#testDatepicker").change(function(){
			var facSeq = $("#facSeq").val();
			var testDatepicker = $("#testDatepicker").val();
			var first = testDatepicker.substr(6,10);
			var second = testDatepicker.substr(0,5);
			var propUseDt = first + "/" + second;
			$("#propUseDt").val(propUseDt);
			$.ajax({
				url:"/onepart/resident/selectDdayReservation",
				type:"post",
				data:{facSeq:facSeq, propUseDt:propUseDt},
				success:function(data){
					console.log(data.resultList);
					var list = data.resultList
					$("input[type='checkbox'][name='timeCheckbox']").each(function(){
						console.log("aaa  : " + list.indexOf($(this).val()))
						if(list.indexOf($(this).val()) == -1){
							$(this).removeAttr("disabled");
						}else{
						}
					});

				}

			});

		});
			/* 예약 시간대가 선택되었을때  이용시간 값 변동 function */
			var time = new Array();
			$("input[type='checkbox'][name='timeCheckbox']").change(function(){
				console.log($(this).val())

				//선택된값 시간대 배열에 담아 input에 출력
				if($(this).is(":checked")){
					console.log("checked!!");
					time.push($(this).val())
					$("#propUseTm").val(time);
				}else{
					console.log("unchecked!!")
					var remove = $(this).val();
					time.splice(time.indexOf($(this).val()), 1);
					$("#propUseTm").val(time);
				}
				//총사용시간 input에 출력
				$("#allUserTm").val(time.length);
				//이용금액 input에 출력
				var price = time.length * $("#facDefaultFee").val();
				$("#toalFee").val(price);
			});
	});
	/* 예약신청서 작성완료 및 insert function */
	function applyReservation() {
		var facSeq = $("#facSeq").val();
		var propUseDt = $("#propUseDt").val();
		var propUseTm = $("#propUseTm").val();
		var residentSeq = $("#residentSeq").val();
		var toalFee = $("#toalFee").val();
		var useHeadCount = $("#useHeadCount").val();
		var usePurpose = $("#usePurpose").val();
		var etc = $("#etc").val();
		var rsrvGroupType;
		$("input[name=choiceCheck]:checked").each(function(){
			rsrvGroupType = $(this).val();
		});
		var rsrvNm = $("#rsrvNm").val();
		var rsrvPhone = $("#rsrvPhone").val();

		$.ajax({
			url:"/onepart/resident/insertReservation",
			dataType:"html",
			type:"post",
			data:{facSeq:facSeq, propUseDt:propUseDt, propUseTm:propUseTm, toalFee:toalFee
				,useHeadCount:useHeadCount, usePurpose:usePurpose, etc:etc, rsrvNm:rsrvNm
				,rsrvPhone:rsrvPhone, residentSeq:residentSeq, rsrvGroupType:rsrvGroupType},
			success:function(result){
				$("#content").html(result);
			}
		});

		return false;
	}

	/* 카카오 뉴톤 function */
	function voiceInfo(data) {
		console.log(data);
		var voiceData;
		var resultData;

		if(data == 1){
			/* 상세정보 */
			voiceData = $("#facDetailInfo").data("placeholder");
			console.log(voiceData);
			resultData = "<speak><voice>" + voiceData + "</voice></speak>"
		}else if(data == 2){
			/* 예약안내 */
			voiceData = $("#facRsrvInfo").data("placeholder");
			console.log(voiceData);
		}else{
			/* 이용안내 */
			voiceData = $("#facUseInfo").data("placeholder");
			console.log(voiceData);
		}

		console.log(resultData);

		/* ajax를 통한 통신 */
		/* $.ajax({
			url:"/onepart/resident/voiceForKaKao",
			type:"get",
			data:{resultData:resultData},
			success:function(data){
				console.log("성공");
				console.log(data);
				var audio = new Audio();
			    audio.src = data;
			    audio.play();
			},
			error:function(data){
				console.log("실패");
				console.log(data);
			}
		}); */

		var audio = new Audio();
		var contextPath = $("#contextPath").val();
	    audio.src = contextPath + "/resources/uploadFiles/sounds/1569837450924.mp3";
	    audio.play();


	}

	/* 카카오 뉴통톡 function */
	function voiceWrite(data) {
		console.log(data);

		$.ajax({
			url:"/onepart/resident/voiceTalkForKaKao",
			type:"get",
			success:function(data){
				console.log("성공");
				console.log(data);
				var audio = new Audio();
			    audio.src = data;
			    audio.play();
			},
			error:function(data){
				console.log("실패");
				console.log(data);
			}
		});

		if(data == 1){
			/* 사용목적 */
		}else{
			/* 기타사항 */
		}
	}
</script>

<!-- wizard 전용 script -->
<!-- ================== BEGIN BASE JS ================== -->
<script src="${contextPath}/resources/plugins/jquery/jquery-1.9.1.min.js"></script>
<script src="${contextPath}/resources/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
<script src="${contextPath}/resources/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${contextPath}/resources/plugins/jquery-cookie/jquery.cookie.js"></script>
<!-- ================== END BASE JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="${contextPath}/resources/plugins/parsley/dist/parsley.js"></script>
<script src="${contextPath}/resources/plugins/bootstrap-wizard/js/bwizard.js"></script>
<script src="${contextPath}/resources/js/form-wizards-validation.demo.min.js"></script>
<script src="${contextPath}/resources/js/apps.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<script>
	$(document).ready(function() {
		FormWizardValidation.init();
	});
</script>
</body>
</html>