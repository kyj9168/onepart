<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
제이쿼리
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 -->
<style>
.visitCarTable {
	width: 100%;
}

.visitCarTable td {
	padding: 10px;
}
</style>
</head>
<body>

	<div class="panel-body bg-white" style="text-align: center;">
		<form action="" method="GET" class="form-horizontal form-bordered" id="registerVisicarForm" >
			<h2 class="m-t-0">방문 차량 등록</h2>

			<table class="visitCarTable">
				<tr>
					<td>
						<button class='btn btn-sm btn-info' style="float: right;"
							onclick="return moveListVisitCar()">차량등록
							리스트보기</button>
					</td>
				</tr>


				<tr>
					<td><input name="visitCarNum" id="visitCarNum"
						class="form-control input-lg" type="text" placeholder="차량번호"
						style="width: 50%; display: inline-block;" required="required" />
					</td>
				</tr>

				<tr>
					<td>
						<div class="input-group date" id="datepicker-disabled-past"
							data-date-format="dd-mm-yyyy" data-date-start-date="Date.default"
							style="width: 50%; display: inline-table;">
							<!-- <input type="text" class="form-control" placeholder="방문일자" required="required"/> -->
							<input name="visitDt" id="visitDt" type="text"
								placeholder="방문일자 입력을 위해 클릭하세요" name="test"
								class="form-control pull-right" autocomplete="off"> <span
								class="input-group-addon" id="testDatepickerBtn"><i
								class="fa fa-calendar" ></i></span>
						</div>

					</td>
				</tr>



				<tr>
					<td><input name="aptDetailInfoSeq" id="aptDetailInfoSeq"
						type="hidden"> <input name="dong" id="dong" type="text"
						class="form-control" placeholder="동 입력" value="${fn:split(loginUser.aptDetailInfoSeq,'_')[1]}"
						style="width: 22%; display: inline-block; text-align: center;" readonly="readonly" />&nbsp;동&nbsp;&nbsp;
						<input name="ho" id="ho" type="text" class="form-control"
						placeholder="호수 입력" style="width: 22%; display: inline-block; text-align: center;"
						readonly="readonly"
						value="${fn:split(loginUser.aptDetailInfoSeq,'_')[2]}"/>&nbsp;호&nbsp;
						</td>
				</tr>

				<tr>
					<td><input name="subPhone" id="subPhone" class="form-control"
						type="tel" placeholder="비상연락처"
						style="width: 50%; display: inline-block;" required="required" />

					</td>
				</tr>

				<tr>
					<td><input name="visitPurpose" id="visitPurpose"
						class="form-control input-sm" type="text" placeholder="방문목적"
						style="width: 50%; display: inline-block;" required="required" /></td>
				</tr>

				<tr>
					<td>
						<p>
							<br> ★필독★<br> 1. 방문자 차량등록은 24시간동안만 유효됩니다.<br> 2.
							확인결과와 해당내용이 일치하지 않을경우 외부차량으로 간주되어 조치되는점 확인바랍니다.<br> *방문
							차량등록은 1일 기준 가구당 2대*<br>
						</p>

					</td>
				</tr>
			</table>
			<p class="text-center m-b-0">
				<!-- <button type="reset" class="btn btn-default">취소</button> &nbsp; &nbsp; -->
				<button type="" class="btn btn-primary" onclick="return registerVisitCar()">등록</button>
			</p>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#visitDt").datepicker({});
			$("#testDatepickerBtn").click(function() {
				$("#datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top")
				.trigger("change");
				console.log("hi");
			});
			$("#visitDt").click(function() {
				console.log("hahahahahaha")
			});
		})
		//방문차량 등록용 메소드
		function registerVisitCar() {
			var visitCarNum = $("#visitCarNum").val();
			var subPhone = $("#subPhone").val();
			var visitPurpose = $("#visitPurpose").val();
			var visitDt = $("#visitDt").val();


			$.ajax({
				url:"/onepart/resident/registerVisitCar",
				type:"GET",
				data:{visitCarNum:visitCarNum, subPhone:subPhone, visitPurpose:visitPurpose
					, visitDt:visitDt},
				dataType: "json",
				success:function(){
					alert('방문차량 등록이 완료되었습니다.');

					$("#visitCarNum").val('');
					$("#subPhone").val('');
					$("#visitPurpose").val('');
					$("#visitDt").val('');
				},
				error : function(err) {
					alert('방문차량 등록에 실패했습니다.');
				}
			});
			return false;
		}
		//방문차량 리스트로 이동
		function moveListVisitCar(){
			$.ajax({
				url:"/onepart/resident/moveListVisitCar",
				type:"GET",
				dataType:"html",
				success:function(data){
					$("#content").html(data);
				},
			});
			return false;
		}

	</script>

</body>
</html>