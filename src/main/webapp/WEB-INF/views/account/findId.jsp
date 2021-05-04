<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String checkNo = Integer.toString((int)(Math.random()*999999) + 1);
%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<head>
	<meta charset="utf-8" />
	<title>원파트 | 비밀번호 찾기</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />

	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<%-- <link href="${contextPath}/resources/plugins/jquery-ui/themes/base/minified/jquery-uimin.css" rel="stylesheet" /> --%>
	<link href="${contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/animate.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/style.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/style-responsive.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/theme/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->

	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="${contextPath}/resources/plugins/bootstrap-wizard/css/bwizard.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/plugins/parsley/src/parsley.css" rel="stylesheet">
	<!-- ================== END PAGE LEVEL STYLE ================== -->
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${contextPath}/resources/plugins/pace/pace.min.js"></script>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- ================== END BASE JS ================== -->
</head>

<body class="pace-top">
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in">
		<span class="spinner"></span>
	</div>
	<!-- end #page-loader -->

	<!-- begin #page-container -->
	<div id="page-container" class="fade">
		<!-- 아이디 찾기, 비밀번호 찾기 시작 -->
		<div class="register register-with-news-feed" style="width: 70%; margin: auto;">
			<!-- 반응형 시작 -->
			<div class="col-lg-10" style="margin: auto;">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#default-tab-1" data-toggle="tab" aria-expanded="false">아이디 찾기</a></li>
					<li class=""><a href="moveFindPwd" aria-expanded="true">비밀번호 찾기</a></li>
				</ul>
				<!-- 아이디 찾기, 비밀번호 찾기 탭 시작 -->
				<div class="tab-content" style="height: 500px;">
					<!-- 아이디 찾기 시작 -->
					<div class="tab-pane fade active in" id="default-tab-1">
						<h3 class="m-t-10">
							<i class="fa fa-cog"></i> 아이디 찾기
						</h3>
						<div class="col-lg-10">
							<form  method="POST" class="margin-bottom-0" id="findIdForm">
								<div class="panel-group" id="accordion">
									<div class="panel panel-inverse overflow-hidden">
										<div class="panel-heading">
											<h3 class="panel-title">
												<a class="accordion-toggle accordion-toggle-styled" data-toggle="collapse" data-parent="#accordion"
												 href="#collapseOne" aria-expanded="true" id="findIdToggleByHP"> <i class="fa fa-plus-circle pull-right"></i> 회원정보에 등록한 휴대전화로 인증
												</a>
											</h3>
										</div>
										<div id="collapseOne" class="panel-collapse collapse in" aria-expanded="true" style="height: 234px;">
											<div class="panel-body">
												<!-- <label class="control-label">이름</label>
												<div class="row m-b-15">
													<div class="col-md-12">
														<input name="residentNm" id="residentNm" type="text" class="form-control" placeholder="실명 입력" style="width: 77%;" />
													</div>
												</div>

												<label class="control-label">휴대전화번호 인증</label>
												<div class="row m-b-15">
													<div class="col-md-12">
														<input name="residentPhone" id="residentPhone" type="tel" class="form-control" placeholder="' - ' 없이 숫자만 입력" style="width: 77%; display: inline-block;" />&nbsp;
														<button type="button" class="btn btn-default m-r-5 m-b-5">인증번호</button>
														<br><br>
														<input name="verifiedNum" type="text" class="form-control" placeholder="인증번호 입력" style="width: 50%; display: inline-block;" />&nbsp;
														<button type="button" class="btn btn-default m-r-5 m-b-5">확인</button>
													</div>
												</div> -->

												<table>
													<tr>
														<td>
															<label>사용자 이름</label>
														</td>
														<td></td>
													</tr>
													<tr>
														<td>
															<input type="text" name="residentNm" id="residentNm" placeholder="실명 입력" class="form-control" data-parsley-group="wizard-step-2"  style="width: 300px;" required />
															<br>
														</td>
														<td></td>
													</tr>
													<tr>
														<td>
															<label>휴대전화번호 인증</label>
														</td>
														<td></td>
													</tr>
													<tr>
														<td>
														<input name="residentPhone" id="residentPhone" type="tel" placeholder="' - ' 없이 숫자만 입력" class="form-control" data-parsley-group="wizard-step-2" data-parsley-type="number" style="width: 300px;" required/></td>
														<br>
														<td>&nbsp;&nbsp;&nbsp;<button id="checkPhone" type="button" class="btn btn-default m-r-5 m-b-5" style="display: inline-block; align-self: flex-start;">인증번호</button></td>
													</tr>
													<tr>
														<td>
																<label>인증번호</label>
														</td>
														<td></td>
													</tr>
													<tr>
													<td>
													<input type="hidden" name="action" value="go"> <!-- 발송타입 -->
											        <input type="hidden" name="msg" value="<%=checkNo%>">
													<input type="hidden" name="rphone">
													<input type="hidden" name="sphone1" value="010">
											        <input type="hidden" name="sphone2" value="2603">
											        <input type="hidden" name="sphone3" value="9932">
													<input name="checkNo" id="checkNo" required type="text" class="form-control" placeholder="인증번호 입력"
														style="width: 100%; display: inline-block;" data-parsley-group="wizard-step-2" data-parsley-type="number"/>&nbsp;

															</td>
															<td>
														<button id="checkNumber" type="button" class="btn btn-default m-r-5 m-b-5" style="margin-left: 10px;">확인</button>
															</td>
														</tr>
												</table>
											</div>
										</div>
									</div>
									<div class="panel panel-inverse overflow-hidden">
										<div class="panel-heading">
											<h3 class="panel-title">
												<a id="findIdToggleByEmail" class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion"
												 href="#collapseTwo" aria-expanded="false"> <i class="fa fa-plus-circle pull-right"></i> 본인확인 이메일로 인증
												</a>
											</h3>
										</div>
										<div id="collapseTwo" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
											<div class="panel-body">
												<!-- <label class="control-label">이름</label>
												<div class="row m-b-15">
													<div class="col-md-12">
														<input name="residentNm2" id="residentNm2" type="text" class="form-control" placeholder="실명 입력" style="width: 77%;" />
													</div>
												</div>

												<label class="control-label">이메일</label>
												<div class="row m-b-15">
													<div class="col-md-12">
													<input name="residentEmail" id="residentEmail" type="email" class="form-control" placeholder="이메일 주소" style="width: 77%; display: inline-block;" />&nbsp;
														<button type="button" class="btn btn-default m-r-5 m-b-5">인증번호</button>
														<br><br> <input name="verifiedNum" type="text" class="form-control" placeholder="인증번호 입력" style="width: 50%; display: inline-block;" />&nbsp;
													</div>
												</div> -->
												<table>
													<tr>
														<td>
															<label>사용자 이름</label>
														</td>
														<td></td>
													</tr>
													<tr>
														<td>
															<input type="text" name="residentNm2" id="residentNm2" placeholder="실명 입력" class="form-control" data-parsley-group="wizard-step-2"  style="width: 300px;" required />
															<br>
														</td>
														<td></td>
													</tr>
													<tr>
														<td>
															<label>이메일 인증</label>
														</td>
														<td></td>
													</tr>
													<tr>
														<td>
													<!-- <input name="residentPhone" id="residentPhone" type="tel" placeholder="' - ' 없이 숫자만 입력" class="form-control" data-parsley-group="wizard-step-2" data-parsley-type="number" style="width: 300px;" required/> -->
														<input name="residentEmail" id="residentEmail" type="email" class="form-control" placeholder="이메일 주소 입력" style=" display: inline-block;" required />&nbsp;
														</td>

														<br>
														<td>&nbsp;&nbsp;&nbsp;<button id="checkEmail" type="button" class="btn btn-default m-r-5 m-b-5" style="display: inline-block; align-self: flex-start;">인증번호</button></td>
													</tr>
													<tr>
														<td>
																<label>인증번호</label>
														</td>
														<td></td>
													</tr>
													<tr>
													<td>
											       <%--  <input type="hidden" name="msg" value="<%=checkNo%>"> --%>
													<input type="hidden" name="rEmail">
													<input name="checkNoForEmail" id="checkNoForEmail" required type="text" class="form-control" placeholder="인증번호 입력"
														style="width: 100%; display: inline-block;" data-parsley-group="wizard-step-2" data-parsley-type="number"/>&nbsp;

															</td>
															<td>
														<button id="checkNumberForEmail" type="button" class="btn btn-default m-r-5 m-b-5" style="margin-left: 10px;">확인</button>
															</td>
														</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							<p class="text-center m-b-0">
								<button type="reset" class="btn btn-white m-r-5">취소</button> &nbsp; &nbsp;
								<!-- <button type="submit" class="btn btn-primary">찾기</button> -->
					 			<!-- 시작 모달로 결과 보내기 버튼 -->
								<a href="" id="showIdBtn" class="btn btn-primary" data-toggle="modal" onclick="showId();">찾기</a>
								<!-- 끝= 모달로 결과 보내기 버튼 -->
							</p>
								<!-- 시작 아이디찾기 결과 모달 -->
								<div class="modal fade" id="modal-dialog" aria-hidden="true" style="display: none;">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												<h4 class="modal-title">아이디 찾기 결과</h4>
											</div>
											<div class="modal-body">
												<span id="showResultId"></span>
											</div>
											<div class="modal-footer">
												<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
												<a href="moveFindPwd" class="btn btn-sm btn-success">비밀번호 찾기</a>
												<a href="moveAccount" class="btn btn-sm btn-success">로그인 하기</a>
											</div>
										</div>
									</div>
								</div>
								<!-- 끝 아이디찾기 결과 모달 -->
							</form>
						</div>
					</div>
					<!-- 아이디 찾기  -->
					<!-- 비밀번호 찾기 시작 -->
					<div class="tab-pane fade " id="default-tab-2"></div>
					<!-- 비밀번호 찾기 끝 -->
				</div>
					<!-- 아이디 찾기, 비밀번호 찾기 탭 끝 -->
			</div>
			<!-- 반응형 끝 -->
		</div>
		<!-- 아이디 찾기, 비밀번호 찾기 끝 -->
	</div>
	<!-- end #page-container -->





	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${contextPath}/resources/plugins/jquery/jquery-1.9.1.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
		<script src="${contextPath}/resources/crossbrowserjs/html5shiv.js"></script>
		<script src="${contextPath}/resources/crossbrowserjs/respond.min.js"></script>
		<script src="${contextPath}/resources/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
	<script src="${contextPath}/resources/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<script src="${contextPath}/resources/plugins/jquery-cookie/jquery.cookie.js"></script>
	<!-- ================== END BASE JS ================== -->

	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="${contextPath}/resources/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->

	<script>
		var verifiedNo = 0;
		$(document).ready(function () {
			App.init();
		});

		$("#findIdToggleByHP").click(function(){
			$("#residentNm2").val('');
			$("#residentEmail").val('');
			$("input[name=verifiedNum]").val('');
		});

		$("#findIdToggleByEmail").click(function(){
			$("#residentNm").val('');
			$("#residentPhone").val('');
			$("input[name=verifiedNum]").val('');
		});


		//아이디 찾기 결과 보여주는 함수
		function showId() {
			var findIdForm =$("#findIdForm").serialize();
			if (verifiedNo == 0) {
				alert('휴대전화번호나 이메일 본인 인증을 해주세요.');
				return false;
			}else{
  		$.ajax({
  			url:"findId",
  			type:"post",
  			data:findIdForm,
  			success:function(data){
				/* var jsonObj = JSON.parse(data); */
				console.log("data : " + data);
				$("#showResultId").empty();

				if(data == ''){
				$("#showResultId").append("<h3>"+"일치하는 아이디가 존재하지 않습니다.");
				}else{
					/* console.log(data.findId.residentId); */
					var resultId = data.findId.residentId;
					$("#showResultId").append("<h3>"+"회원님의 아이디는 '" + resultId + "' 입니다.</h3>");
				}
  			},
  			error:function(xhr, status){
  				alert(xhr + " : " + status);
  			}
  		});
		}
		}


		//휴대폰 인증번호 메소드
		$("#checkPhone").click(function () {

			var rphone = $("#residentPhone").val();
			console.log("휴대전화번호 : " + rphone);
			var sphone1 = $("input[name='sphone1']").val();
			var sphone2 = $("input[name='sphone2']").val();
			var sphone3 = $("input[name='sphone3']").val();
			var msg = $("input[name='msg']").val();
			console.log("msg :::: " + msg);
			var action = $("input[name='action']").val();

			if(rphone != ""){
				//next버튼 없애기
				$('.next').children().eq(0).css("display", "none")
				// 인증번호 입력창
				$.ajax({
					url:"moveSmssend",
					data:{rphone:rphone, sphone1:sphone1, sphone2:sphone2, sphone3:sphone3, msg:msg, action:action},
					type:"post",
					success:function(data){
						alert("인증번호가 발송되었습니다.");
						console.log(data);
						console.log("data : " + data.msgRnd);

						var checkPhone = data.msgRnd;
						console.log(data.msgRnd);
						console.log("checkPhone : ::" + checkPhone);
						console.log(msg);

						$("#checkPhone").hide();

						$("#checkNumber").on("click", function(){
							var checkNo = $("input[name='checkNo']").val();

							console.log("checkNo :::: " + checkNo);
							console.log("checkPhone ::::" + checkPhone);

							if(checkNo == checkPhone){
								$("#checkNo").attr({"readonly":"true"});
								$("#checkNumber").hide();
								alert("인증이 완료되었습니다.");
								verifiedNo = 1;
								$("#showIdBtn").attr("href","#modal-dialog" )
							}else{
								alert("인증번호가 틀렸습니다. 다시 입력하세요.");
								$("#checkPhone").show();
							}
						});
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
			}else{
				alert("휴대전화번호를 입력하세요.");
			}
		});



		//이메일 인증번호 메소드
		$("#checkEmail").click(function () {
			var rEmail = $("#residentEmail").val();
			console.log("이메일주소 : " + rEmail);
			if(rEmail != ""){
			// 인증번호 입력창
			$.ajax({
				url:"emailSend",
				data:{rEmail:rEmail},
				type:"post",
				success:function(data){
					alert("인증번호가 발송되었습니다.");
					console.log(data);
					/* console.log("data : " + data.msgRnd); */
					/* var checkEmail = data.msgRnd; */
					var authNum = data.authNum
					/* console.log(data.msgRnd); */
					console.log("authNum : ::" + authNum);
					/* console.log(msg); */

					$("#checkEmail").hide();
					$("#checkNumberForEmail").on("click", function(){

						var checkNoForEmail = $("input[name='checkNoForEmail']").val();

						console.log("checkNoForEmail :::: " + checkNoForEmail);
						console.log("authNum ::::" + authNum);

						if(checkNoForEmail == authNum){
							$("#checkNoForEmail").attr({"readonly":"true"});
							$("#checkNumberForEmail").hide();
							alert("인증이 완료되었습니다.");
							verifiedNo = 1;
							$("#showIdBtn").attr("href","#modal-dialog" )
						}else{
							alert("인증번호가 틀렸습니다. 다시 입력하세요.");
							$("#checkEmail").show();
						}

					});
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
			}else{
				alert("이메일 주소를 입력하세요.");
			}
		});


	</script>

</body>

</html>