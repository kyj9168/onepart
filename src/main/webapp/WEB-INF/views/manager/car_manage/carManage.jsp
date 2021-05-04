<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<title>Color Admin | Managed Tables - ColVis</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
#deleteResidentCar{
  background: #ff5b57 !important;
    border-color: #ff5b57 !important;
}
#deleteResidentCar:hover {
    background: #cc4946 !important;
    border-color: #cc4946 !important;
}
.buttonTable {
	width: 100%;
	    background: #00acac !important;
    border-color: #00acac !important;
}


#carnumTable {
	width: 100%;
}

#address {
	width: 100%;
}

#carinfoTable {
	width: 100%;
}

#carnumTable tr td {
	width: 75%;
	text-align: center;
	font-size: 1.2em;
	padding: 5px;
}

#carinfoTable tr td {
	width: 75%;
	text-align: center;
	font-size: 1.2em;
	padding: 5px;
}

#address tr td {
	width: 25%;
	text-align: center;
	font-size: 1.2em;
	padding: 5px;
}

#address tr td:nth-child(3) {
	width: 5%;
	text-align: center;
	font-size: 1.2em;
}

#address tr td:nth-child(5) {
	width: 5%;
	text-align: center;
	font-size: 1.2em;
}

#carnumTable tr td:nth-child(1) {
	width: 25%;
	text-align: center;
	font-size: 1.2em;
}

#address tr td:nth-child(1) {
	width: 20.3%;
	text-align: center;
	font-size: 1.2em;
}

#carinfoTable tr td:nth-child(1) {
	width: 25%;
	text-align: center;
	font-size: 1.2em;
}

@media ( min-width : 992px) {
	.col-md-10 {
		width: 100% !important;
	}
}

.btn.btn-warning {
	color: #fff;
	background: #00acac !important;
	border-color: #00acac !important;
	width: 100%;
}

.btn.btn-warning:hover {
	background: #008a8a !important;
	border-color: #008a8a !important;
}

.row>[class*=col-].ui-sortable {
	width: 100%;
	padding: 10px;
	height: 460px;
}

#carre {
	text-align: center;
	margin-bottom: 40px;
}

#btncar {
	text-align: center;
	width: 100%;
	margin-top: 20px;
}

@media ( min-width : 992px) {
	.col-md-3 {
		font-size: 15px;
		padding-top: 14px !important;
	}
}



button#delete {
	width: 20%;
}

button#maderoom {
	position: absolute;
	right: 44px;
	top: 126px;
	width: 8%;
}

table.dataTable thead th:nth-child(1) {
	text-align: center;
}

table.dataTable tbody td:nth-child(1) {
	text-align: center;
	padding-bottom: 0px;
}

table.dataTable tbody td {
	padding: 10px 15px;
}

input[type=checkbox] {
	margin: 0;
	-webkit-transform: scale(1.3);
}

.custom-modal {
	transition-property: opacity;
	transition-duration: 0.5s;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	text-align: center;
	background-color: rgb(0, 0, 0, 0.7);
}

.custom-modal.modal-hide {
	opacity: 0;
	z-index: -1000;
	transition-property: opacity;
	transition-duration: 0.5s;
}

.custom-modal>div {
	display: inline-block;
	width: 500px;
	margin-top: 10%;
	text-align: left;
	background-color: #d9e0e7;
}

.createRoomDiv .form-group>div {
	padding: 0 15px;
}

.createRoomDiv .form-group>div.buttons {
	text-align: right;
}

.createRoomDiv .form-group>div.buttons .btn-cancel {
	background-color: #CCC;
}

.createRoomDiv .form-group>div.buttons .btn-cancel:hover {
	background-color: #BBB;
}
</style>
<script type="text/javascript">

</script>

</head>
<body>


	<!-- end col-2 -->
	<!-- begin col-10 -->
	<div class="col-md-10">
		<h1>차량관리</h1>
		<div class="panel panel-inverse">


			<div class="panel-body">
				<div class="table-responsive">



					<table id="data-table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<td
									style="border-top: 1px solid white; border-right: 1px solid white; border-left: 1px solid white"><button
										type="button" class="btn btn-sm btn-warning modal-show"
										id="deleteResidentCar">삭제</button></td>
								<td colspan="6"
									style="text-align: right; border-top: 1px solid white; border-right: 1px solid white; border-left: 1px solid white"><button
										id="add-with-callbacks"
										class="btn btn-sm btn-warning modal-show"
										data-modal-id="createRoomDiv">차량등록</button></td>
							</tr>
							<tr>
								<th>선택</th>
								<th>차량번호</th>
								<th>주소</th>
								<th>차주</th>
								<th>차종</th>
								<th>차명</th>
								<th>용도</th>
							</tr>
						</thead>
						<tbody id="tbodyDiv">

							<c:forEach var="car" items="${residentCarList}"
								varStatus="status">

								<tr class="odd gradeX">

									<td><input name="residentCarCheck" id="residentCarCheck"
										type="checkbox" value=${car.residentEnrollCar }></td>
									<td class="carNum">${car.carNum }</td>
									<td class="bdrm">${car.bdNm }동${ car.rmNm }호</td>
									<td class="residentNm">${car.residentNm }</td>
									<td class="carType">${car.carType }</td>
									<td class="carNm">${car.carNm }</td>
									<td class="enrollPurpose">${car.enrollPurpose }</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>



				</div>
			</div>
		</div>
		<!-- end panel -->
	</div>
	<!-- end col-10 -->

	<div id="createRoomDiv" class="createRoomDiv custom-modal modal-hide">
		<div class="row">
			<!-- begin col-6 -->
			<div class="col-md-6">
				<!-- begin panel -->
				<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
					<div class="panel-body">
						<h2 id="carre">차량등록</h2>

						<form id="addResidentCar" class="form-horizontal">
							<table id="carnumTable">
								<tr>
									<td><label>차량 번호</label></td>
									<td><input id="carNum" type="text" class="form-control"
										placeholder="차량 번호를 입력하세요." /></td>
								</tr>
							</table>
							<table id="address">
								<tr>
									<td><label>주소</label></td>
									<td><input id="bdNm" type="text" class="form-control"
										placeholder="동수를 입력하시오." /></td>
									<td>동</td>
									<td><input id="rmNm" type="text" class="form-control"
										placeholder="호수를 입력하시오." /></td>
									<td>호</td>
								</tr>
							</table>



							<table id="carinfoTable">
								<tr>
									<td><label>차주</label></td>
									<td><input id="residentNm" type="text"
										class="form-control" placeholder="차주를 입력하세요." /></td>
								</tr>
								<tr>
									<td><label>차종</label></td>
									<td><input id="carType" type="text" class="form-control"
										placeholder="차종을 입력하세요." /></td>
								</tr>
								<tr>
									<td><label>차명</label></td>
									<td><input id="carNm" type="text" class="form-control"
										placeholder="차명을 입력하세요." /></td>
								</tr>
								<tr>
									<td><label>용도</label></td>
									<td><input id="enrollPurpose" type="text"
										class="form-control" placeholder="용도를 입력하세요." /></td>
								</tr>
							</table>
							<div class="col-md-9" id="btncar">
							<button type="submit" class="btn btn-sm btn-success">등록</button>
							<input type="button" id="cancelCar"
								class="btn btn-sm btn-cancel modal-hide-btn" value="취소">
							</div>
						</form>











					</div>
				</div>
				<!-- end panel -->
			</div>
		</div>
	</div>


	<script>
	// 선택된값 삭제하기
		$('#deleteResidentCar').click(
				function() {
					var con = window.confirm("정말 삭제하시겠습니까?");
					if (con) {
						var items = [];
						$('input:checkbox[name=residentCarCheck]:checked')
								.each(function() {
									items.push($(this).val());
								});
						var tmp = items.join(',');
						$.ajax({
							url : '/onepart/manager/deleteResidentCar',
							type : 'post',
							data : {
								'tmp' : tmp
							},
							dataType : 'json',
							success : function(result) {
								location.reload();
							},
							error : function(err) {
								alert('삭제에 실패 했습니다..');

							}
						});
					}
				});
	</script>
	<script>
		//입주민 차량 추가 처리
		$(document).on('submit', '#addResidentCar', function(e) {
			e.preventDefault();

			const data = {
				carNum : $('#carNum').val(), //차량번호
				bdNm : $('#bdNm').val(), //동
				rmNm : $('#rmNm').val(), //호
				residentNm : $('#residentNm').val(), //차주
				carType : $('#carType').val(), //차종
				carNm : $('#carNm').val(), //차명
				enrollPurpose : $('#enrollPurpose').val()
			//용도

			};

			$.ajax({
				url : '/onepart/manager/addResidentCar',
				type : 'post',
				data : data,
				dataType : 'json',
				success : function(result) {
						if(result.result == "success"){
							location.reload();
						}else{
							alert('이미 등록된 차량입니다.');
						}

				},
				error : function(err) {
					alert('입주민 정보를 확인하세요.');

				}
			});
		});

		//처음 페이지 시작
		$(function() {

			App.init();
			displayInit();
			TableManageColVis.init();
			$("th").parent().children().eq(0).removeAttr("class");
			$(".dataTables_info").remove();
			$("#data-table_previous").text("이전");
			$("#data-table_next").text("다음");
			$(".ColVis_MasterButton span").text("컬럼 보이기/숨기기")

			$(document).on('click', '.ColVis_MasterButton', function() {
				$("ul.ColVis_collection > li:first-child").remove();
			});
			$(document).on('click', 'th', function() {
				$("th").parent().children().eq(0).removeAttr("class");
			});




		});

		function displayInit() {
			$('.custom-modal').addClass('modal-hide');
			$(document).on('click', '.modal-hide-btn', function() {
				$('.custom-modal').addClass('modal-hide');
			});
			$(document).on('click', '.modal-show', function() {
				const modalId = $(this).data('modal-id');
				$('#' + modalId).removeClass('modal-hide');
				$('#carNum').val("");
				$('#bdNm').val("");
				$('#rmNm').val("");
				$('#residentNm').val("");
				$('#carType').val("");
				$('#carNm').val("");
				$('#enrollPurpose').val("");
			});
		};
	</script>


</body>

</html>
