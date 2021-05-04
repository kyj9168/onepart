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
.buttonTable {
	width: 100%;
}
#updateManager{
  background: #ff5b57 !important;
    border-color: #ff5b57 !important;
}
#updateManager:hover {
    background: #cc4946 !important;
    border-color: #cc4946 !important;
}
#managerTable{width:100%;}
#managerTable tr td:first-child{
	width:25%;
	text-align: center;
	font-size: 1.2em;
}
#managerTable tr td{
	padding:5px;
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
	width:100%;
}

.btn.btn-warning:hover {
	background: #008a8a !important;
	border-color: #008a8a !important;
}

.row>[class*=col-].ui-sortable {
	width: 100%;
	padding: 10px;
	height: 410px;
}

#carre {
	text-align: center;
	margin-bottom:40px;
}



#btncar {
	text-align: center;
	width: 100%;
	margin-top:20px;
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
		<h1>직원관리</h1>
		<div class="panel panel-inverse">


			<div class="panel-body">
				<div class="table-responsive">



					<table id="data-table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<td colspan="4"
									style="border-top: 1px solid white; border-right: 1px solid white; border-left: 1px solid white"><button
										type="button"
										class="btn btn-sm btn-warning modal-show" id="updateManager">퇴사처리</button></td>
								<td colspan="6"
									style="text-align: right; border-top: 1px solid white; border-right: 1px solid white; border-left: 1px solid white"><button
										id="add-with-callbacks"
										class="btn btn-sm btn-warning modal-show"
										data-modal-id="createRoomDiv">직원등록</button></td>
							</tr>
							<tr>
								<th>선택</th>
								<th>직원 고유번호</th>
								<th>이름</th>
								<th>부서</th>
								<th>아이디</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>입사일</th>
								<th>퇴사일</th>
								<th>퇴사여부</th>

							</tr>
						</thead>
						<tbody id="tbodyDiv">

							<c:forEach var="manager" items="${managerList }"
								varStatus="status">

								<tr class="odd gradeX">

									<td><input name="managerCheck" id="managerCheck" type="checkbox" value=${manager.managerSeq }></td>
									<td>${manager.managerSeq }</td>
									<td>${manager.managerNm }</td>
									<td>${manager.deptNm }</td>
									<td>${manager.managerId }</td>
									<td>${manager.managerPhone }</td>
									<td>${manager.managerEmail }</td>
									<td>${manager.managerEnrollDt }</td>
									<td>${manager.managerLeaveDt}</td>
									<c:if test="${manager.managerLeaveTf eq 'Y'}">
										<td>퇴사</td>
									</c:if>
									<c:if test="${manager.managerLeaveTf eq 'N'}">
										<td>재직</td>
									</c:if>
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
						<h2 id="carre">직원등록</h2>
						<form id="addManager" class="form-horizontal">
							<table id="managerTable">
								<tr>
									<td><label>이름</label></td>
									<td><input id="managerNm" type="text" class="form-control"
										placeholder="직원의 이름을 입력하세요." /></td>
								</tr>

								<tr>
									<td><label>부서</label></td>
									<td>

										<select id="deptCd" class="form-control input-sm">
											<option value="2">사무</option>
											<option value="3">시설</option>
											<option value="4">경비</option>
										</select>
									</td>
								</tr>
								<tr>
									<td><label>아이디</label></td>
									<td><input id="managerId" type="text" class="form-control"
										placeholder="직원의 아이디를 입력하세요." /></td>
								</tr>
								<tr>
									<td><label>연락처</label></td>
									<td><input id="managerPhone" type="text" class="form-control"
										placeholder="직원의 연락처를 입력하세요." /></td>
								</tr>
								<tr>
									<td><label>이메일</label></td>
									<td><input id="managerEmail" type="text"
										class="form-control" placeholder="직원의 이메일을 입력하세요." /></td>
								</tr>
							</table>











							<div class="col-md-9" id="btncar">
								<button type="submit" class="btn btn-sm btn-success">등록</button>
								<input type="button"
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
	 $('#deleteManager').click(function() {
		var con = window.confirm("정말 삭제하시겠습니까?");
		if(con){
		var items = [];
		$('input:checkbox[name=managerCheck]:checked').each(function() {
			items.push($(this).val());
		});
		var tmp = items.join(',');
		$.ajax({
			url : '/onepart/manager/deleteManager',
			type : 'post',
			data : {'tmp': tmp},
			dataType : 'json',
			success : function(result) {
				location.reload();
			},
			error : function(err) {
				alert('삭제에 실패하였습니다..');

			}
		});
	}
	});

	// 퇴사처리하기
	 $('#updateManager').click(function() {
		var con = window.confirm("정말 퇴사처리하시겠습니까?");
		if(con){
		var items = [];
		$('input:checkbox[name=managerCheck]:checked').each(function() {
			items.push($(this).val());
		});
		var tmp = items.join(',');
		$.ajax({
			url : '/onepart/manager/updateManager',
			type : 'post',
			data : {'tmp': tmp},
			dataType : 'json',
			success : function(result) {
				location.reload();
			},
			error : function(err) {
				alert('퇴사처리에 실패하였습니다..');

			}
		});
	}
	});

</script>
<script>
	 //직원 추가
	$(document).on('submit', '#addManager', function(e) {
		e.preventDefault();

		const data = {
				managerNm : $('#managerNm').val(), //직원이름
				deptCd : $('#deptCd').val(), //부서
				managerId : $('#managerId').val(), //직원아이디
				managerPhone : $('#managerPhone').val(), //연락처
				managerEmail : $('#managerEmail').val(), //이메일
		};
		$.ajax({
			url : '/onepart/manager/addManager',
			type : 'post',
			data : data,
			dataType : 'json',
			success : function(result) {
				if(result.result == "success"){
					location.reload();
				}else{
					alert('이미 등록된 아이디입니다.');
				}
			},
			error : function(err) {
				alert('직원 정보를 확인하세요.');

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
			$('#managerNm').val("")
			$('#deptCd').val("2")
			$('#managerId').val("")
			$('#managerPhone').val("")
			$('#managerEmail').val("")
		});
	};
</script>


</body>

</html>
