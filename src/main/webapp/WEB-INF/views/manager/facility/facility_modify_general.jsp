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
<jsp:include page="../facility/facility_include.jsp"></jsp:include>
<div style="width:85%; margin:0 auto">
	<!-- 전체 div -->
	<div>
		<!-- 시설물 수정 (예약) div -->
		<div>
		<form action="" method="post" enctype="multipart/form-data" id="fileUploadForm">
			<h4>시설물 수정 (예약)</h4>
			<div align="center" style="background:white">
				<br><br>
				<table style="width:90%">
					<tr>
						<td style="font-weight:bold; width:20%; font-size:1.2em">시설명<input type="hidden" class="form-control" placeholder="Default input" id="facSeq" name="facSeq" value="${ rs.facSeq }"></td>
						<td colspan="3"><input type="text" class="form-control" value="${ rs.facNm }" id="facNm" name="facNm"></td>
					</tr>
					<tr>
						<td style="height:10px"></td>
					</tr>
					<tr>
						<td style="font-weight:bold; font-size:1.2em">위치</td>
						<td colspan="3"><input type="text" class="form-control" value="${ rs.facPosition }" id="facPosition" name="facPosition"></td>
					</tr>
					<tr>
						<td style="height:10px"></td>
					</tr>
					<tr>
						<td style="font-weight:bold; font-size:1.2em">이용요일</td>
						<c:set var="availWeek" value="${ rs.facAvailWeekOfDay }"></c:set>
						<c:set var="startWeek" value="${fn:substring(availWeek,0,1) }"></c:set>
						<c:set var="endWeek" value="${fn:substring(availWeek,4,5) }"></c:set>
						<td>
							<input type="hidden" value="${ startWeek }" id="startWeek">
							<select class="form-control input-sm" id="facAvailWeekOfDayStart">
                                 	<option>월</option>
                                 	<option>화</option>
                                 	<option>수</option>
                                 	<option>목</option>
                                 	<option>금</option>
                                 	<option>토</option>
                                 	<option>일</option>
                          		</select>
						</td>
						<td style="text-align:center">~ </td>
						<td>
							<input type="hidden" value="${ endWeek }" id="endWeek">
							<select class="form-control input-sm" id="facAvailWeekOfDayEnd">
                                 	<option>월</option>
                                 	<option>화</option>
                                 	<option>수</option>
                                 	<option>목</option>
                                 	<option>금</option>
                                 	<option>토</option>
                                 	<option>일</option>
                          		</select>
                          		<input type="text" id="facAvailWeekOfDay" name="facAvailWeekOfDay">
						</td>
					</tr>
					<tr>
						<td style="height:10px"></td>
					</tr>
					<tr>
						<td style="font-weight:bold; font-size:1.2em">이용시간</td>
						<c:set var="availTime" value="${ rs.facAvailTm }"></c:set>
						<c:set var="startTime" value="${fn:substring(availTime,0,5) }"></c:set>
						<c:set var="endTime" value="${fn:substring(availTime,8,13) }"></c:set>
						<td>
							<input type="hidden" value="${ startTime }" id="startTime">
							<select class="form-control input-sm" id="facAvailTmStart">
                                 	<option>09:00</option>
                                 	<option>10:00</option>
                                 	<option>11:00</option>
                                 	<option>12:00</option>
                                 	<option>13:00</option>
                                 	<option>14:00</option>
                                 	<option>15:00</option>
                                 	<option>16:00</option>
                                 	<option>17:00</option>
                                 	<option>18:00</option>
                                 	<option>19:00</option>
                                 	<option>20:00</option>
                                 	<option>21:00</option>
                              		<option>22:00</option>
                          		</select>
						</td>
						<td style="text-align:center">~ </td>
						<td>
							<input type="hidden" value="${ endTime }" id="endTime">
							<select class="form-control input-sm" id="facAvailTmEnd">
                                 	<option>10:00</option>
                                 	<option>11:00</option>
                                 	<option>12:00</option>
                                 	<option>13:00</option>
                                 	<option>14:00</option>
                                 	<option>15:00</option>
                                 	<option>16:00</option>
                                 	<option>17:00</option>
                                 	<option>18:00</option>
                                 	<option>19:00</option>
                                 	<option>20:00</option>
                                 	<option>21:00</option>
                              		<option>22:00</option>
                              		<option>23:00</option>
                          		</select>
                          		<input type="text" id="facAvailTm" name="facAvailTm">
						</td>
					</tr>
					<tr>
						<td style="height:10px"></td>
					</tr>
					<tr>
						<td style="font-weight:bold; font-size:1.2em">이용료</td>
						<td colspan="3"><input type="text" class="form-control" value="${ rs.facDefaultFee }" id="facDefaultFee" name="facDefaultFee"></td>
					</tr>
					<tr>
						<td style="height:10px"></td>
					</tr>
					<tr>
						<td style="font-weight:bold; font-size:1.2em">수용인원</td>
						<td colspan="3"><input type="text" class="form-control" value="${ rs.facMaxHead }" id="facMaxHead" name="facMaxHead"></td>
					</tr>
					<tr>
						<td style="height:10px"></td>
					</tr>
					<tr>
						<td style="font-weight:bold; font-size:1.2em">면적</td>
						<td colspan="3"><input type="text" class="form-control" value="${ rs.facSquareMeasure }" id="facSquareMeasure" name="facSquareMeasure"></td>
					</tr>
					<tr>
						<td style="height:15px"></td>
					</tr>
					<tr>
						<td colspan="2" style="font-weight:bold; font-size:1.2em">상세정보</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea id="facDetailInfo" name="facDetailInfo" class="form-control" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 141px;">${ rs.facDetailInfo }</textarea>
						</td>
					</tr>
					<tr>
						<td style="height:15px"></td>
					</tr>
					<tr>
						<td colspan="4" style="font-weight:bold; font-size:1.2em">예약안내</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea id="facRsrvInfo" name="facRsrvInfo" class="form-control" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 141px;">${ rs.facRsrvInfo }</textarea>
						</td>
					</tr>
					<tr>
						<td style="height:15px"></td>
					</tr>
					<tr>
						<td colspan="4" style="font-weight:bold; font-size:1.2em">이용안내</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea id="facUseInfo" name="facUseInfo" class="form-control" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 141px;">${ rs.facUseInfo }</textarea>
						</td>
					</tr>
					<tr>
						<td style="height:15px"></td>
					</tr>
					<tr>
						<td colspan="4" style="font-weight:bold; font-size:1.2em">사진등록</td>
					</tr>
					<tr>
						<td colspan="4">
							<table style="width:100%">
								<tr>
									<td colspan="2">
										<small style="font-weight:bold;">메인사진</small>
									</td>
								</tr>
								<tr>
									<td style="width:18%;">
										<table style="width:100%;">
											<tr>
												<td style="width:100%; height:200px" id="changeFirstImgTd">
													<img alt="" src="${ contextPath }/resources/uploadFiles/reservation/${ rs.changeNm }" style="width:100%; height:100%">
													<c:set var="fileId" value="fileImg_${ rs.imageSeq }"></c:set>
													<input type="file" id="${ fileId }" class="fileImg" name="mainfiles" onchange="loadImg(this)">
												</td>
											</tr>
											<tr>
												<td style="height:5px"></td>
											</tr>
											<tr>
												<td><a class="btn btn-default" style="width:100%" id="changeFirstImg">수정</a></td>
											</tr>
										</table>
									</td>
									<td></td>
								</tr>
							</table>
							<br>
							<table style="width:100%">
								<tr>
									<td colspan="2">
										<small style="font-weight:bold;">서브사진</small>
									</td>
								</tr>
								<tr>
									<td style="width:100%;">
										<table style="width:100%;">
											<tr id="changeSecondImgTr">
												<c:forEach var="rsImage" items="${ rsImage }">
													<td style="width:18%; height:200px" id="changeSecondImgTd">
														<img src="${ contextPath }/resources/uploadFiles/reservation/${ rsImage.changeNm }" style="width:100%; height:100%">
														<c:set var="fileId" value="fileImg_${ rsImage.imageSeq }"></c:set>
														<input type="file" id="${ fileId }" class="fileImg" name="files" onchange="loadImg2(this)">
													</td>
													<td style="width:3%"></td>
												</c:forEach>
													<td></td>
											</tr>
											<tr>
												<c:forEach var="rsImage" items="${ rsImage }">
													<td style="height:5px"></td>
													<td style="width:3%"></td>
												</c:forEach>
													<td></td>
											</tr>
											<tr>
												<c:forEach var="rsImage" items="${ rsImage }">
													<td><a class="btn btn-default" style="width:100%" onclick="changeSecondImg(${ rsImage.imageSeq })">수정</a></td>
													<td style="width:3%"></td>
												</c:forEach>
													<td></td>
											</tr>
										</table>
									</td>
									<td>
										<input type="hidden" id="resultImgArr" name="resultImgArr">
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<br><br><br><br>
				<table style="width:90%; margin:0 auto;">
					<tr>
						<td><a class="btn btn-success" style="width:100%" id="btnSubmit">수정</a></td>
						<td style="width:5%"></td>
						<td><a class="btn btn-danger" style="width:100%">취소</a></td>
					</tr>
				</table>
				<br><br>
			</div>
			<br><br>
            </form>
		</div>
	</div>
</div>
<script type="text/javascript">
	var changeImgArr = new Array();
	/* input tyle file hide() 시켜주는 fucntion */
	$(function(){
		$(".fileImg").each(function(){
			$(this).hide();
		});
	});

	/* 서브이미지중 수정 원하는 이미지만 수정하는 function */
	function changeSecondImg(imageSeq) {
		var resultId = "#fileImg_" + imageSeq;
		$(resultId).click().change(function(){
			console.log("서브이미지 변경");
		});
	}
	function loadImg2(value) {
        if(value.files && value.files[0]) {
           var reader = new FileReader();

           reader.onload = function(e) {
				$(value).parent().children('img').attr("src", e.target.result);
           }

           reader.readAsDataURL(value.files[0]);
           changeImgArr.push($(value).attr('id'));
           $("#resultImgArr").val(changeImgArr);
           console.log(changeImgArr);
        }
     }

	/* 메인이미지 수정버튼 클릭 시 img 태그 변경 function */
	$("#changeFirstImg").click(function(){
		$("#changeFirstImgTd input[type=file]").click();
	});
	function loadImg(value) {
        if(value.files && value.files[0]) {
           var reader = new FileReader();

           reader.onload = function(e) {
				$(value).parent().children('img').attr("src", e.target.result);
           }

           reader.readAsDataURL(value.files[0]);
           $("#resultImgArr").val(changeImgArr);
           console.log(changeImgArr);
        }
     }

	/* 시설물 수정내역  update function */
	$(function(){
		$("#facAvailWeekOfDay").hide();
		$("#facAvailTm").hide();

		$(".fileImg").each(function(){
			console.log("fileImg");
			$(this).change(function(){

			})
		});


		$("#btnSubmit").click(function (event) {
	        event.preventDefault();
	        var facAvailWeekOfDayStart = $("#facAvailWeekOfDayStart").val();
			var facAvailWeekOfDayEnd = $("#facAvailWeekOfDayEnd").val();
			var facAvailWeekOfDay = facAvailWeekOfDayStart + " ~ " + facAvailWeekOfDayEnd;
			$("#facAvailWeekOfDay").val(facAvailWeekOfDay);
			console.log($("#facAvailWeekOfDay").val())
			var facAvailTmStart = $("#facAvailTmStart").val();
			var facAvailTmEnd = $("#facAvailTmEnd").val();
			var facAvailTm = facAvailTmStart + " ~ " + facAvailTmEnd;
			$("#facAvailTm").val(facAvailTm);
			console.log($("#facAvailTm").val())


	        var form = $('#fileUploadForm')[0];

	        var data = new FormData(form);

	        $("#btnSubmit").prop("disabled", true);

	        $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "/onepart/manager/update_facility_general",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (data) {
	            	$.ajax({
	        			url:"/onepart/manager/menuFacility",
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

	/* 이용요일 select option default값 지정 function */
	$(function(){
		var startWeek = $("#startWeek").val();
		console.log("시작 : " + startWeek);
		var endWeek = $("#endWeek").val();
		console.log("끝 : " + endWeek);
		$("#facAvailWeekOfDayStart option").each(function(){
			if($(this).text() == startWeek){
				$(this).attr("selected", true);
			}
		});
		$("#facAvailWeekOfDayEnd option").each(function(){
			if($(this).text() == endWeek){
				$(this).attr("selected", true);
			}
		});
	});

	/* 이용시간 select option default값 지정 function */
	$(function(){
		var startTime = $("#startTime").val();
		console.log("시작 : " + startTime);
		var endTime = $("#endTime").val();
		console.log("끝 : " + endTime);
		$("#facAvailTmStart option").each(function(){
			if($(this).text() == startTime){
				$(this).attr("selected", true);
			}
		});
		$("#facAvailTmEnd option").each(function(){
			if($(this).text() == endTime){
				$(this).attr("selected", true);
			}
		});
	});
</script>
</body>
</html>