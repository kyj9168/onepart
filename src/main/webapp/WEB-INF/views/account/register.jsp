<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<title>원파트</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />

	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<link href="${contextPath}/resources/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/animate.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/style.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/style-responsive.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/theme/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->

	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${contextPath}/resources/plugins/pace/pace.min.js"></script>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- ================== END BASE JS ================== -->
</head>

<body class="pace-top bg-white">
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in">
		<span class="spinner"></span>
	</div>
	<!-- end #page-loader -->

	<!-- begin #page-container -->
	<div id="page-container" class="fade">
		<!-- begin register -->
		<div class="register register-with-news-feed">
			<!-- begin news-feed -->
			<div class="news-feed">
				<div class="news-image">
					<img src="${contextPath}/resources/img/login-bg/bg-8.jpg" alt="" />
				</div>
				<div class="news-caption">
					<h4 class="caption-title">
						<i class="fa fa-edit text-success"></i> 원파트에서 스마트 홈라이프를 누리세요!
					</h4>
					<p>
						아파트 입주민 여러분 환영합니다. <br> 원파트는 보다 원활한 소통과 편의를 위해 스마트한 아파트 생활을
						더욱더 편리하게 살 수 있는 기능을 담아,<br> 입주민들 간 커뮤니케이션을 용이하게 만든 아파트 생활밀착
						서비스입니다.
					</p>
				</div>
			</div>
			<!-- end news-feed -->
			<!-- begin right-content -->
			<div class="right-content">
				<!-- begin register-header -->
				<h1 class="register-header">
					가입하기 <small>원파트 가입을 환영합니다. <br>멤버가 되시기 위해 아래 양식을
						작성해주세요.
					</small>
				</h1>
				<!-- end register-header -->
				<!-- begin register-content -->
				<div class="register-content">
					<form action="${ contextPath }/register" method="POST" class="margin-bottom-0" name="frm" id="frm">
						<label class="control-label">아이디</label>
						<div class="row m-b-15" style="margin-bottom: 0%;">
							<!-- 						<div class="row row-space-10"> -->
							<div class="col-md-12" id="divInputId">
								<input name="residentId" id="residentId" type="text" class="form-control" placeholder="아이디(영문, 숫자만 가능)" style="width: 77%; display: inline-block;"
								 required />&nbsp;
								<button id="idck" type="button" class="btn btn-default m-r-5 m-b-5">중복확인</button>
							</div>
						</div>

						<label class="control-label">비밀번호</label>
						<!-- <div class="row m-b-15" style="margin-bottom: 0%;"> -->
						<div class="row row-space-10">
							<div class="col-md-12">
								<input name="residentPwd" id="residentPwd" type="password" class="form-control" placeholder="비밀번호" style="margin-bottom: 1%;"
								 required />
								<p style="color: graytext; margin-bottom: 0%;">&nbsp;비밀번호는
									최소 8자 ~ 최대 20자리, 영문과 숫자 혼합하여 설정</p>
							</div>
						</div>
						<label class="control-label">비밀번호 확인</label>
						<div class="row m-b-15">
							<div class="col-md-12">
								<input name="residentPwd2" id="residentPwd2" type="password" class="form-control" placeholder="비밀번호 재입력"
								 required />
							</div>
						</div>

						<label class="control-label">이름</label>
						<div class="row m-b-15">
							<div class="col-md-12">
								<input name="residentNm" id="residentNm" type="text" class="form-control" placeholder="실명 입력" required />
							</div>
						</div>

						<label class="control-label">주민등록번호</label>
						<div class="row m-b-15">
							<div class="col-md-12">
								<input name="residentBirth" id="residentBirth" type="text" class="form-control" placeholder="" name="birthDay"
								 size="6" maxlength="6" style="width: 20%; text-align: center; display: inline-block;" required />&nbsp;&nbsp;-&nbsp;&nbsp;
								<input name="residentGender" id="residentGender" type="text" class="form-control" placeholder="" name="gender"
								 size="1" maxlength="1" style="width: 5%; text-align: center; display: inline-block; padding: 6px 1px;"
								 required />&nbsp;******&nbsp;
								<p style="color: graytext; margin-bottom: 0%;">&nbsp;전자투표에
									필요한 정보입니다.</p>
							</div>
						</div>

						<label class="control-label">휴대전화번호 인증</label>
						<div class="row m-b-15">
							<div class="col-md-12">
								<input name="residentPhone" id="residentPhone" type="tel" class="form-control" placeholder="휴대전화번호 입력" style="width: 77%; display: inline-block;"
								 required />&nbsp;
								 <!-- <input type="text" maxlength="3" name="tel1" id="tel" placeholder="010"> -
								<input type="text" maxlength="4" name="tel2" id="tel" placeholder="0000"> -
								<input type="text" maxlength="4" name="tel3" id="tel" placeholder="0000"> -->
								<button id="checkPhone" type="button" class="btn btn-default m-r-5 m-b-5">인증번호</button>
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
								<input name="residentEmail" id="residentEmail" type="email" class="form-control" placeholder="이메일 주소" style="width: 77%; display: inline-block;" />&nbsp;
								<!-- <button type="button" class="btn btn-default m-r-5 m-b-5">인증번호</button>
								<br>**인증번호 클릭 시 아래 창 생김 or 새창<br> <input type="text" class="form-control" placeholder="인증번호 입력" style="width: 50%; display: inline-block;" />&nbsp;
								<button type="button" class="btn btn-default m-r-5 m-b-5">확인</button> -->
							</div>
						</div>
						<br>
						<h3>
							<label class="control-label">아파트 정보</label>
						</h3>
						<div class="row row-space-10">
							<div class="col-md-12">
								<input name="aptNm" id="aptNm" type="text" class="form-control" placeholder="성현동아 아파트" style="width: 77%; display: inline-block;"
								 readonly="readonly" />&nbsp;
								<!-- <button type="button" class="btn btn-default m-r-5 m-b-5" style="background-color: black;">검색</button> -->
								<!-- <p style="color: blue; margin-bottom: 0%;">예) 서울시 송파구 신천동 잠실5단지의 경우 '신천동'이라고 입력하세요.</p> -->
								<br> <br>

								<!-- <input name="aptDetailInfoSeq" id="aptDetailInfoSeq" type="hidden">
								<input name="dong" id="dong" type="text" class="form-control" placeholder="동 입력" style="width: 30%; display: inline-block;" />&nbsp;동&nbsp;&nbsp;
								<input name="ho" id="ho" type="text" class="form-control" placeholder="호수 입력" style="width: 30%; display: inline-block;" />&nbsp;호&nbsp; -->
								<table style="width: 100%; height: 30px; margin: 0 auto;">
									<tr>
										<td><select class="form-control input-sm" id="candidateInfoDong" required="required">
												<option value="">원하는 동 선택</option>
												<c:forEach var="dong" begin="101" end="105">
													<option value='${ dong }'>${ dong }동</option>
												</c:forEach>
											</select></td>
										<td style="width: 3%"></td>
										<td><select class="form-control input-sm" id="candidateInfoHo" required="required">
												<option value="">원하는 호 선택</option>
											</select></td>
										<td style="width: 3%"></td>

									</tr>

								</table>
								<input name="aptDetailInfoSeq" id="aptDetailInfoSeq" type="hidden">
								<!-- <input name="dong" id="dong" type="text" class="form-control" placeholder="동 입력" style="width: 30%; display: inline-block;" />&nbsp;동&nbsp;&nbsp;
								<input name="ho" id="ho" type="text" class="form-control" placeholder="호수 입력" style="width: 30%; display: inline-block;" />&nbsp;호&nbsp; -->
							</div>
						</div>
						<br> <br>
						<h3>
							<label class="control-label">세대주 여부</label>
						</h3>
						<div class="radio">
							<label> <input type="radio" name="householdAuthType" value="1" data-parsley-required="true"
								 data-parsley-multiple="radiorequired" data-parsley-id="2688" required> 세대주
							</label>
							<ul class="parsley-errors-list" id="parsley-id-multiple-radiorequired"></ul>
						</div>
						<div class="radio">
							<label> <input type="radio" name="householdAuthType" value="2" data-parsley-multiple="radiorequired"
								 data-parsley-id="2688" required> 세대원
							</label>
						</div>
						<!-- <div class="radio">
							<label> <input type="radio" name="householdAuthType" value="3" data-parsley-multiple="radiorequired"
								 data-parsley-id="2688">
								복수 세대주 대표
							</label>
						</div> -->
						<br>
						<h3>
							<label class="control-label">약관 및 개인정보 취급방침</label>
						</h3>

						<!-- <div class="col-md-6"> -->
						<div class="panel-group" id="accordion">
							<div class="panel panel-inverse overflow-hidden">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion"
										 href="#collapseOne" aria-expanded="false"> <i class="fa fa-plus-circle pull-right"></i> 이용약관
										</a>
									</h3>
								</div>
								<div id="collapseOne" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
									<div class="panel-body">
										<textarea rows="15" cols="48%" id="generalRules">
제 1 장 총칙

제 1조 목적
본 약관은 (주)원파트(이하 '회사'라 함)가 운영하는 인터넷 홈페이지 및 모바일 어플리케이션(이하 ‘원파트’라 함)에서 제공하는 제반 서비스의 이용과 관련하여 회사와 이용자 및 이용자 간의 권리, 의무 및 책임사항 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2조 약관의 명시, 효력 및 변경
① 회사는 본 약관의 내용을 이용자가 쉽게 접근할 수 있도록 원파트 홈페이지 및 모바일 어플리케이션에 공지합니다.
② 회사는 필요한 경우 관련 법령을 위배하지 않는 범위 내에서 본 약관을 변경할 수 있습니다. 본 약관이 변경되는 경우 회사는 변경 사항을 시행 일자 15일 전부터 이용자에게 공지 또는 통지하는 것을 원칙으로 하며, 이용자에게 불리한 내용으로 변경할 경우에는 그 시행 일자 30일 전부터 이동전화 메시지 서비스(SMS, MMS), 알림 메시지를 띄우는 등 합리적으로 가능한 방법으로 변경사항을 공지 또는 통지합니다.
③ 회사가 전 항에 따라 공지 또는 통지를 하면서 공지 또는 통지일로부터 개정약관 시행일 7일 후까지 거부 의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 알렸음에도 이용자의 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 개정약관에 동의하지 않을 경우 제8조 제1항에 따라 이용계약을 해지할 수 있습니다.
제 3조 약관 외 준칙
본 약관에서 규정되지 않은 사항에 대해서는 관련 법령 또는 회사가 정한 서비스의 이용약관, 운영정책 및 규칙 등(이하 ‘세부지침’)의 규정을 따릅니다. 또한, 본 약관과 세부지침의 내용이 충돌할 경우 세부지침에 따릅니다.

제 4조 서비스의 중단
① 회사는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
② 사업 종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 회사는 이용자에게 통지하거나, 이용자가 알아볼 수 있도록 별도의 공지사항으로 게시합니다.
제 5조 이용자에 대한 통지
① 회사는 이동전화 단문메시지서비스(SMS), 어플리케이션 푸시알림(App push) 등으로 이용자에게 통지할 수 있습니다.
② 회사는 불특정다수 이용자에 대한 통지의 경우 공지사항으로 게시함으로써 개별 통지를 갈음할 수 있습니다.
제 2 장 이용계약 및 정보 보호

제 6조 회원가입 및 회원정보의 변경
① 이용자는 회사가 정한 가입 양식에 따라 회원정보를 기재한 후 본 약관 및 개인정보취급방침 등에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.
② 회원가입 계약의 성립 시기는 회사의 승낙이 이용자에게 도달한 시점으로 합니다.
③ 회원은 회원가입 신청 시 기재한 사항이 변경되었을 경우 온라인(원파트 홈페이지, 원파트 어플리케이션)으로 수정을 하거나 전자우편 및 기타 방법으로 회사에 그 변경사항을 알려야 합니다.
④ 제3항의 변경사항을 회사에 알리지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.
⑤ 회원가입은 반드시 본인의 진정한 정보를 통해서만 가입할 수 있으며 회사는 이용자가 등록한 정보에 대하여 확인조치를 할 수 있습니다. 이용자는 회사의 확인조치에 대하여 적극적으로 협력하여야 하며, 만일 이를 준수하지 아니할 경우 회사는 이용자가 등록한 정보가 부정한 것으로 처리할 수 있습니다.
⑥ 회사는 회원을 등급별로 구분하여 이용에 차등을 둘 수 있습니다.
제 7조 서비스의 이용, 변경 및 종료
① 회사는 서비스를 365일, 24시간 쉬지 않고 제공하기 위하여 최선을 다합니다. 다만, 장비의 유지ㆍ보수를 위한 정기, 임시 점검 또는 다른 상당한 이유로 서비스의 제공이 일시 중단될 수 있으며, 이때에는 미리 서비스 제공화면에 공지합니다. 만약, 회사로서도 예측할 수 없는 이유로 서비스가 중단된 때에는 회사가 상황을 파악하는 즉시 최대한 빠른 시일 내에 서비스를 복구하도록 노력합니다.
② 회사는 서비스 제공을 위해 계약한 각 아파트 입주자대표회의와의 계약 종료 및 변경, 신규서비스 개시 등의 사유로 서비스의 내용이 변경되거나, 서비스가 종료될 수 있습니다. 서비스 변경 사항 또는 종료는 서비스 초기화면이나 공지사항란에 게시하여 이용자가 알 수 있도록 합니다.
제 8조 이용계약 해지
① 이용자는 서비스의 이용을 더 이상 원치 않을 때는 언제든지 원파트 서비스 내 제공되는 회원탈퇴 메뉴를 이용하여 서비스 이용계약의 해지 신청을 할 수 있으며, 회사는 이를 즉시 처리합니다.
② 이용계약이 해지되면 법령 및 개인정보 취급방침에 따라 이용자의 정보를 보유하는 경우를 제외하고는 이용자가 작성한 게시물, 제3자의 게시물에 댓글 등은 서비스 내에 삭제되지 않고 남아 있게 됩니다.
③ 제2항의 게시물, 댓글 등의 삭제를 원한다면 이용자는 이용계약 해지 전 직접 해당 게시물, 댓글을 삭제해야 합니다.
④ 이용계약이 해지된 경우라도 이용자는 다시 회사에 대하여 이용계약의 체결을 신청할 수 있습니다.
제 9조 개인정보보호
① 회사는 이용자의 회원가입 시 서비스 제공에 필요한 최소한의 정보(아이디, 패스워드, 성명, 휴대폰 번호, 거주 중인 아파트 이름, 동ㆍ호수)를 수집합니다.
② 제공된 이용자의 개인정보는 이용자의 동의 없이 목적 외의 이용이나 제3자에게 제공하지 않습니다. 다만, 다음의 경우에는 예외로 합니다.

1. 도용방지를 위하여 본인확인에 필요한 경우
2. 법률의 규정 또는 법률에 따라 제공에 불가피한 사유가 있는 경우
3. 회사가 제1항과 제2항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보취급방침에 알린 개인정보관리 책임자의 신원(성명 및 전화번호 등), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은 자, 제공목적 및 제공할 정보의 내용) 등 [정보통신망 이용촉진 및 정보보호 등에 관한 법률] 제22조 제2항이 규정한 사항을 미리 명시하거나 알리며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
③ 회사는 이용자의 개인정보를 보호하기 위해 '개인정보취급방침'을 수립하고 개인정보보호 책임자를 지정합니다.
④ 모든 이용자는 자신의 개인정보를 책임있게 관리하여 타인이 이용자의 개인정보를 부정하게 이용할 수 없도록 해야 합니다.
⑤ 회사는 이용자의 개인정보를 보호하기 위해 [정보통신망 이용촉진 및 정보보호 등에 관한 법률] 상의 개인정보 유호기간제도에 따라 1년간 미 접속한 이용자의 개인정보를 파기 또는 분리하여 별도로 저장/관리하며, 이용자의 별도 요청이 없는 한 사용이 제한됩니다.
제 3 장 책임

제 10조 회사의 의무
① 회사는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 이용자에게 서비스를 제공하기 위해 최선을 다합니다.
제11조 이용자의 아이디 및 비밀번호 관리에 대한 의무
① 이용자의 아이디와 비밀번호에 관한 관리책임은 이용자에게 있습니다. 이용자는 자신의 아이디 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
② 이용자 자신의 아이디 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 지체 없이 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.
제 12조 책임의 한계
① 회사는 무료로 제공하는 정보 및 서비스에 관하여 “개인정보취급방침” 또는 관계 법령의 벌칙, 과태료 규정 등 강행규정에 위배되지 않는 한 원칙적으로 손해를 배상할 책임이 없습니다.
② 회사는 천재지변, 불가항력, 서비스용 설비의 보수, 교체, 점검 및 이에 준하는 사항으로 서비스를 제공할 수 없는 경우에 이에 대한 책임이 면제됩니다.
③ 회사는 이용자의 귀책사유로 인한 정보 및 서비스 이용의 장애에 관하여는 책임을 지지 않습니다.
제 4 장 기타

제 13조 손해배상 등
회사는 회사의 과실로 인하여 이용자가 손해를 입게 될 경우 본 약관 및 법령에 따라 이용자의 손해를 배상합니다. 다만 회사는 아래와 같은 손해에 대해서는 책임을 부담하지 않습니다. 또한 회사는 법률상 허용되는 한도 내에서 간접 손해, 특별 손해, 결과적 손해, 징계적 손해 및 징벌적 손해에 대한 책임을 부담하지 않습니다.

1. 천재지변 또는 이에 준하는 불가항력의 상태에서 발생한 손해
2. 이용자의 귀책사유로 서비스 이용에 장애가 발생한 경우
3. 제3자가 불법적으로 회사의 서버에 접속하거나 서버를 이용함으로써 발생하는 손해
4. 제3자가 악성 프로그램을 전송 또는 유포함으로써 발생하는 손해
5. 전송된 데이터의 생략, 누락, 파괴 등으로 발생한 손해, 명예훼손 등 제3자가 서비스를 이용하는 과정에서 발생된 손해
6. 기타 회사의 고의 또는 과실이 없는 사유로 인해 발생한 손해
제 14조 분쟁의 해결
본 약관 또는 서비스는 대한민국법령에 의하여 규정되고 이행됩니다. 서비스 이용과 관련하여 회사와 이용자 간에 분쟁이 발생하면 이의 해결을 위해 회사는 성실히 협의 할 것입니다. 그럼에도 불구하고 해결되지 않으면 민사소송법의 관할법원에 소를 제기할 수 있습니다.

제 15조 효력의 발휘
공고일자 : 2019-09-14
시행일자 : 2019-09-29
										</textarea>
									</div>
								</div>
							</div>
							<div class="panel panel-inverse overflow-hidden">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion"
										 href="#collapseTwo" aria-expanded="false"> <i class="fa fa-plus-circle pull-right"></i> 개인정보 취급방침
										</a>
									</h3>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
									<div class="panel-body">
										<textarea rows="15" cols="48%" id="privacyPolicy">

1. 인사말 및 서비스 명의 정의
원파트 이용자 여러분 반갑습니다!
(주)원파트(이하 ‘회사’)는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법, 통신비밀보호법, 전기통신사업법 등 정보통신서비스제공자가 준수하여야 할 관련 법령상의 개인정보보호 규정을 준수하며, 관련 법령에 따른 개인정보취급방침을 정하여 여러분의 권익 보호에 최선을 다하고 있습니다.
개인정보취급방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일 전부터 서비스 내의 ‘공지사항’ 또는 기타 알기쉬운 방법을 통해 공유 드릴 예정입니다. 그 밖에 개인정보의 수집 및 활용, 제3자 제공 등과 같이 이용자 권리의 중요한 변경이 있으면 최소 30일 전에 알려드리겠습니다.
2. 수집하는 개인정보는 다음과 같습니다.
회사는 회원가입(또는 서비스 가입), 원활한 고객 상담, 각종 서비스의 제공을 위해 원파트 서비스 최초 이용 시 필요한 개인정보를 수집하고 있습니다. 필수적으로 취합되는 정보에는 이름, 휴대전화번호, 가입 시 비밀번호, 단말기 정보 등이 있습니다. 또한, 원파트에 특화된 여러 기능을 사용하기 위해서 등록하게 되는 프로필사진, 특정 아파트의 동, 호수 등의 계정정보가 선택적으로 수집 될 수 있습니다. 원파트 내 유료 서비스를 이용할 경우에는 구매상품 전송, 배송, 요금 정산 등을 위해 전송받는 자의 프로필 정보, 전송물품의 사용여부 및 사용시각에 관한 정보, 배송받을 연락처 정보(배송을 위해 사용 후 삭제), 전송하는 자의 휴대전화번호 및 결제대행업체 결제 완료를 확인할 수 있는 정보 중 일부가 각 과정에서 선택적으로 수집됩니다. 그 밖에도 서비스 이용과정이나 사업처리 과정에서 위치정보, 접속 IP 정보, 방문 일시, 서비스 이용기록, 제재 및 이용정지 기록 등이 생성되어 수집될 수 있습니다.
3. 개인정보의 제공
회사는 회원의 개인정보를 개인정보의 수집 및 이용목적에 고지한 범위 내에서만 사용합니다. 서비스 이용 중 사용자 식별을 위하여 닉네임과 가입 시 기재한 아파트의 동, 호수가 이용자 간에 공개됩니다.
회사는 서비스 이용과정 등에서 개인정보 제공을 사전에 동의하는 경우나 법령에 규정된 경우를 제외하고는 회원의 개인정보를 절대 제3자에게 제공하거나 공유하지 않습니다.
4. 수집된 개인정보의 파기
회원의 개인정보는 원칙적으로 계정삭제 시 또는 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 다만, 관계 법령의 규정에 의하여 보존할 필요가 있는 경우에는 관계 법령에서 정한 일정한 기간 회원정보를 보관합니다. 수집 및 이용목적이 달성된 개인정보는 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(개인정보 보유 및 이용기간 참조) 일정기간 저장된 후 파기됩니다. 이때 해당하는 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다. 수집된 정보 파기 시, 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기하고 있으며 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
5. 개인정보의 조회, 수정, 파기
회사에 등록되어 있는 개인정보는 언제든지 조회하거나 수정하실 수 있으며, 회사의 개인정보 처리에 동의하지 않는 경우 동의를 거부하거나 가입 해지(회원탈퇴)를 요청하실 수 있습니다. 다만, 그러한 경우 서비스의 일부 또는 전부 이용이 어려울 수 있습니다. 여러분이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 해당 개인정보를 이용 또는 제공하지 않습니다. 또한, 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 즉시 통지하여 정정이 이루어지도록 하겠습니다.
회사는 여러분의 요청에 의해 해지 또는 삭제된 개인정보를 개인정보의 보유 및 이용 기간에 대해 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.
6. 웹 서비스 제공을 위한 쿠키 사용
회사는 개인화되고 맞춤화된 서비스를 제공하기 위해서 회원의 개인정보를 저장하고 불러오는 ‘쿠키(cookie)’를 사용합니다. 이 정보는 회원의 디바이스에 저장되며, 회사는 이를 이용하여 회원의 방문기록, 이용 형태를 통해서 최적화된 서비스를 제공하기 위하여 활용합니다.
쿠키는 개인을 식별하는 정보를 자동적.능동적으로 수집하지 않으며, 회원은 이러한 쿠키의 저장을 웹 브라우저의 설정을 변경하여 거부하거나 삭제할 수 있습니다. 다만 쿠키의 저장을 거부할 경우에는 일부 서비스 제공에 어려움을 줄 수 있습니다.
7. 개인정보관리 책임자 및 담당자를 지정해 운영하고 있습니다.
개인정보 책임관리자
이름 : 문호석
연락처 : 010-4445-8565
8. 효력의 발휘
공고 일자 : 2019-09-14
시행 일자 : 2019-09-29
										</textarea>
									</div>
								</div>
							</div>
						</div>
						<!-- </div> -->



						<div class="checkbox m-b-30">
							<label> <input type="checkbox" required />(필수) 위 사항을
								숙지하였으며, 이에 동의합니다.
							</label>
						</div>
						<div class="register-buttons">
<!-- 							<button type="button" class="btn btn-primary btn-block btn-lg" id="submitBtn">가입하기</button> -->
							<button type="submit" class="btn btn-primary btn-block btn-lg" id="submitBtn">가입하기</button>
						</div>
						<div class="m-t-20 m-b-40 p-b-40">
							이미 회원이신가요? <a href="moveAccount">여기를</a> 클릭하셔서 로그인하세요.
						</div>
						<hr />
						<p class="text-center text-inverse">&copy; Color Admin All
							Right Reserved 2015</p>
					</form>
				</div>
				<!-- end register-content -->
			</div>
			<!-- end right-content -->
		</div>
		<!-- end register -->
	</div>
	<!-- end page container -->

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
		$(document).ready(function () {
			App.init();

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


			$('#residentBirth').blur(function(){
				if(!/^[0-9]{6}$/.test($('#residentBirth').val())){
					if($('#residentBirth').val() != ''){
					   alert('6자리 숫자만 사용해야 합니다.');
					   $('#residentBirth').val('');
					   $('#residentBirth').focus();;
				       return false;
				    }
				 }
			});

			$('#residentGender').blur(function(){
				if(!/^[1-4]{1}$/.test($('#residentGender').val())){
					if($('#residentGender').val() != ''){
					   alert('1~4 숫자만 사용해야 합니다.');
					   $('#residentGender').val('');
					   $('#residentGender').focus();;
				       return false;
					}
				 }
			});

		});
</script>

<script type="text/javascript">
	//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	var idck = 0;
	var verifiedNo = 0;
	$(function () {
		//idck 버튼을 클릭했을 때
		$("#idck").click(function () {

			//userid 를 param.
			var residentId = $("#residentId").val();
			console.log("residentId : " + residentId);



			$.ajax({
				async: true,
				url: "/onepart/resident/idcheck",
				type: 'POST',
				data: {residentId:residentId},
				dataType: "json",
				/* contentType: "application/json; charset=UTF-8", 이것때문에 값이 콘트롤러로 전달 안됐다.*/
				success: function (data) {
					if (data.cnt > 0) {

						alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
						//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputId").addClass("has-error")
						$("#divInputId").removeClass("has-success")
						$("#residentId").focus();


					} else {
						alert("사용가능한 아이디입니다.");
						//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputId").addClass("has-success")
						$("#divInputId").removeClass("has-error")
						$("#userpwd").focus();
						//아이디가 중복하지 않으면  idck = 1
						idck = 1;

					}
				},
				error: function (error) {

					alert("error : " + error);
				}
			});
		});
	});


	//가입하기 버튼 누를 시 아파트 동호 수 변환과 아이디 중복체크 버튼 누름 유무
	$('#submitBtn').click(function () {
		var aptDetailInfoSeqVal = 1 + "_" + $("#candidateInfoDong option:selected").val() + "_" + $("#candidateInfoHo option:selected").val();
		console.log("aptDetailInfoSeq : " + aptDetailInfoSeqVal);
		$("#aptDetailInfoSeq").val(aptDetailInfoSeqVal);
		console.log("#aptDetailInfoSeq : " + $("#aptDetailInfoSeq").val());
		/* if (confirm("회원가입을 하시겠습니까?")) {
			if (idck == 0) {
				alert('아이디 중복체크를 해주세요');
				return false;
			} else {
				alert("회원가입을 축하합니다");
				$("#frm").submit();
			}
		} */
		if (idck == 0) {
			alert('아이디 중복체크를 해주세요');
			return false;
		} else {
			/* alert("회원가입을 축하합니다");
			$("#frm").submit(); */
		}

		if (verifiedNo == 0) {
			alert('휴대전화번호 본인 인증을 해주세요.');
			return false;
		}
	});




	/* 선택된 동에 따라 호수 변화 function */
	$(function () {
		var bdNm = 0;

		$("#candidateInfoDong").change(function () {
			bdNm = $(this).val();
			console.log(bdNm);

			$.ajax({
				url: "/onepart/resident/changeBdNm2",
				data: { bdNm: bdNm },
				type: "get",
				success: function (data) {
					console.log(data);
					$("#candidateInfoHo option").remove();
					var $option1 = $("<option>").text("원하는 호 선택").val("");

					$("#candidateInfoHo").append($option1);

					console.log(data.hoList[0].rmNm);

					for (var i = 0; i < data.hoList.length; i++) {
						console.log("aa");
						var $optionText = data.hoList[i].rmNm + "호";
						var $optionHo = $("<option>").val(data.hoList[i].rmNm);
						$optionHo.append($optionText);
						$("#candidateInfoHo").append($optionHo);
					}

				},
			});
		});
	});


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

</script>


</body>

</html>