<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="${contextPath}/resources/plugins/DataTables/css/data-table.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL STYLE ================== -->

<script type="text/javascript">
/* 	$(function(){
		// 방문차량 등록 리스트 가져오기
		getVisitCarList();
	});

	//방문차량 등록 리스트 가져오기
	function getIngSurveyList() {
		$.ajax({
		url : '/onepart/resident/moveListVisitCar',
		type : 'post',
		async: false,
		dataType: 'json',
		success : function(result){
			alert('hi');
			console.log('getIngSurveyList succ');
			console.log(result);
		}
	}
	} */
</script>
</head>
<body>
	<div id="visitCarPanel" class="panel-body">
		<h1>방문차량관리</h1>
		<div class="table-responsive">
		<table id="data-table" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>선택</th>
					<th>상태</th>
					<th>방문차량번호</th>
					<th>방문일</th>
					<th>비상연락처</th>
					<th>방문목적</th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach var="myVisitcarList" items="${ myVisitcarList }">
				<tr class="odd gradeX">
					<td>
					<c:if test="${ myVisitcarList.status == 1}">
						<input type="checkbox" value="${myVisitcarList.visitCarSeq}" name="visitCarCheckBox">
					</c:if>
					<c:if test="${ myVisitcarList.status == 2}">
						<input type="checkbox" disabled=true>
					</c:if>
					<c:if test="${ myVisitcarList.status == 3}">
						<input type="checkbox" disabled=true>
					</c:if>
					</td>
					<td>
					<c:if test="${ myVisitcarList.status == 1}">
						등록대기
					</c:if>
					<c:if test="${ myVisitcarList.status == 2}">
						등록완료
					</c:if>
					<c:if test="${ myVisitcarList.status == 3}">
						거절
					</c:if>
					</td>
					<td>${myVisitcarList.visitCarNum}</td>
					<td>${myVisitcarList.visitDt}</td>
					<td>${myVisitcarList.subPhone}</td>
					<td>${myVisitcarList.visitPurpose}
					<input name="visitCarSeq" id="visitCarSeq" type="hidden" value="${myVisitcarList.visitCarSeq}"/>
					</td>
				</tr>
			</c:forEach>

				<!-- <tr class="even gradeC">
					<td><input type="checkbox"></td>
					<td>승인</td>
					<td>32서4698</td>
					<td>2019.09.10</td>
					<td>010-4445-8565</td>
					<td>친척방문</td>
				</tr> -->

			</tbody>
		</table>
		<input name="resultCheckArr" id="resultCheckArr" type="hidden" />
	</div>
</div>


	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="${contextPath}/resources/plugins/DataTables/js/jquery.dataTables.js"></script>
	<script src="${contextPath}/resources/js/table-manage-default.demo.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->

	<script>
		$(document).ready(function() {

			$("#visitCarPanel").css("background-color","white");
			TableManageDefault.init();

			var button1 = $("<button id='delete' class='btn btn-sm btn-danger' onclick='return deleteRegisterVisitCar()'>").text("삭제");
			var button2 = $("<button id='add-with-callbacks' class='btn btn-sm btn-info' data-modal-id='createRoomDiv' onclick='return moveRegisterVisitCar()' style='float: right'>").text("차량 등록하기");
			var btnTable = $("<table class='table'>").css({'width':'10%', 'margin-bottom':'0px'});
			var tableTr = $("<tr>");
			var tableTd1 = $("<td>").css('padding','0px 5px');
			var tableTd2 = $("<td>").css('padding','0px 5px');

			tableTd1.append(button1);
			tableTd2.append(button2);
			tableTr.append(tableTd1);
			tableTr.append(tableTd2);
			btnTable.append(tableTr);

			$(btnTable).insertBefore("#data-table");


			//체크박스로 residentSeq값 가져오기
			var checkArr = new Array();

			$("input[type='checkbox'][name='visitCarCheckBox']").change(function(){
				console.log($(this).val())

				//선택된값 시간대 배열에 담아 input에 출력
				if($(this).is(":checked")){
					console.log("checked!!");
					checkArr.push($(this).val())
				}else{
					console.log("unchecked!!")
					var remove = $(this).val();
					checkArr.splice(checkArr.indexOf($(this).val()), 1);
				}
				console.log("checkArr : " + checkArr);
				$("#resultCheckArr").attr("value", checkArr);
			});
		});
			/* var myVisitcarList = '<c:out value="${myVisitcarList}"/>';
			var tableTbody = $('#data-table tbody');
			tableTbody.children().remove();
			 //테이블 값 입력
			for(var i in myVisitcarList){
				var $tr = $('<tr class="odd gradeX"/>');
				var $checkBoxTd;
				if(myVisitcarList[i].status == 1){
					$checkBoxTd = $('<td><input type="checkbox"></td>');
				} else if(myVisitcarList[i].status == 2){
					$checkBoxTd = $('<td><input type="checkbox disabled=true"></td>');
				} else if(myVisitcarList[i].status == 3){
					$checkBoxTd = $('<td><input type="checkbox disabled=true"></td>');
				}
				console.log('$myVisitcarList[i].status : ' + myVisitcarList[i].status);
				var $statusTd;
				if(myVisitcarList[i].status == 1){
					$statusTd = $('<td/>', {text:'등록대기'});
				} else if(myVisitcarList[i].status == 2){
					$statusTd = $('<td/>', {text:'등록완료'});
				} else if(myVisitcarList[i].status == 3){
					$statusTd = $('<td/>', {text:'거절'});
				}
				var $visitCarNumTd = $('<td/>', {text:myVisitcarList[i].visitCarNum});
				var $visitDtTd = $('<td/>', {text:myVisitcarList[i].visitDt});
				var $subPhoneTd = $('<td/>', {text:myVisitcarList[i].subPhone});
				var $visitPurposeTd = $('<td/>', {text:myVisitcarList[i].visitPurpose});

				$tr.append($checkBoxTd);
				$tr.append($statusTd);
				$tr.append($visitCarNumTd);
				$tr.append($visitDtTd);
				$tr.append($subPhoneTd);
				$tr.append($visitPurposeTd);

				tableTbody.append($tr);

			} */
		function moveRegisterVisitCar(){
			$.ajax({
				url:"/onepart/resident/menuVisitCar",
				type:"GET",
				dataType:"html",
				success:function(data){
					$("#content").html(data);
				},
			});
			return false;
		}

		function deleteRegisterVisitCar(){
			var resultCheckArr = $("#resultCheckArr").val();

			$.ajax({
				url:"/onepart/resident/deleteListVisitCar",
				type:"GET",
				data:{resultCheckArr:resultCheckArr},
				dataType:"html",
				success:function(data){
					alert('해당 방문차량의 등록이 취소되었습니다.');
					$("#content").html(data);
				},
				error : function(err) {
					alert('해당 방문차량의 등록 취소를 실패했습니다.');
				}
			});
			return false;
		}
	</script>

</body>
</html>