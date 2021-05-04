<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/animate.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/style.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/style-responsive.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/theme/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->

	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="${contextPath}/resources/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
    <link href="${contextPath}/resources/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL STYLE ================== -->

	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${contextPath}/resources/plugins/pace/pace.min.js"></script>

	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${contextPath}/resources/plugins/jquery/jquery-1.9.1.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>

	<script src="${contextPath}/resources/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery-cookie/jquery.cookie.js"></script>
	<!-- ================== END BASE JS ================== -->

	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="${contextPath}/resources/plugins/gritter/js/jquery.gritter.js"></script>
	<script src="${contextPath}/resources/plugins/flot/jquery.flot.min.js"></script>
	<script src="${contextPath}/resources/plugins/flot/jquery.flot.time.min.js"></script>
	<script src="${contextPath}/resources/plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="${contextPath}/resources/plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="${contextPath}/resources/plugins/sparkline/jquery.sparkline.js"></script>
	<script src="${contextPath}/resources/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery-jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="${contextPath}/resources/js/dashboard.min.js"></script>
	<script src="${contextPath}/resources/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	<script src="${contextPath}/resources/js/inbox.demo.min.js"></script>

	<script type="text/javascript">

		$(function(){

			loadMessenger();

			$('.messengerBtn').click(function(){
				$('.nav-inbox li').removeClass('active');
				$(this).parent().addClass('active');

				var btnId = $(this).attr('id');
				var type = 1;
				if(btnId == 'messengerType1') {
					type = 1;
				} else if(btnId == 'messengerType2') {
					type = 2;
				} else if(btnId == 'messengerType3') {
					type = 3;
				} else {
					type = 4;
				}

				// 페이지 호출
				loadMessenger(type, 1);
			});

			$('#keepBtn').click(function(){

				var active = $('#messengerList > tbody').children('tr.active');
				var messengerSeq = "";
				active.each(function(){
					var seq = $(this).children('td').eq(1).text();
					messengerSeq += seq + ",";
				});

				console.log(messengerSeq);

				$.ajax({
					url : 'keepMessenger',
					type : 'post',
					dataType : "JSON",
					data : {
						messengerSeq : messengerSeq,
					},
					success : function(data){
						console.log("succ");
						location.href = 'moveMessenger';
					}

				});

			});

			$('#keepBtn').click(function(){

				var active = $('#messengerList > tbody').children('tr.active');
				var messengerSeq = "";
				active.each(function(){
					var seq = $(this).children('td').eq(1).text();
					messengerSeq += seq + ",";
				});

				console.log(messengerSeq);

				$.ajax({
					url : 'keepMessenger',
					type : 'post',
					dataType : "JSON",
					data : {
						messengerSeq : messengerSeq,
					},
					success : function(data){
						console.log("succ");
						location.href = 'moveMessenger';
					}

				});

			});

			$('#deleteBtn').click(function(){
				var active = $('#messengerList > tbody').children('tr.active');
				var messengerSeq = "";
				active.each(function(){
					var seq = $(this).children('td').eq(1).text();
					messengerSeq += seq + ",";
				});

				console.log(messengerSeq);

				$.ajax({
					url : 'deleteMessenger',
					type : 'post',
					dataType : "JSON",
					data : {
						messengerSeq : messengerSeq,
					},
					success : function(data){
						console.log("succ");
						location.href = 'moveMessenger';
					}

				});

			});

		});

		// 쪽지 리스트 가져오기
		function loadMessenger(type, currentPage) {
			/*
			type 1 : 읽지 않은 쪽지
			type 2 : 받은 쪽지
			type 3 : 보낸 쪽지
			type 4 : 보관함
			*/
			if(!currentPage){
				currentPage = 1;
			}
			if(!type){
				type = 1;
			}

			console.log('type :: ' + type);
			console.log('currentPage :: ' + currentPage);

			//
			$.ajax({
				url : 'loadMessenger',
				type : 'post',
				data : {
					type : type,
					currentPage : currentPage
				},
				success : function(data){
					console.log('succ');
					console.log(data);

					var list = data.responseMessengerAndResidentAndManagerVOList;
					var pi = data.pi;
					var messengerList = $('#messengerList').children('tbody');

					messengerList.children().remove();

					for(var i in list){
						var $tr = $('<tr/>');
						var $checkBoxTd = $('<td/>', {class:"email-select"});
						var $seqTd = $('<td/>', {text:list[i].messengerSeq, style:"text-align:center;"});
						var $a = $('<a/>', {'data-click':"email-select-single"});
						var $i = $('<i/>', {class:'fa fa-square-o fa-fw'});

						// sender
						var sender;
						var seq;
						if(!list[i].residentNm){
							sender = list[i].managerNm;
						} else {
							sender = list[i].residentNm;
						}

						// content
						var content = list[i].messengerContent;
						if(content.length > 20){
							content = list[i].messengerContent.substring(0, 20) + "...";
						}

						// date
						var date = list[i].messengerEnrollDt;

						var $nameTd = $('<td/>', {class:"email-sender", text:sender, style:"text-align:center;"});
						var $contentTd = $('<td/>', {class:"email-subject", text:content});
						var $dateTd = $('<td/>', {class:"email-date", text:date});

						$a.append($i);
						$checkBoxTd.append($a);
						$tr.append($checkBoxTd);
						$tr.append($seqTd);
						$tr.append($nameTd);
						$tr.append($contentTd);
						$tr.append($dateTd);

						messengerList.append($tr);

						// tr event
						$contentTd.click(function(){
							var messengerSeq = $tr.children().eq(1).text();
							location.href = 'moveMessengerDetail?messengerSeq=' + messengerSeq;
						});
					}

					// paging
					messengerPaging = $('#messengerPaging');
					messengerPaging.children().remove();
					var $firstLi;
					var $firstA;
					if(pi.currentPage <= 1){
						$firstLi = $('<li>', {class:'disabled'});
						$firstA = $('<a>', {html:'<<'});
						$firstLi.append($firstA);
					} else {
						$firstLi = $('<li>');
						$firstA = $('<a>', {html:'<<', href:'javascript:loadMessenger(1);'});
						$firstLi.append($firstA);
					}
					messengerPaging.append($firstLi);

					for(var p=pi.startPage; p<=pi.endPage; p++){

						var $repeatLi;
						var $repeatA;

						if(p == pi.currentPage) {
							$repeatLi = $('<li>', {class:"active"});
							$repeatA = $('<a>', {html:p});
							$repeatLi.append($repeatA);
						}
						if(p != pi.currentPage) {
							$repeatLi = $('<li>');
							$repeatA = $('<a>', {html:p, href:'javascript:loadMessenger('+type+','+p+');'});
							$repeatLi.append($repeatA);
						}
						messengerPaging.append($repeatLi);

					} // end for

					var $listLi;
					var $listA;
					if(pi.currentPage < pi.maxPage){
						$listLi = $('<li>');
						$listA = $('<a>', {html:'>>', href:'javascript:loadMessenger('+pi.maxPage+');'});
						$listLi.append($listA);
					} else {
						$listLi = $('<li>', {class:'disabled'});
						$listA = $('<a>', {html:'>>'});
						$listLi.append($listA);
					}
					messengerPaging.append($listLi);

					Inbox.init();

				},
				error : function(error){
					console.log('error');
				}
			});
		}

		/* $(document).on('click', $('#messengerList > tbody > tr'), function(){
			var seq = $(this).children('td')
			console.log(seq);
		}); */
	</script>
</head>
<body>
	<div class="p-20">
	<!-- begin row -->
	<div class="row">
	    <!-- begin col-2 -->
	    <div class="col-md-2">
	        <div class="hidden-sm hidden-xs">
                      <h5 class="m-t-20">쪽지</h5>
                      <ul class="nav nav-pills nav-stacked nav-inbox">
                          <li class="active">
                              <a class='messengerBtn' id="messengerType1"><i class="fa fa-inbox fa-fw m-r-5"></i> 읽지 않은 쪽지</a>
                          </li>
                          <li><a class='messengerBtn' id="messengerType2"><i class="fa fa-inbox fa-fw m-r-5"></i> 받은 쪽지</a></li>
                          <li><a class='messengerBtn' id="messengerType3"><i class="fa fa-pencil fa-fw m-r-5"></i> 보낸 쪽지</a></li>
                          <li><a class='messengerBtn' id="messengerType4"><i class="fa fa-star fa-fw m-r-5"></i> 보관함</a></li>
                      </ul>
                  </div>
              </div>

	    <div class="col-md-10">
			<div class="email-btn-row hidden-xs">
			    <a href="writeMessengerForm" class="btn btn-sm btn-inverse"><i class="fa fa-plus m-r-5"></i> 쪽지 보내기</a>
			    <a class="btn btn-sm btn-inverse" id="keepBtn"><i class="fa fa-star-o m-r-5"></i> 보관함으로</a>
			    <a class="btn btn-sm btn-inverse" id="deleteBtn"><i class="fa fa-times-circle m-r-5"></i> 선택 삭제</a>
			</div>
	        <div class="email-content">
				<table class="table table-email" id="messengerList">
				    <thead>
				        <tr>
				            <th class="email-select"><a href="#" data-click="email-select-all"><i class="fa fa-square-o fa-fw"></i></a></th>
				            <th style="text-align:center;">seq</th>
				            <th style="text-align:center;">Sender</th>
				            <th>Content</th>
				         	<th>Date</th>
				        </tr>
				    </thead>
				    <tbody>
				    </tbody>
				</table>

				<div class="email-footer clearfix">
				    <ul class="pagination pagination-sm m-t-0 m-b-0 pull-right" id="messengerPaging">
				        <!--
				        <li class="disabled"><a href="javascript:;"><i class="fa fa-angle-double-left"></i></a></li>
				        <li class="disabled"><a href="javascript:;"><i class="fa fa-angle-left"></i></a></li>
				        <li><a href="javascript:;" id=""><i class="fa fa-angle-right"></i></a></li>
				        <li><a href="javascript:;"><i class="fa fa-angle-double-right"></i></a></li>
				    	 -->
				    </ul>
				</div>
	        </div>
	    </div>
	    <!-- end col-10 -->
	</div>
	<!-- end row -->
	</div>

</body>
</html>