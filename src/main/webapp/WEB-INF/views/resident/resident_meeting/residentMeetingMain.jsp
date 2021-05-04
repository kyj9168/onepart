<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#tableArea, #searchArea{
		background:white;
		margin-left: 9%;
		margin-right: 9%;
		margin-bottom : 5%;
	}

	#titleArea {
		margin-left: 9%;
		margin-right: 9%;
		margin-bottom : 1%;
	}

	tbody > tr:hover{
		background:#00acac;
	}

	.pageingBtnArea {
		text-align: center;
	}
</style>

<script type="text/javascript">
	$(function(){
		$('.residentMeetingDiv tr').click(function(){
			var residentsMeetingSeq = $(this).children('td').eq(0).text();
			console.log(residentsMeetingSeq);

			$.ajax({
				url : 'moveResidentMeetingMainDetail',
				type : 'post',
				data : {residentsMeetingSeq : residentsMeetingSeq},
				success : function(data){
					console.log('succ');
					$('#content').html(data);
				}
			});
		});
	});
</script>

<link href="${contextPath}/resources/plugins/jquery-tag-it/css/jquery.tagit.css" rel="stylesheet">
<link href="${contextPath}/resources/plugins/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css" rel="stylesheet">
</head>
<body>
	<div class="residentListDiv" id="tableArea">
		<h3>입주민 대표회의</h3>
		<hr>
		<span class="badge badge-inverse m-t-15 m-l-15" id="surveyStatus">입주민 대표 회의 명단</span>
		<div class="panel panel-inverse">
			<div class="panel-body">
				<div class="table-responsive">
					<table id="data-table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>이름</th>
								<th>직위</th>
								<th>주소</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody id="tbodyDiv">
							<c:forEach var="residentVO" items="${ residentVOList }" varStatus="status">
								<tr class="odd gradeX">
									<td>${ residentVO.residentNm }</td>
									<td>${ residentVO.aptAuthNm }</td>
									<td>${ residentVO.bdNm }동 ${ residentVO.rmNm }호</td>
									<td>${ residentVO.residentEnrollDt }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- end panel -->
	</div>

	<div class="residentMeetingDiv" id="tableArea">
		<span class="badge badge-inverse m-t-15 m-l-15" id="surveyStatus">회의 일정</span>
		<div class="panel panel-inverse">
			<div class="panel-body">
				<div class="table-responsive">
					<table id="data-table-2" class="table table-bordered">
						<thead>
							<tr>
								<th>번호</th>
								<th>회의 명</th>
								<th>회의 장소</th>
								<th>회의 일시</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody id="tbodyDiv">
							<c:forEach var="residentMeetingVO" items="${ residentMeetingVOList }" varStatus="status">
								<tr>
									<td>${ residentMeetingVO.residentsMeetingSeq }</td>
									<td>${ residentMeetingVO.meetingNm }</td>
									<td>${ residentMeetingVO.meetingPlace }</td>
									<td>${ residentMeetingVO.meetingDt }</td>
									<td>
									<c:if test="${ residentMeetingVO.meetingStatus == 1 }">
										예정
									</c:if>
									<c:if test="${ residentMeetingVO.meetingStatus == 2 }">
										진행 중
									</c:if>
									<c:if test="${ residentMeetingVO.meetingStatus == 3 }">
										완료
									</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- end panel -->
		<div id="etcBtnArea">
			<a class="btn btn-primary btn-block" id="residentMeetingRegisterBtn">등록</a>
		</div>
	</div>

	<script type="text/javascript">

		$(function(){
			TableManageColVis.init();
			$('#data-table-2').DataTable({
	            dom: 'C<"clear">lfrtip'
	        });

			$('#residentMeetingRegisterBtn').click(function(){

				$.ajax({
					url : 'moveResidentMeetingRegister',
					type : 'post',
					success : function(data){
						console.log("succ");
						$('#content').html(data);
					}
				});
			});

		});

	</script>

</body>
</html>