<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String checkNo = Integer.toString((int)(Math.random()*999999) + 1);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="panel-body bg-white" style="width: 50%; margin-left: 300px;" >
	<!-- begin #page-container -->
		<div class="register register-with-news-feed">
			<!-- begin right-content -->
				<h1 class="register-header" style="text-align: center;">회원정보수정</h1>
				<!-- end register-header -->
				<!-- begin register-content -->
				<div class="register-content">
					<label class="control-label">아이디</label>
						<div class="row m-b-15" style="margin-bottom: 0%;">
							<!-- 						<div class="row row-space-10"> -->
							<div class="col-md-12" id="divInputId">
								<input name="residentId" id="residentId" type="text" class="form-control" style="width: 77%; display: inline-block;"
								 readonly="readonly" value="${loginUser.residentId}" />&nbsp;
							</div>
						</div>

					<label class="control-label">비밀번호</label>
					<div class="row row-space-10">
						<div class="col-md-12">
							<input type="password" class="form-control" placeholder="****" readonly="readonly" style="width: 77%; margin-bottom: 1%; display: inline-block;" />
							<!-- <button id="changePwd" type="button" class="btn btn-info m-r-5 m-b-5">비밀번호 변경</button> -->
							<a href="#modal-dialog" class="btn btn-info m-r-5 m-b-5" data-toggle="modal" id="changePwd" style="float:right;">비밀번호 변경</a>
							<p style="color: graytext; margin-bottom: 0%;">&nbsp;비밀번호는 최소 8자 ~ 최대 20자리, 영문과 숫자 혼합하여 설정</p>
							<br>
						</div>
					</div>

					<label class="control-label">이름</label>
					<div class="row m-b-15">
						<div class="col-md-12">
							<input name="residentNm" id="residentNm" type="text" class="form-control" style="width: 77%;" readonly="readonly" value="${loginUser.residentNm}"/>
						</div>
					</div>

					<label class="control-label">주민등록번호 <small style="font-size: 11px; color: graytext;">&nbsp;해당 정보수정은 관리소에 문의해주십시오.</small></label>
					<div class="row m-b-15">
						<div class="col-md-12">
							<input name="residentBirth" id="residentBirth" type="text" name="birthDay"
							 size="6" maxlength="6" style="width: 20%; text-align: center; background: #e5e9ed;" readonly="readonly" class="form" value="${loginUser.residentBirth}"/>&nbsp;&nbsp;-&nbsp;&nbsp;*******
						</div>
					</div>

					<label class="control-label">휴대전화번호 인증</label>
					<div class="row m-b-15">
						<div class="col-md-12">
							<input name="residentPhone" id="residentPhone" type="tel" class="form-control" style="width: 77%; display: inline-block;" readonly="readonly" value="${loginUser.residentPhone}" />&nbsp;
							<button id="checkPhone" type="button" class="btn btn-info m-r-5 m-b-5">변경하기</button>
							<br>
							<!-- **인증번호 클릭 시 아래 창 생김 or 새창 -->
							<br> <input name="checkNo" id="checkNo" required type="text" class="form-control" placeholder="인증번호 입력" style="width: 50%; display: inline-block;" />&nbsp;
								<input type="hidden" name="action" value="go"> <!-- 발송타입 -->
						        <input type="hidden" name="msg" value="<%=checkNo%>">
								<input type="hidden" name="rphone">
								<input type="hidden" name="sphone1" value="010">
						        <input type="hidden" name="sphone2" value="2603">
						        <input type="hidden" name="sphone3" value="9932">

							<button id="checkNumber" type="button" class="btn btn-default m-r-5 m-b-5">확인</button>
						</div>
					</div>

					<label class="control-label">이메일</label>
					<div class="row m-b-15">
						<div class="col-md-12">
							<input name="residentEmail" id="residentEmail" type="email" class="form-control" readonly="readonly" value="${loginUser.residentEmail}" style="width: 77%; display: inline-block;" />&nbsp;
							<button id="checkEmail" type="button" class="btn btn-info m-r-5 m-b-5">변경하기</button>
							<!-- <button type="button" class="btn btn-default m-r-5 m-b-5">인증번호</button>
							<br>**인증번호 클릭 시 아래 창 생김 or 새창<br> <input type="text" class="form-control" placeholder="인증번호 입력" style="width: 50%; display: inline-block;" />&nbsp;
							<button type="button" class="btn btn-default m-r-5 m-b-5">확인</button> -->
						</div>
					</div>
					<br>
					<h3>
						<label class="control-label">아파트 정보 <small style="font-size: 11px;">&nbsp;해당 정보수정은 관리소에 문의해주십시오.</small></label>
					</h3>
					<div class="row row-space-10">
						<div class="col-md-12">
							<input name="aptNm" id="aptNm" type="text" class="form-control" placeholder="성현동아 아파트" style="width: 77%; display: inline-block;"
							 readonly="readonly" />&nbsp;
							<br> <br>
							<table style="width: 100%; height: 30px; margin: 0 auto;">
								<tr>
									<td>
									 <input name="aptDetailInfoSeq" id="aptDetailInfoSeq" type="hidden">
										<input name="dong" id="dong" type="text" class="form-control" style="width: 30%; display: inline-block;" readonly="readonly" value="${fn:split(loginUser.aptDetailInfoSeq,'_')[1]}"/>&nbsp;동&nbsp;&nbsp;
										<input name="ho" id="ho" type="text" class="form-control" style="width: 30%; display: inline-block;" readonly="readonly" value="${fn:split(loginUser.aptDetailInfoSeq,'_')[2]}" />&nbsp;호&nbsp;
									</td>
								</tr>
							</table>
						</div>
					</div>
					<br> <br>
					<h3>
						<label class="control-label">세대주 여부 <small style="font-size: 11px;">&nbsp;해당 정보수정은 관리소에 문의해주십시오.</small></label>
					</h3>
					<c:set var = "household" value="${loginUser.householdAuthType}"/>
					<c:if test="${household == 1}">
						<div class="radio">
							<label> <input type="radio" name="householdAuthType" value="1" data-parsley-required="true"
								 data-parsley-multiple="radiorequired" data-parsley-id="2688" disabled="disabled" > 세대주 </label>
							<ul class="parsley-errors-list" id="parsley-id-multiple-radiorequired"></ul>
						</div>
						<div class="radio">
							<label> <input type="radio" name="householdAuthType" value="2" data-parsley-multiple="radiorequired"
								 data-parsley-id="2688" checked="checked" disabled="disabled"> 세대원 </label>
						</div>
					</c:if>
					<c:if test="${household == 2}">
						<div class="radio">
							<label> <input type="radio" name="householdAuthType" value="1" data-parsley-required="true"
								 data-parsley-multiple="radiorequired" data-parsley-id="2688" checked="checked" > 세대주 </label>
							<ul class="parsley-errors-list" id="parsley-id-multiple-radiorequired"></ul>
						</div>
						<div class="radio">
							<label> <input type="radio" name="householdAuthType" value="2" data-parsley-multiple="radiorequired" data-parsley-id="2688" disabled="disabled"> 세대원 </label>
						</div>
					</c:if>
					<br>
					<!-- <div class="register-buttons">
						<button type="submit" class="btn btn-primary btn-block btn-lg" id="submitBtn">수정하기</button>
					</div> -->
					<hr />
					<p class="text-center text-inverse">&copy; Color Admin All
						Right Reserved 2015</p>
			</div>
			<!-- end register-content -->
		</div>
		<!-- end right-content -->
	</div>
<!-- end page container -->

<!-- 시작 비밀번호 결과 모달 -->
<div class="modal fade" id="modal-dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">비밀 번호 재설정 하기</h4>
			</div>
	 		<form method="POST" data-parsley-validate="true"  id="setNewPwdForm">
			<!-- <form action=""> -->
			<div class="modal-body">
				<!-- begin wizard step-3 -->
				<span id="showResultPwd"></span>
				<div id="setNewPassword">
					<fieldset>
						<!-- <legend class="pull-left width-full">비밀번호 재설정</legend> -->
	                     <!-- begin row -->
	                     <div class="row">
	                         <!-- begin col-4 -->
	                         <div class="col-md-4">
	                             <div class="form-group">
	                                 <label>새 비밀번호</label>
	                                 <div class="controls">
	                                 	 <input type="hidden" name= residentId id="residentIdResult" value="${loginUser.residentId}" />
	                                     <input type="password" name="residentPwd" id="residentPwd" placeholder="새로운 비밀번호 입력" class="form-control" data-parsley-group="wizard-step-3" required />
	                                     <p style="color: graytext; margin-bottom: 0%;">&nbsp;비밀번호는 최소 8자 이상, 영문과 숫자 혼합하여 설정</p>
	                                 </div>
	                             </div>
	                         </div>
	                         <!-- end col-4 -->
	                         <!-- begin col-4 -->
	                         <div class="col-md-4">
	                             <div class="form-group">
	                                 <label>새 비밀번호 확인</label>
	                                 <div class="controls">
	                                     <input type="password" name="residentPwd2" id="residentPwd2" placeholder="새로운 비밀번호 확인" class="form-control" />
	                                 </div>
	                             </div>
	                         </div>
	                         <!-- end col-6 -->
	                     </div>
	                     <!-- end row -->

	                     <table>
	                     	<tr>
	                     		<td>
	                     			<label>기존 비밀번호</label>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td>
	                     			<input type="hidden" name= residentId id="residentIdResult" value="${loginUser.residentId}" />
                                     <input type="password" name="OldResidentPwd" id="OldResidentPwd" placeholder="기존 비밀번호 입력" class="form-control" data-parsley-group="wizard-step-3" required />
                                     <br>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td>
	                     			<label>새 비밀번호</label>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td>
	                     			<input type="password" name="residentPwd" id="residentPwd" placeholder="새로운 비밀번호 입력" class="form-control" data-parsley-group="wizard-step-3" required />
                                     <p style="color: graytext; margin-bottom: 0%;">&nbsp;비밀번호는 최소 8자 이상, 영문과 숫자 혼합하여 설정</p>
                                     <br>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td>
	                     			 <label>새 비밀번호 확인</label>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td>
	                     			<input type="password" name="residentPwd2" id="residentPwd2" placeholder="새로운 비밀번호 확인" class="form-control" />
	                     		</td>
	                     	</tr>
	                     </table>
	                 </fieldset>
				</div>
				<!-- end wizard step-3 -->
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
				<a href="moveFindPwd" id="changeNewPasswordBtn"class="btn btn-sm btn-success" data-dismiss="modal" onclick="setNewPwd()">비밀번호 재설정</a>
			</div>
		 </form>
		</div>
	</div>
</div>
<!-- 끝 비밀번호 찾기 결과 모달 -->


<script>
		$(document).ready(function () {

			$('#residentPwd').blur(function(){
				if(!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/.test($('#residentPwd').val())){
					if($('#residentPwd').val() != ''){
					   alert('비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.');
					   $('#residentPwd').val('');
					   $('#residentPwd2').val('');
					   $('#residentPwd').focus();;
				       return false;
					}
				   }
			});

			$('#residentPwd2').blur(function(){
			   if($('#residentPwd').val() != $('#residentPwd2').val()){
			    	if($('#residentPwd2').val()!=''){
				    alert("비밀번호가 일치하지 않습니다.");
			    	    $('#residentPwd2').val('');
			          $('#residentPwd2').focus();
			       }
			    }
			});

		});
</script>

<script type="text/javascript">
	//휴대폰 인증번호 메소드
	$("#checkPhone").click(function () {
		var rphone = $("#residentPhone").val();
		var sphone1 = $("input[name='sphone1']").val();
		var sphone2 = $("input[name='sphone2']").val();
		var sphone3 = $("input[name='sphone3']").val();
		var msg = $("input[name='msg']").val();
		console.log("msg :::: " + msg);
		var action = $("input[name='action']").val();

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
	});


	//새로운 비밀번호 설정 함수
	function setNewPwd() {

		var setNewPwdForm =$("#setNewPwdForm").serialize();

		$.ajax({
 			url:"/onepart/setNewPwd",
 			type:"post",
 			data:setNewPwdForm,
 			success:function(){
				alert("비밀번호가 변경되었습니다.")
			},
			error:function(xhr, status){
			alert(xhr + " : " + status);
 			}
 		});
	}

</script>


</body>
</html>