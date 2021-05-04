<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../maintenance_cost/manager_maintenance_include.jsp"></jsp:include>
<div style="width:85%; margin:0 auto; background:white">
	<!-- 단지총 관리비 div -->
	<table style="width:95%; margin:0 auto;">
		<tr>
			<td>
				<div class="form-group">
                <br><br>
                    <span class="label label-warning" style="font-size:1.5em;">단지 총 관리비</span>
                </div>
			</td>
			<td></td>
			<td style="width:15%">
			</td>
		</tr>
	</table>
	<div>
		<div>
			<table class="table table-hover" style="text-align:center;">
		        <thead>
		            <tr>
                        <td style="font-weight:bold;">분류</td>
                        <td style="font-weight:bold;">${ month - 4 }월</td>
                        <td style="font-weight:bold;">${ month - 3 }월</td>
                        <td style="font-weight:bold;">${ month - 2 }월</td>
                        <td style="font-weight:bold;">${ month - 1 }월</td>
                        <td style="font-weight:bold;">${ month }월</td>
                    </tr>
		        </thead>
		        <tbody>
					<tr>
						<td>인건비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '인건비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>제사무비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '제사무비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
                                <tr>
						<td>제세공과금</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '제세공과금' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>피복비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '피복비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>교육훈련비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '교육훈련비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>차량유지비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '차량유지비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>그외 부대비용</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '그외 부대비용' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>청소비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '청소비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>경비비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '경비비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>소독비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '소독비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>승강기유지비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '승강기유지비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>수선비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '수선비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>시설유지비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '시설유지비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>안전점검비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '안전점검비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>재해예방비</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '재해예방비' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>위탁관리수수료</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '위탁관리수수료' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
					<tr>
						<td>난방비</td>
	                             	<c:forEach var="compareMonthCostList" items="${ costList }">
	                             			<c:if test="${ compareMonthCostList.divisionThree == '난방비' }">
	                             				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
	                             			</c:if>
	                             	</c:forEach>
					</tr>
	                               <tr>
						<td>급탕비</td>
	                             	<c:forEach var="compareMonthCostList" items="${ costList }">
	                             			<c:if test="${ compareMonthCostList.divisionThree == '급탕비' }">
	                             				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
	                             			</c:if>
	                             	</c:forEach>
					</tr>
	                               <tr>
						<td>가스사용료</td>
	                             	<c:forEach var="compareMonthCostList" items="${ costList }">
	                             			<c:if test="${ compareMonthCostList.divisionThree == '가스사용료' }">
	                             				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
	                             			</c:if>
	                             	</c:forEach>
					</tr>
	                               <tr>
						<td>전기료</td>
	                             	<c:forEach var="compareMonthCostList" items="${ costList }">
	                             			<c:if test="${ compareMonthCostList.divisionThree == '전기료' }">
	                             				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
	                             			</c:if>
	                             	</c:forEach>
					</tr>
	                               <tr>
						<td>수도료</td>
	                             	<c:forEach var="compareMonthCostList" items="${ costList }">
	                             			<c:if test="${ compareMonthCostList.divisionThree == '수도료' }">
	                             				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
	                             			</c:if>
	                             	</c:forEach>
					</tr>
	                               <tr>
						<td>정화조오물수수료</td>
	                             	<c:forEach var="compareMonthCostList" items="${ costList }">
	                             			<c:if test="${ compareMonthCostList.divisionThree == '정화조오물수수료' }">
	                             				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
	                             			</c:if>
	                             	</c:forEach>
					</tr>
	                               <tr>
						<td>생활폐기물수수료</td>
	                             	<c:forEach var="compareMonthCostList" items="${ costList }">
	                             			<c:if test="${ compareMonthCostList.divisionThree == '생활폐기물수수료' }">
	                             				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
	                             			</c:if>
	                             	</c:forEach>
					</tr>
	                               <tr>
						<td>입대의 운영비</td>
	                             	<c:forEach var="compareMonthCostList" items="${ costList }">
	                             			<c:if test="${ compareMonthCostList.divisionThree == '입대의 운영비' }">
	                             				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
	                             			</c:if>
	                             	</c:forEach>
					</tr>
	                               <tr>
						<td>건물보험료</td>
	                             	<c:forEach var="compareMonthCostList" items="${ costList }">
	                             			<c:if test="${ compareMonthCostList.divisionThree == '건물보험료' }">
	                             				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
	                             			</c:if>
	                             	</c:forEach>
					</tr>
	                               <tr>
						<td>선관위 운영비</td>
	                             	<c:forEach var="compareMonthCostList" items="${ costList }">
	                             			<c:if test="${ compareMonthCostList.divisionThree == '선관위 운영비' }">
	                             				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
	                             			</c:if>
	                             	</c:forEach>
					</tr>
					<tr>
						<td>월사용액</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '월사용액' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              		</c:if>
                              	</c:forEach>
					</tr>
                                <tr>
						<td>충당금잔액</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '충당금잔액' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
					</tr>
                                <tr>
						<td>적립요율</td>
                              	<c:forEach var="compareMonthCostList" items="${ costList }">
                              			<c:if test="${ compareMonthCostList.divisionThree == '적립요율' }">
                              				<td>
											<fmt:formatNumber value="${ compareMonthCostList.sumMonthCost }" pattern="#,###" />원
										</td>
                              			</c:if>
                              	</c:forEach>
                              	<c:forEach var="sumMonthCostList" items="${ sumCostList }" varStatus="status">
                              		<input type="hidden" value="${ sumMonthCostList.sumMonthCost }" id="cost${ sumMonthCostList.divisionMonth }">
                              	</c:forEach>
					</tr>
		        </tbody>
		    </table>
		</div>
		<br><br>
		<div style="width:100%">
			<table style="width:95%; margin:0 auto">
                <tr>
		            <td style="width:80%" align="center"><div id="curve_chart" style="width:100%;"></div></td>
		        </tr>
            </table>
		</div>
		<br><br><br>
	</div>
</div>
<!-- 관리비등록 modal -->
<div class="modal fade" id="modal-dialog_test">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">관리비 등록</h4>
			</div>
			<div class="modal-body">
			<form action="" method="post" enctype="multipart/form-data" id="excelFileUploadForm">
				<table style="width:95%; margin:0 auto;">
                    <tr>
                    	<td>
               				<input style="width:100%;" type="text" class="form-control" id="excelYear" name="excelYear">
               			</td>
               			<td style="width:2%"></td>
               			<td>
               				 <label for="exampleInputEmail1" style="font-weight:bold;">년</label>
               			</td>
               			<td>
               				<input style="width:100%;" type="text" class="form-control" id="excelMonth" name="excelMonth">
               				<input style="width:100%;" type="hidden" class="form-control" id="fileType" name="fileType">
               			</td>
               			<td style="width:2%"></td>
               			<td>
               				 <label for="exampleInputEmail1" style="font-weight:bold;">월</label>
               			</td>
                    </tr>
                    <tr><td><br><br></td></tr>
                    <tr>
						<td style="width:80%" id="imgTd" colspan="6">
						<span class="btn btn-default fileinput-button" id="fileinputSpan" style="width:95%">
                                  <i class="fa fa-plus" id="icon"></i>
                                  <span id="text">Add files...</span>
                              </span>
                                 <input multiple="multiple" type="file" name="files" id="fileInsert">
						</td>
					</tr>
				</table>
			</form>
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" id="newApplyMaintenance">관리비등록</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//관리비 통계 그래프
	$(function(){
		google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawChart);

	    function drawChart() {
		  //공용 관리비
			var date = new Date();
			var month = date.getMonth();
			var costId1 = '#cost0' + (month-4) + "월";
			var costId2 = '#cost0' + (month-3) + "월";
			var costId3 = '#cost0' + (month-2) + "월";
			var costId4 = '#cost0' + (month-1) + "월";
			var costId5 = '#cost0' + (month) + "월";
			var cost1 = $(costId1).val();
			var cost2 = $(costId2).val();
			var cost3 = $(costId3).val();
			var cost4 = $(costId4).val();
			var cost5 = $(costId5).val();
			console.log(cost1);
	        var data = google.visualization.arrayToDataTable([

	          ['월', '단지 총 관리비'],
	          [(month-4)+'월',  parseInt(cost1)],
	          [(month-3)+'월',  parseInt(cost2)],
	          [(month-2)+'월',  parseInt(cost3)],
	          [(month-1)+'월',  parseInt(cost4)],
	          [month+'월',  parseInt(cost5)],

	        ]);

	        var options = {
	          title: '단지 총 관리비',
	          curveType: 'function',
	          legend: { position: 'bottom' }
	        };

	        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

	        chart.draw(data, options);

	    }

	});

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

			var fileName = $("#fileInsert").val();
	         console.log(fileName);
	         var fileFormat = fileName.split(".");
	         var fileType = fileFormat[1];

	         $("#fileType").val(fileType);
	         console.log($("#fileType").val());
		});

	});

	$(function(){

	})

	//새 관리비 내역 insert function
	$(function(){
		$("#newApplyMaintenance").click(function(event){
			 event.preventDefault();

			 var form = $('#excelFileUploadForm')[0];
	         var data = new FormData(form);

	         $.ajax({
	               type: "POST",
	               enctype: 'multipart/form-data',
	               url: "/onepart/manager/insert_newMainentance",
	               data: data,
	               processData: false,
	               contentType: false,
	               cache: false,
	               timeout: 600000,
	               success: function (data) {
	                  $.ajax({
	                    url:"/onepart/manager/menuMaintenanceCost",
	                    dataType:"html",
	                    success:function(result){
	                    	alert("등록이 완료되었습니다.");
	                       $("#content").html(result);
	                    }
	                 });
	               },
	               error: function (e) {

	               }
	           });

		});
	});
</script>
<!-- <div style="width:85%; margin:0 auto; background:white">
	세대별 관리비 div
	<table style="width:95%; margin:0 auto;">
		<tr>
			<td>
				<div class="form-group">
                <br><br>
                    <span class="label label-warning" style="font-size:1.5em;">세대별 관리비</span>
                </div>
			</td>
			<td></td>
			<td style="width:15%">
			</td>
		</tr>
	</table>
	<div>
		<div class="panel-body" style="background:white" align="center">
			<table class="table table-hover" style="text-align: center; width:100%">
				<thead>
                       <tr>
                           <th class="text-center">투표번호</th>
                           <th class="text-center">투표종류</th>
                           <th class="text-center">투표명</th>
                           <th class="text-center">투표현황</th>
                           <th class="text-center">내 현황</th>
                           <th class="text-center">투표종료날짜</th>
                       </tr>
                   </thead>
				<tbody>

				</tbody>
			</table>
		</div>
	</div>
</div> -->
</body>
</html>