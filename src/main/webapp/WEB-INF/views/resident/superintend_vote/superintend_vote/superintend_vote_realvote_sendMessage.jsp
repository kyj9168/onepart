<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<link href="${contextPath}/resources/plugins/jquery-tag-it/css/jquery.tagit.css" rel="stylesheet">
<link href="${contextPath}/resources/plugins/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css" rel="stylesheet">
<meta charset="utf-8" />
<title>Color Admin | Managed Tables - ColVis</title>
<jsp:include page="../superintend_vote/superintend_vote_include.jsp"></jsp:include>
<jsp:include page="../superintend_vote/superintend_vote_detail_include_2.jsp"></jsp:include>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">

.buttonTable {
   width: 100%;
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
   width: 20%;
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
<div style="width:85%; margin:0 auto">
	<!-- title div -->
	<table style="width:100%">
		<tr>
			<td>
				<div class="form-group">
                    <h4>문자발송</h4>
                </div>
			</td>
			<td></td>
			<td style="width:15%">
			</td>
		</tr>
	</table>
	<div class="panel-body" style="background:white" align="center">
	<table style="width:95%">
		<tr>
			<td style="width:80%">
				<div class="form-group">
                    <h4>선거인명부</h4>
                </div>
			</td>
		</tr>
	</table>
   <!-- end col-2 -->
   <!-- begin col-10 -->
   <div class="col-md-12">
		<div class="panel panel-inverse">
			<div class="panel-body">
				<div class="table-responsive">
					<table id="data-table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>선택</th>
								<th>동</th>
								<th>호</th>
								<th>세대주 명</th>
								<th>연락처</th>
								<th>투표여부</th>
							</tr>
						</thead>
						<tbody id="tbodyDiv">
							<c:forEach var="electoralList" items="${ electoralList }"
								varStatus="status">
								<tr class="odd gradeX">
									<td>
										<input type="checkbox" value="${ electoralList.residentPhone }" id="checkSendMseeage">
									</td>
									<td>${ electoralList.aptDetailInfoSeq }</td>
									<td>${ electoralList.aptDetailInfoSeq }</td>
									<td>${ electoralList.residentNm }</td>
									<td>${ electoralList.residentPhone }</td>
									<td>${ electoralList.voteStatue}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- end panel -->
	</div>
	<br>
	<br>
	<div class="col-md-12">
		<table style="width:95%">
			<tr>
				<td style="text-align:center;"><h5>수신인</h5></td>
				<td style="width:2%"></td>
				<td style="width:78%">
					<input type="text" readonly="readonly" id="sendMessagePeoples" class="form-control pull-right">
					<input type="hidden" readonly="readonly" id="sendMessagePhones" class="form-control pull-right">
				</td>
				<td style="width:2%"></td>
				<td><button class="btn btn-danger" id="sendMessageReal">전송하기</button></td>
			</tr>
			<tr>
				<td style="text-align:center;"><h5>내용</h5></td>
			</tr>
			<tr>
				<td colspan="5">
					<textarea style="margin: 0px 1px 0px 0px; width:100%; height: 141px; resize:none;" rows="10"  class="form-control" id="sendMessage"></textarea>
				</td>
			</tr>
		</table>
		<br><br>
	</div>
	</div>
   <!-- end col-10 -->
</div>

<script>

//처음 페이지 시작
	$(function() {
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

	/* check box 선택함에 따라 css변경 function */
	var nameArr = new Array();
	var phoneArr = new Array();
	$(document).on("change", "#checkSendMseeage", function(){
		var $sendMessagePeoples = $("#sendMessagePeoples");
		var $sendMessagePhones = $("#sendMessagePhones");
		console.log("click");
		console.log($(this).val());
		console.log($(this).parent().parent().children().eq(3).text());
		if($(this).is(":checked")){
			nameArr.push($(this).parent().parent().children().eq(3).text());
			phoneArr.push($(this).val());
		}else{
			nameArr.splice(nameArr.indexOf($(this).val()), 1);
			phoneArr.splice(phoneArr.indexOf($(this).val()), 1);
		}

		$sendMessagePeoples.val(nameArr);
		$sendMessagePhones.val(phoneArr);

	});

	/* 문자전송 function */
	$(function(){
		$("#sendMessageReal").click(function(){
			var sendMessagePeoples = $("#sendMessagePeoples").val();
			var sendMessagePhones = $("#sendMessagePhones").val();
			var sendMessage = $("#sendMessage").val();

			console.log(sendMessagePeoples);
			console.log(sendMessagePhones);
			console.log(sendMessage);

			$.ajax({
				url:"/onepart/resident/sendMessage",
				type:"post",
				data:{
					sendMessagePeoples:sendMessagePeoples,
					sendMessagePhones:sendMessagePhones,
					sendMessage:sendMessage
				},
				success:function(){
					console.log("success");
				},error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }
			});

		});
	});

</script>
<script>
	/* $(document).ready(function() {
		EmailCompose.init();
	}); */
</script>
<script src="${contextPath}/resources/js/email-compose.demo.min.js"></script>
<script src="${contextPath}/resources/plugins/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>
<script src="${contextPath}/resources/plugins/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
<script src="${contextPath}/resources/plugins/jquery-tag-it/js/tag-it.min.js"></script>
<script src="${contextPath}/resources/js/apps.min.js"></script>
</body>
</html>
