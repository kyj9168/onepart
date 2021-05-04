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
		<!-- 새 시설물 등록 (좌석) div -->
		<div>
		<form action="" method="post" enctype="multipart/form-data" id="fileUploadForm">
			<h4>새 시설물 등록 (좌석)</h4>
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
				<br><br><br>
				<table style="width:90%">
					<tr>
						<td colspan="2" style="font-weight:bold; font-size:1.2em">시설 사진 등록
						</td>
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
				</table>
				<br>
				<!-- 좌석등록 div -->
				<table style="width:90%">
					<tr>
						<td style="height:20px" colspan="3"></td>
					</tr>
					<tr>
						<td colspan="3" style="font-weight:bold; font-size:1.2em">좌석 정보 입력</td>
					</tr>
					<tr>
						<td style="width:70%"><input type="text" class="form-control" placeholder="Default input" style="width:100%;" id="seatMaxNum" name="seatMaxNum"></td>
						<td style="font-size:blod;">&nbsp;개&nbsp;&nbsp;</td>
						<td style="width:25%"><button type="button" class="btn btn-success m-r-5 m-b-5" onclick="createSeat();" style="width:100%">생성</button></td>
					</tr>
					<tr>
						<td style="height:5px"></td>
					</tr>
					<tr>
						<td colspan="3">
							원하는 위치를 클릭하여
							좌석을 생성하세요!
							클릭 순서로 좌석번호가
							부여되며 재클릭시 해제됩니다.
						</td>
					</tr>
					<tr>
						<td style="height:15px"></td>
					</tr>
					<tr>
						<!-- 좌석생성 테이블 div -->
						<td colspan="4" id="seatArea" align="center">
						<input type="hidden" id="seatArr" name="seatArr">
						</td>

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
						<td><a class="btn btn-success" style="width:100%" id="btnSubmit2">등록</a></td>
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
			</form>
			<br><br><br>
		</div>
	</div>
</div>
<script type="text/javascript">
	var seatArr = new Array();
	/* 입력값에 따른 좌석 div 생성 function */
	function createSeat() {
		var createSeat = $("#seatMaxNum").val();
		var num = 1;
		var resultNum = 1;
		$("#seatArea table").remove();
		console.log(createSeat);
		var $table = $("<table border='1' style='width:500px; height:500px; text-align:center;'>");
		for(var i = 1; i <= createSeat; i++){
			console.log("tr생성");
			var $tr = $("<tr id='seatTr'>");
			for(var j = 1; j <= createSeat; j++){
				var id = i + "_" + j;

				var $td = $("<td id='" + id + "' class='nonCheck'>");
				var $p = $("<p>");
				$p.append(id)
				$td.append($p);
				$tr.append($td);
				num++;
			}
			$table.append($tr);
		}
		$("#seatArea").append($table);

		$(document).on('click', '#seatTr .nonCheck', function(){
			console.log("좌석추가");
			$(this).children().remove();
			$(this).removeClass("nonCheck");
			$(this).addClass("Checked");
			var $p = $("<p style='font-weight:bold'>");
			$p.append(resultNum);
			$(this).css("background", "#00acac").append($p);
			seatArr.push($(this).attr('id'));
			console.log("좌석 배열 : " + seatArr);
			$("#seatArr").val(seatArr);
			resultNum++;
		});

		$(document).on('click', '#seatTr .Checked', function(){
			console.log("좌석취소");
			$(this).children().remove();
			$(this).removeClass("Checked");
			$(this).addClass("nonCheck");
			var appendNonCheck = $(this).attr('id')
			var $p = $("<p>");
			$p.append(appendNonCheck);
			$(this).css("background", "white").append($p);
			seatArr.splice(seatArr.indexOf($(this).attr('id')), 1);
			console.log("좌석 배열 : " + seatArr);
			$("#seatArr").val(seatArr);
			resultNum = resultNum - 1;
		});
	}

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
	/* 새 좌석 시설물 inser function */
	$(function(){
		$("#btnSubmit2").click(function (event) {
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

	        $("#btnSubmit2").prop("disabled", true);

	        $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "/onepart/manager/insert_newFacility_seat",
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