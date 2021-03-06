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
		<h1>????????????</h1>
		<div class="panel panel-inverse">


			<div class="panel-body">
				<div class="table-responsive">



					<table id="data-table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<td
									style="border-top: 1px solid white; border-right: 1px solid white; border-left: 1px solid white"><button
										type="button" class="btn btn-sm btn-warning modal-show"
										id="deleteResidentCar">??????</button></td>
								<td colspan="6"
									style="text-align: right; border-top: 1px solid white; border-right: 1px solid white; border-left: 1px solid white"><button
										id="add-with-callbacks"
										class="btn btn-sm btn-warning modal-show"
										data-modal-id="createRoomDiv">????????????</button></td>
							</tr>
							<tr>
								<th>??????</th>
								<th>????????????</th>
								<th>??????</th>
								<th>??????</th>
								<th>??????</th>
								<th>??????</th>
								<th>??????</th>
							</tr>
						</thead>
						<tbody id="tbodyDiv">

							<c:forEach var="car" items="${residentCarList}"
								varStatus="status">

								<tr class="odd gradeX">

									<td><input name="residentCarCheck" id="residentCarCheck"
										type="checkbox" value=${car.residentEnrollCar }></td>
									<td class="carNum">${car.carNum }</td>
									<td class="bdrm">${car.bdNm }???${ car.rmNm }???</td>
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
						<h2 id="carre">????????????</h2>

						<form id="addResidentCar" class="form-horizontal">
							<table id="carnumTable">
								<tr>
									<td><label>?????? ??????</label></td>
									<td><input id="carNum" type="text" class="form-control"
										placeholder="?????? ????????? ???????????????." /></td>
								</tr>
							</table>
							<table id="address">
								<tr>
									<td><label>??????</label></td>
									<td><input id="bdNm" type="text" class="form-control"
										placeholder="????????? ???????????????." /></td>
									<td>???</td>
									<td><input id="rmNm" type="text" class="form-control"
										placeholder="????????? ???????????????." /></td>
									<td>???</td>
								</tr>
							</table>



							<table id="carinfoTable">
								<tr>
									<td><label>??????</label></td>
									<td><input id="residentNm" type="text"
										class="form-control" placeholder="????????? ???????????????." /></td>
								</tr>
								<tr>
									<td><label>??????</label></td>
									<td><input id="carType" type="text" class="form-control"
										placeholder="????????? ???????????????." /></td>
								</tr>
								<tr>
									<td><label>??????</label></td>
									<td><input id="carNm" type="text" class="form-control"
										placeholder="????????? ???????????????." /></td>
								</tr>
								<tr>
									<td><label>??????</label></td>
									<td><input id="enrollPurpose" type="text"
										class="form-control" placeholder="????????? ???????????????." /></td>
								</tr>
							</table>
							<div class="col-md-9" id="btncar">
							<button type="submit" class="btn btn-sm btn-success">??????</button>
							<input type="button" id="cancelCar"
								class="btn btn-sm btn-cancel modal-hide-btn" value="??????">
							</div>
						</form>











					</div>
				</div>
				<!-- end panel -->
			</div>
		</div>
	</div>


	<script>
	// ???????????? ????????????
		$('#deleteResidentCar').click(
				function() {
					var con = window.confirm("?????? ?????????????????????????");
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
								alert('????????? ?????? ????????????..');

							}
						});
					}
				});
	</script>
	<script>
		//????????? ?????? ?????? ??????
		$(document).on('submit', '#addResidentCar', function(e) {
			e.preventDefault();

			const data = {
				carNum : $('#carNum').val(), //????????????
				bdNm : $('#bdNm').val(), //???
				rmNm : $('#rmNm').val(), //???
				residentNm : $('#residentNm').val(), //??????
				carType : $('#carType').val(), //??????
				carNm : $('#carNm').val(), //??????
				enrollPurpose : $('#enrollPurpose').val()
			//??????

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
							alert('?????? ????????? ???????????????.');
						}

				},
				error : function(err) {
					alert('????????? ????????? ???????????????.');

				}
			});
		});

		//?????? ????????? ??????
		$(function() {

			App.init();
			displayInit();
			TableManageColVis.init();
			$("th").parent().children().eq(0).removeAttr("class");
			$(".dataTables_info").remove();
			$("#data-table_previous").text("??????");
			$("#data-table_next").text("??????");
			$(".ColVis_MasterButton span").text("?????? ?????????/?????????")

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
