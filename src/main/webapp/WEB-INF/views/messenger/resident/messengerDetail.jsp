<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<!-- ================== END BASE JS ================== -->

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

	<style type="text/css">
		.bg-white {
			height: 620px;
		}

	</style>
</head>
<body>
	 <!-- begin vertical-box -->
		    <div class="vertical-box">
		        <!-- end vertical-box-column -->
		        <!-- begin vertical-box-column -->
		        <div class="vertical-box-column bg-white">
		            <!-- begin wrapper -->
                    <div class="wrapper bg-silver-lighter clearfix">
                        <div class="btn-group m-r-5">
                            <a href="#" class="btn btn-white btn-sm p-l-20 p-r-20"><i class="fa fa-trash"></i></a>
                        </div>
                        <div class="pull-right">
                            <div class="btn-group m-l-5">
                                <a href="moveMessenger" class="btn btn-white btn-sm"><i class="fa fa-arrow-left"></i></a>
                            </div>
                        </div>
                    </div>
		            <!-- end wrapper -->
		            <!-- begin wrapper -->
                    <div class="wrapper">
                        <ul class="media-list underline m-b-20 p-b-15">
                            <li class="media media-sm clearfix" >
                                <span class="pull-left"><i class="fa fa-4x fa-envelope-o"></i></span>
                                <div class="media-body">
                                    <span class="email-from text-inverse f-w-600">
                                        from :
                                        <c:if test="${basicInfo.sendResidentNm != null }">
	                                        <c:out value="${basicInfo.sendResidentNm }"/>
                                        </c:if>
                                        <c:if test="${basicInfo.sendManagerNm != null }">
	                                        <c:out value="${basicInfo.sendManagerNm }"/>
                                        </c:if>
                                    </span>
                                    <br />

                                    <span class="email-to">
                                        To:
                                        <c:if test="${basicInfo.receiverResidentNm != null }">
	                                        <c:out value="${basicInfo.receiverResidentNm }"/>
                                        </c:if>
                                        <c:if test="${basicInfo.receiverManagerNm != null }">
	                                        <c:out value="${basicInfo.receiverManagerNm }"/>
                                        </c:if>
                                    </span>

                                    <br />

                                    <span class="text-muted "><i class="fa fa-clock-o fa-fw"></i> <c:out value="${basicInfo.messengerEnrollDt }"/></span>
                                </div>
                            </li>
						</ul>
                        <ul class="attached-document clearfix">

                            <!-- 첨부파일 -->
                            <c:forEach var="attachVO" items="${attachVOList}">
                            <li>
                                <div class="document-name">
                                	<a href="downloadAttachment?attchSeq=${attachVO.attchSeq }">${attachVO.originNm }</a></div>
                                <div class="document-file">
                                    <a href="downloadAttachment?attchSeq=${attachVO.attchSeq }">
                                        <i class="fa fa-file-pdf-o"></i>
                                    </a>
                                </div>
                            </li>
                            </c:forEach>

                            <!-- 이미지 -->
                            <c:forEach var="imgVO" items="${imgVOList}">
                            <li>
	                            <div class="document-name"><a href="#">${imgVO.originNm }</a></div>
	                            <div class="document-file">
	                                <a href="downloadImage?imageSeq=${imgVO.imageSeq}">
	                                    <img src="${contextPath}/resources/uploadFiles/messenger/image/${imgVO.changeNm}" alt="${imgVO.originNm }" />
	                                </a>
	                            </div>
                            </li>
                            </c:forEach>
                        </ul>
						<hr>
						<div class="wrapper">
							<c:out value="${basicInfo.messengerContent }"/>
						</div>
                    </div>
		        </div>
		        <!-- end vertical-box-column -->
		    </div>
		    <!-- end vertical-box -->
</body>
</html>