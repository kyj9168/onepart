<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div id="visitCarPanel" class="panel-body">
		<h1>방문차량관리</h1>
		<div class="table-responsive">
		<table id="data-table" class="table table-striped table-bordered" style="text-align: center;">
			<thead>
				<tr>
					<th>상태</th>
					<th>입주민No</th>
					<th>방문차량번호</th>
					<th>방문 예정일</th>
					<th>비상연락처</th>
					<th>방문목적</th>
					<th style="display: none;">visitCarSeq</th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach var="myVisitcarList" items="${ myVisitcarList }">
				<tr class="odd gradeX">
					<td>
					<c:if test="${ myVisitcarList.status == 1}">
						<button value="${myVisitcarList.visitCarSeq}" name="noBtn" class="btn btn-sm btn-danger noBtn" >N</button>
						<button value="${myVisitcarList.visitCarSeq}" name="yesBtn" class="btn btn-sm btn-primary yesBtn" >Y</button>
					</c:if>
					<c:if test="${ myVisitcarList.status == 2}">
						등록완료
					</c:if>
					<c:if test="${ myVisitcarList.status == 3}">
						거절
					</c:if>
					</td>
					<td>${myVisitcarList.residentSeq}</td>
					<td>${myVisitcarList.visitCarNum}</td>
					<td>${myVisitcarList.visitDt}</td>
					<td>${myVisitcarList.subPhone}</td>
					<td>${myVisitcarList.visitPurpose}</td>
					<td style="display: none;">${myVisitcarList.visitCarSeq}</td>
				</tr>
			</c:forEach>
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
		});

		//no버튼 클릭 시 상태 거절로 업데이트하고 쪽지 보내기용 메소드
		$(".noBtn").click(function(){
			var noBtn = $(this);
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
		    // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		    var tr = noBtn.parent().parent();
		    var td = tr.children();
		    var visitCarSeq = td.eq(6).text();
		    var residentSeq = td.eq(1).text();
		    console.log("residentSeq :: " + residentSeq);

		    console.log("visitCarSeq : "+visitCarSeq);

		    var cancelReason = prompt("방문차량 등록 거절 사유를 적어주세요.", "");

		    if(cancelReason != null){
				$.ajax({
					url:"/onepart/manager/noVisitCar",
					type:"GET",
					data:{visitCarSeq : visitCarSeq},
					dataType:"html",
					success:function(data){
						alert('방문차량 등록 거절이 완료되었습니다.');

						//거절 쪽지 보내기 메소드
						$.ajax({
							url : '/onepart/messenger/sendMessageForVisitCar',
							type : 'post',
							data : {
								residentSeq : residentSeq,
								type : 2,
								cancelReason : cancelReason,
								visitCarSeq : visitCarSeq
							},
							success : function(data){

								if(data.result > 0){
									console.log("succ");
								}else{
									alert('방문차량 등록 거절에 실패했습니다!!');
								}
							}
						})
						$("#content").html(data);
					},
					error : function(err) {
						alert('방문차량 등록 거절에 실패했습니다.');
					}
				});
				return false;
		    }else{

		    }

		});

		//yes버튼 클릭 시 상태 승인으로 업데이트하고 쪽지 보내기용 메소드
		$(".yesBtn").click(function(){
			var str = "";
			var tdArr = new Array();
			var yesBtn = $(this);
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
		    // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		    var tr = yesBtn.parent().parent();
		    var td = tr.children();
		    var visitCarSeq = td.eq(6).text();
		    var residentSeq = td.eq(1).text();
		    console.log("residentSeq ::" + residentSeq);

		    console.log("visitCarSeq : "+visitCarSeq);

			$.ajax({
				url:"/onepart/manager/yesVisitCar",
				type:"GET",
				data:{visitCarSeq:visitCarSeq},
				dataType:"html",
				success:function(data){
					alert('방문차량 등록 승인이 완료되었습니다.');

					//승인 쪽지보내기 메소드
					$.ajax({
						url : '/onepart/messenger/sendMessageForVisitCar',
						type : 'post',
						data : {
							residentSeq : residentSeq,
							type : 1,
							visitCarSeq : visitCarSeq,
							cancelReason : null
						},
						success : function(){
							console.log("succ");
						}
					})
					$("#content").html(data);
				},
				error : function(err) {
					alert('방문차량 등록 승인에 실패했습니다.');
				}
			});
			return false;
		});

	</script>
</body>
</html>