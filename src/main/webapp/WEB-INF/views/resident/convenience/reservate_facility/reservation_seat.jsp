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
</head>
<body class="pace-top">
<script type="text/javascript">
$(document).ready(function() {

	$("input[type='checkbox'][name='agreeCheck']").click(function(){
		console.log("click");
		if($(this).prop("checked")){
			console.log("true");
			$("input[type='checkbox'][name='agreeCheck']").prop("checked", false);
			$(this).prop("checked", true);
		}
	});

	var date = new Date();
	var day = date.getDate() + "";
	var year = date.getFullYear();
	var month = date.getMonth() + 1 + "";
	var day2;
	if(day.length == 1){
		day2 = "0" + day;
	}else{
		day2 = day
	}
	var month2;
	if(month.length == 1){
		month2 = "0" + month;
	}else{
		month2 = month
	}
	var result = year + "/" + month2 + "/" + day2
	$("#propUseDt").val(result);

});
</script>
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
		<div class="row">
		   <div class="col-md-12">
		       <div class="panel panel-inverse">
		           <div class="panel-heading">
		            	<h4 class="panel-title">예약 진행하기</h4>
		           </div>
		           <div class="panel-body">
		                <form action="/" method="POST" data-parsley-validate="true" name="form-wizard">
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
		                                            	<div class="form-group block1" style="margin-bottom:0px">
		                                              	<br>
														<label style="font-weight:bold">좌석 선택</label>
														</div>
														<!-- 좌석선택 div -->
														<table style="width:100%">
															<tr>
																<td style="width:70%">
																	<div style="border:1px solid lightgray; width:80%; height:500px">
																		<table border="1" style="width:100%; height:100%" id="selectTable">
																			<c:forEach begin="1" end="${ maxNumber }" var="num1">
																				<tr style="text-align:center">
																					<c:forEach begin="1" end="${ maxNumber }" var="num2">
																					<c:set var="set" value="${ num1 }_${ num2 }"></c:set>
																						<td id="${ set }" style="width:${ widthSize }%;">
																							<c:forEach var="propSeatList" items="${ propSeatList }">
																								<c:if test="${ propSeatList.facPositionNum eq set}">
																									<i class="fa fa-2x fa-exclamation"></i>
																								</c:if>
																							</c:forEach>
																							<c:forEach var="seatList" items="${ seatList }">
																								<c:if test="${ seatList.facPositionNum eq set}">
																									<i class="fa fa-2x fa-heart-o" id="nonSelect"></i>
																								</c:if>
																							</c:forEach>
																						</td>
																					</c:forEach>
																				</tr>
																			</c:forEach>
																		</table>
																	</div>
																</td>
																<td>
																	<table>
																		<tr>
																			<td align="center"><i class="fa fa-2x fa-exclamation"></i></td>
																			<td style="width:20px"></td>
																			<td align="center">사용불가</td>
																		</tr>
																		<tr><td><br></td></tr>
																		<tr>
																			<td align="center"><i class="fa fa-2x fa-heart-o"></i></td>
																			<td style="width:20px"></td>
																			<td align="center">사용가능</td>
																		</tr>
																		<tr><td><br></td></tr>
																		<tr>
																			<td align="center"><i class="fa fa-2x fa-heart"></i></td>
																			<td style="width:20px"></td>
																			<td align="center">선택좌석</td>
																		</tr>
																	</table>
																</td>
															</tr>
													</table>
													<br><br>
													<div class="form-group block1">
				                                              <br>
														<label style="font-weight:bold">선택된 좌석</label>
														<input type="text" id="selectSeat" name="propSeat" class="form-control pull-right" data-parsley-group="wizard-step-2">
													</div>
													<br><br><br>
													<div>
														<label style="font-weight:bold">상세정보</label>
														<div>
															<textarea placeholder="${ reserv.facDetailInfo }" cols="5" style="resize:none; width:100%; height:80px" readonly="readonly" ></textarea>
														</div>
													</div>
													<br>
													<div>
														<label style="font-weight:bold">예약안내</label>
														<div>
															<textarea placeholder="${ reserv.facRsrvInfo }" cols="5" style="resize:none; width:100%; height:80px" readonly="readonly" ></textarea>
														</div>
													</div>
													<br>
													<div>
														<label style="font-weight:bold">이용안내</label>
														<div>
															<textarea placeholder="${ reserv.facUseInfo }" cols="5" style="resize:none; width:100%; height:80px" readonly="readonly" ></textarea>
														</div>
													</div>
													<br>
	                                                <div class="form-group">
	                                                    <label style="font-weight:bold">이용날짜</label>
	                                                    <div class="controls">
	                                                        <input type="text" id="propUseDt" class="form-control" data-parsley-group="wizard-step-2" required readonly="readonly"/>
	                                                    </div>
	                                                </div>
	                                                <br>
	                                                <br>
		                                       </div>
		                                   </div>
		                         </fieldset>
							</div>
							<!-- 3.신청인 정보 -->
							<div class="wizard-step-3">
								<fieldset>
									<legend class="pull-left width-full">신청인 정보</legend>
                                        <div class="row">
                                            <!-- begin col-4 -->
                                            <div style="width:90%; margin:0 auto;">
                                                 <div class="form-group">
                                                    <label style="font-weight:bold">신청인 명</label>
                                                    <div class="controls">
                                                        <input type="text" name="username" class="form-control" data-parsley-group="wizard-step-3" required value="${ loginUser.residentNm }"/>
                                                    </div>
                                                </div>
                                                 <div class="form-group">
                                                    <label style="font-weight:bold">연락처</label>
                                                    <div class="controls">
                                                        <input type="text" name="rsrvPhone" class="form-control" data-parsley-group="wizard-step-3" required value="${ loginUser.residentPhone }"/>
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
                                     <p>예약신청서 작성 완료되었습니다 예약버튼 클릭 시 예약이 완료처리 되고 메인페이지로 돌아갑니다.</p>
                                     <p id="returnMain"><a class="btn btn-success btn-lg" onclick="return seatReservationGo(${ reserv.facSeq });">예약</a></p>
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
	var result = 1;
	/* 좌석선택 function */
	$(document).on('click', '#selectTable .fa-heart-o', function(){
		console.log("클릭");
		if(result == 1){
			$(this).removeClass("fa-heart-o");
			$(this).addClass("fa-heart");
			$("#selectSeat").val($(this).parent("td").attr('id'));
			result++;
		}else{
			alert("좌석은 한개만 선택하실 수 있습니다.");
		}
	});
	/* 좌석해제 function */
	$(document).on('click', '#selectTable .fa-heart', function(){
		console.log("선택좌석 해제");
		if(result > 1){
			$(this).removeClass("fa-heart");
			$(this).addClass("fa-heart-o");
			$("#selectSeat").val("");
			result = 1;
		}
	});
	/* 예약신청서 작성완료 및 insert function */
	function seatReservationGo(facSeq) {

		var facSeq = facSeq;
		var propSeat = $("#selectSeat").val();

		console.log("facSeq :" + facSeq);
		console.log("propSeat : " + propSeat);

		$.ajax({
            type: "POST",
            url: "/onepart/resident/insertReservation_seat",
            data:{facSeq:facSeq, propSeat:propSeat},
            success: function (data) {
            	$.ajax({
        			url:"/onepart/resident/menuReservateFacility",
        			dataType:"html",
        			success:function(result){
        				$("#content").html(result);
        			}
        		});
            },
            error: function (e) {

            }
        });
	}
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
		/* 예약날짜 해당 날짜로 value지정 function */
		var date = new Date();
		var day = date.getDate() + "";
		var year = date.getFullYear();
		var month = date.getMonth() + 1 + "";
		var day2;
		if(day.length == 1){
			day2 = "0" + day;
		}else{
			day2 = day
		}
		var month2;
		if(month.length == 1){
			month2 = "0" + month;
		}else{
			month2 = month
		}
		var result = year + "/" + month2 + "/" + day2
		$("#propUseDt").val(result);

	});
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
		App.init();
		FormWizardValidation.init();
	});

	$(function() {
		console.log("AAAA");
		  $('input[name="datetimes"]').daterangepicker({
		    timePicker: true,
		    startDate: moment().startOf('hour'),
		    endDate: moment().startOf('hour').add(32, 'hour'),
		    locale: {
		      format: 'M/DD hh:mm A'
		    }
		  });
		});


</script>
</body>
</html>