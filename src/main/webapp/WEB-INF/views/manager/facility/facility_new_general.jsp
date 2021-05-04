<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${contextPath }/resources/js/jquery.form.js"></script>
<script type="text/javascript" src="${ contextPath }/resources/js/jquery.qrcode.js"></script>
<script type="text/javascript" src="${ contextPath }/resources/js/qrcode.js"></script>
<script type="text/javascript" src="${contextPath }/resources/js/FileSaver.js"></script>
<script type="text/javascript" src="${contextPath }/resources/js/html2canvas.js"></script>
</head>
<body>
<jsp:include page="../facility/facility_include.jsp"></jsp:include>
<div style="width:85%; margin:0 auto">
	<!-- 전체 div -->
	<div>
		<!-- 새 시설물 등록 (예약) div -->
		<div>
		<form action="" method="post" enctype="multipart/form-data" id="fileUploadForm">
			<h4>새 시설물 등록 (예약)</h4>
			<div align="center" style="background:white">
				<br><br>
				<table style="width:90%">
					<tr>
						<td style="font-weight:bold; width:20%; font-size:1.2em">시설명</td>
						<td colspan="3"><input type="text" class="form-control" placeholder="Default input" id="facNm" name="facNm"></td>
					</tr>
					<tr>
						<td style="height:10px"></td>
					</tr>
					<tr>
						<td style="font-weight:bold; font-size:1.2em">위치</td>
						<td colspan="3"><input type="text" class="form-control" placeholder="Default input" id="facPosition" name="facPosition"></td>
					</tr>
					<tr>
						<td style="height:10px"></td>
					</tr>
					<tr>
						<td style="font-weight:bold; font-size:1.2em">이용요일</td>
						<td>
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
						<td>
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
						<td colspan="3"><input type="text" class="form-control" placeholder="Default input" id="facDefaultFee" name="facDefaultFee"></td>
					</tr>
					<tr>
						<td style="height:10px"></td>
					</tr>
					<tr>
						<td style="font-weight:bold; font-size:1.2em">수용인원</td>
						<td colspan="3"><input type="text" class="form-control" placeholder="Default input" id="facMaxHead" name="facMaxHead"></td>
					</tr>
					<tr>
						<td style="height:10px"></td>
					</tr>
					<tr>
						<td style="font-weight:bold; font-size:1.2em">면적</td>
						<td colspan="3"><input type="text" class="form-control" placeholder="Default input" id="facSquareMeasure" name="facSquareMeasure"></td>
					</tr>
					<tr>
						<td style="height:60px"></td>
					</tr>
					<tr>
						<td colspan="4" style="font-weight:bold; font-size:1.2em">상세정보</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea id="facDetailInfo" name="facDetailInfo" class="form-control" placeholder="Textarea" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 141px;"></textarea>
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
							<textarea id="facRsrvInfo" name="facRsrvInfo" class="form-control" placeholder="Textarea" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 141px;"></textarea>
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
							<textarea id="facUseInfo" name="facUseInfo" class="form-control" placeholder="Textarea" rows="5" style="margin: 0px 1px 0px 0px; width:100%; height: 141px;"></textarea>
						</td>
					</tr>
					<tr>
						<td style="height:15px"></td>
					</tr>
				</table>
				<!-- 사진첨부 div -->
				<br><br><br>
				<table style="width:90%">
					<tr>
						<td colspan="2" style="font-weight:bold; font-size:1.2em">시설 사진 등록</td>
					</tr>
					<tr>
						<td>
							<small>첫 사진이 메인사진으로 등록됩니다.</small>
						</td>
					</tr>
					<tr id="plusImageArea">
						<td style="width:80%" id="imgTd">
							<span class="btn btn-default fileinput-button" id="fileinputSpan" style="width:95%">
                                   <i class="fa fa-plus" id="icon"></i>
                                   <span id="text">Add files...</span>
                               </span>
                                  <input multiple="multiple" type="file" name="files" id="fileInsert">
						</td>
						<td style="width:5%">
							<button class="btn btn-default" id="plusfileinputSpan" style="width:90%" onclick="return plusImage();">
                                   <span>+</span>
                               </button>
						</td>
					</tr>
					<tr>
						<td style="height:20px"></td>
					</tr>
					<tr>
						<td><br><br><td>
					</tr>
					<tr>
						<td colspan="2" style="font-weight:bold; font-size:1.2em">QR코드</td>
					</tr>
					<tr>
						<td>
							<div style="width:200px; height:200px; border:1px solid lightgray" id="gcDiv"></div>
						</td>
					</tr>
				</table>
				<br><br><br><br>
				<table style="width:90%; margin:0 auto;">
					<tr>
						<td><a class="btn btn-success" style="width:100%" id="btnSubmit">등록</a></td>
						<td style="width:5%"></td>
						<td><a class="btn btn-danger" style="width:100%">취소</a></td>
						<td style="width:5%"></td>
						<td>
							<a class="btn btn-primary" style="width:100%" id="saveQRCODE">완료</a>
						</td>
					</tr>
				</table>
				<br><br>
			</div>
			<br><br>
               <div>
               </div>
               </form>
               <br><br><br>
		</div>
	</div>
</div>
<script type="text/javascript">
	var result = 1;
	/* 이미지 추가버튼 추가용 function */
	function plusImage() {

		result++;
		console.log(result);
		var plusImageArea = $("#plusImageArea");
		var imgTr = $("<tr>");
		var imgTd = $("<td>").css("width", "80%");
		var fileinputSpan = $("<span class='btn btn-default fileinput-button' id='fileinputSpan'>").css("width", "95%");
		var icon = $("<i class='fa fa-plus'>");
		var text = $("<span>").text("Add files...");
		var inputFile = $("<input multiple='multiple' type='file' name='files' id='fileInsert'>").hide();

		fileinputSpan.id = 'fileinputSpan';

		fileinputSpan.append(icon);
		fileinputSpan.append(text).click(function(){
			inputFile.click().change(function(){
				fileinputSpan.text($(this).val())
			});
		});
		imgTd.append(fileinputSpan);
		imgTd.append(inputFile);
		imgTr.append(imgTd);
		plusImageArea.after(imgTr);



		plusImageArea.after("<br>");

		if(result == '5'){
			console.log("aa");
			$("#plusfileinputSpan").prop("disabled", true);
		}

		return false;

	}
	/* 버튼클릭시 해당 type file input 클릭용 function */
	$(function(){
		$("#fileInsert").hide();
		$("#facAvailWeekOfDay").hide();
		$("#facAvailTm").hide();

		$("#fileinputSpan").click(function(){
			console.log("click!!")
	              $("#fileInsert").click();
	           });

		$("#fileInsert").change(function(){
			$("#fileinputSpan").text($(this).val());
		});
	});
	/* 새 예약 시설물 inser function */
	$(function(){
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
			console.log($("#fileInsert").val())


	        var form = $('#fileUploadForm')[0];

	        var data = new FormData(form);

	        $("#btnSubmit").prop("disabled", true);

	        $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "/onepart/manager/insert_newFacility_general",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (data) {
            		console.log("seq :: " + data.facSeq);
            		if(confirm("모바일전용 QR코드를 생성하시겠습니까?")){
	            		$("#gcDiv").qrcode({
							render:"table",
							width:200,
							height:200,
							text:"http://192.168.200.147:8001/detailMoreReservation?facSeq="+data.facSeq
						});
            		};
	            },
	            error: function (e) {

	            }
	        });

	    });
	});

	/* qr코드저장하기 */
	$(function(){
		$("#saveQRCODE").click(function() {
			$.ajax({
				url:"/onepart/manager/menuFacility",
				dataType:"html",
				success:function(result){
					$("#content").html(result);
				}
			});
	    });
	});
</script>
</body>
</html>