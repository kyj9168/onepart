<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#data-table, #data-table th {
		text-align: center;
	}

	#receiverList > tr:hover {
		background: black;
	}
</style>

<script type="text/javascript">

	/* 등록버튼 클릭 시 처리 */
	$(function(){
		$('#enrollBtn').click(function(){
			var hiddenArea = $('#hiddenArea');
			var str = '';
			var total = hiddenArea.children().length;
			hiddenArea.children().each(function(index){
				if (index === total - 1) {
					str += $(this).data('name');
				} else {
					str += $(this).data('name') + ", ";
				}

			});
			console.log(str);
			if(str != null && str != ''){
				console.log("inininin");
				$('#receiverInput').text(str);
				$('#receiverInput').css({"background":"white", "color":"black"});
			}

			$('#modal-dialog').modal('hide');

		});
	});

	/* 체크박스 클릭 시 처리 */
	$(document).on('click', '#receiverList > tr', function(){
		$(this).children('td').eq(0).children('.fa-square-o').eq(0).toggleClass("fa-check-square");

		var seq = $(this).children('td').eq(1).text();
		var name = $(this).children('td').eq(2).text();

		var hiddenArea = $('#hiddenArea');

		var addFlag = true;
		hiddenArea.children().each(function(){

			if($(this).val() == seq){
				addFlag = false;
				return false;
			}
			console.log(addFlag);
		});

		if(addFlag){
			hiddenArea.append($('<input>', {type:'hidden', name:'tags', value:seq, 'data-name':name}));

		} else {
			hiddenArea.children().each(function(){
				if($(this).val() == seq){
					$(this).remove();
				}
			});
		}
	});

</script>
</head>
<body>

	<!-- #modal-dialog -->
	<div class="modal fade" id="modal-dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">쪽지 수신자 설정</h4>
				</div>
				<div class="modal-body">
					<div class="panel-body">
						<div class="table-responsive">
							<div id="data-table_wrapper" class="dataTables_wrapper no-footer">
								<div class="dataTables_length" id="data-table_length"></div>
                          		<table id="data-table" class="table table-bordered dataTable no-footer" role="grid" aria-describedby="data-table_info">
                                    <thead>
                                    <tr>
                                    	<th></th>
                                    	<th>번호</th>
                                        <th>이름</th>
                                        <th>부서</th>
                                    </tr>
                                    </thead>
                                    <tbody id = "receiverList">
										<c:forEach var="ManagerAndDeptVO" items="${managerAndDeptVOList}">
											<tr>
												<td> <i class="fa fa-2x fa-square-o"></i> </td>
												<!-- <i class="fa fa-2x fa-check-square"></i> -->
												<td>${ManagerAndDeptVO.managerSeq }</td>
												<td>${ManagerAndDeptVO.managerNm }</td>
												<td>${ManagerAndDeptVO.deptNm }</td>
											</tr>
										</c:forEach>
										<c:forEach var="ResponseResidentVO" items="${residentVOList}">
											<tr>
												<td> <i class="fa fa-2x fa-square-o"></i> </td>
												<!-- <i class="fa fa-2x fa-check-square"></i> -->
												<td>${ResponseResidentVO.residentSeq }</td>
												<td>${ResponseResidentVO.residentNm }</td>
												<td>${ResponseResidentVO.bdNm }동 ${ResponseResidentVO.rmNm }</td>
											</tr>
										</c:forEach>
									</tbody>
                                </table>
                            </div>
                        </div>
					</div>
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">종료</a>
					<a href="javascript:;" class="btn btn-sm btn-success" id="enrollBtn">등록</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>