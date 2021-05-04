<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>OnePart(원파트) | 관리자 로그인 페이지</title>
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
<body class="pace-top">
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>
	<!-- end #page-loader -->

	<div class="login-cover">
	    <div class="login-cover-image"><img src="${contextPath}/resources/img/login-bg/bg-8.jpg" data-id="login-cover-image" alt="" /></div>
	    <div class="login-cover-bg"></div>
	</div>
	<!-- begin #page-container -->
	<div id="page-container" class="fade">
	    <!-- begin login -->
        <div class="login login-v2" data-pageload-addclass="animated fadeIn">
            <!-- begin brand -->
            <div class="login-header">
                <div class="brand">
                    <img style=" width: 200px; position: absolute; left: 120px;" src="${contextPath}/resources/images/onpart (1).png" alt="" />
                    <small style=" position: absolute; top: -30px; left: 10px;">관리자 페이지 로그인</small>
                </div>
            </div>
            <!-- end brand -->
            <div class="login-content">
                    <div class="form-group m-b-20">
                        <input type="text" class="form-control input-lg" placeholder="아이디를 입력하세요." name="managerId" id="managerId" />
                    </div>
                    <div class="form-group m-b-20">
                        <input type="password" class="form-control input-lg" placeholder="비밀번호를 입력하세요."  name="managerPwd" id="managerPwd" />
                    </div>
                    <div class="checkbox m-b-20">
                        <label>
                            <input type="checkbox" /> 자동 로그인
                        </label>

                        <label id="warnMessage" style="color:red;position: absolute; top: 19px; left: -17px;">

                        </label>
                    </div>
                    <div class="login-buttons">
                        <button class="btn btn-success btn-block btn-lg" onclick="login()">로그인</button>
                    </div>
                    <div class="m-t-20" style="">
                       <%--  회원가입을 하시려면 <a href="${contextPath }/moveRegister">여기</a>를 클릭하세요. --%>
                    </div>
                    <div class="m-t-20" style="margin-top: 1%!important">
                        <a href="${contextPath }/moveFindId">아이디</a>,<a href="${contextPath }/moveFindPwd">비밀번호</a>를 잃어버리셨습니까?<br>
                        <a href="${contextPath }/moveAccount" style="color: grey;">입주자 로그인</a>
                    </div>

            </div>
        </div>
        <!-- end login -->

        <ul class="login-bg-list">
            <li class="active"><a href="#" data-click="change-bg"><img src="${contextPath}/resources/img/login-bg/bg-11.jpg" alt="" /></a></li>
            <li><a href="#" data-click="change-bg"><img src="${contextPath}/resources/img/login-bg/bg-12.jpg" alt="" /></a></li>
            <li><a href="#" data-click="change-bg"><img src="${contextPath}/resources/img/login-bg/bg-14.jpeg" alt="" /></a></li>
            <li><a href="#" data-click="change-bg"><img src="${contextPath}/resources/img/login-bg/bg-8.jpg" alt="" /></a></li>
            <li><a href="#" data-click="change-bg"><img src="${contextPath}/resources/img/login-bg/bg-1.jpg" alt="" /></a></li>
        </ul>


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
	<script src="${contextPath}/resources/js/login-v2.demo.min.js"></script>
	<script src="${contextPath}/resources/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->

	<script>
		$(document).ready(function() {
			App.init();
			LoginV2.init();

			 $(".input-lg").keydown(function(key) {
	                if (key.keyCode == 13) {
	                	login();
	                }
	            });
		});


		function login() {
			var managerId = $("#managerId").val();
			var managerPwd = $("#managerPwd").val();

			$.ajax({
	 			url: "managerLoginCheck",
	 			type: "post",
	 			data: {
	 				managerId : managerId,
	 				managerPwd : managerPwd
	 			},
	 			success:function(data){
					console.log("data : " + data);
					if(data.msg != null){
						/* alert("로그인 실패 메시지 출력") */
						$("#warnMessage").text(data.msg)
					}else{
						/* alert("로그인 성공! 메인 페이지 이동") */
						window.location.href = "manager/main";
						/* $("body").html(data); */
					}

	 			},
				error:function(xhr, status){
					alert(xhr + " : " + status);
				}
			});
	}

	</script>
</body>
</html>
