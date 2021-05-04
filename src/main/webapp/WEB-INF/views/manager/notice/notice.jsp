<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<br>
<!-- begin #content -->
Notice
	<i class="fa fa-2x fa-bullhorn"></i><h2 class="text-muted m-l-5">공지사항</h2>
	<div align="right">
		<select name="" id="notice_seq" class="btn btn-primary btn-sm m-l-5">
			<option value="#1">#1</option>
			<option value="#2">#2</option>
			<option value="#3">#3</option>
			<option value="#4">#4</option>
			<option value="#5">#5</option>
			<option value="#6">#6</option>
		</select>
		<a id="moveNoticeUpdate" href="javascript:;" class="btn btn-primary btn-sm m-l-5">수정하기</a>
	</div>
	<hr>
			<!-- 작성부분 -->
			<br>
			<br>
			<div class="col-md-6" style="width: 1200px;">
				<div class="panel-group" id="accordion">
					<div align="center" class="panel panel-inverse overflow-hidden">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a class="accordion-toggle accordion-toggle-styled"
									data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne" aria-expanded="true"> <i
									class="fa fa-plus-circle pull-right"></i>
									<table>
										<tbody>
											<td>${noticeVo.noticeSeq}</td>
											<td>${noticeVo.noticeTitle}</td>
											<td>${noticeVo.noticeContent}</td>
											<td>${noticeVo.noticeEnrollDt}</td>
										</tbody>
									</table>
								</a>
							</h3>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in"
							aria-expanded="true" style="">
							<div class="panel-body">
								<div class="imgBody" align="center">
									<img style="width: 40%; height: 40%; text-align: center"
										src="${ contextPath }/resources/images/madong.jpg"><br>
									<br>
									<br>
									<br>
								</div>
								공지사항 내용 입니다.
							</div>
						</div>
					</div>
					<div class="panel panel-inverse overflow-hidden" align="center">
						<div class="panel-heading">
							<h3 class="panel-title" >
								<a class="accordion-toggle accordion-toggle-styled collapsed"
									data-toggle="collapse" data-parent="#accordion"
									href="#collapseTwo" aria-expanded="false"> <i
									class="fa fa-plus-circle pull-right"></i>
									<table>
										<tr>
											<td>2019. 09. 08</td>
										</tr>
									</table> 아파트 공지사항 #2
								</a>
							</h3>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse"
							aria-expanded="false" style="height: 0px;">
							<div class="panel-body">
								<div class="imgbody" align="center">
									<img style="width: 40%; height: 40%; text-align: center"
										src="${ contextPath }/resources/images/spring.png"><br>
									<br>
									<br>
									<br>
								</div>
								공지사항 내용입니다.
							</div>
						</div>
					</div>
					<div class="panel panel-inverse overflow-hidden" align="center">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a class="accordion-toggle accordion-toggle-styled collapsed"
									data-toggle="collapse" data-parent="#accordion"
									href="#collapseThree" aria-expanded="false"> <i
									class="fa fa-plus-circle pull-right"></i> 공지제목 #3
								</a>
							</h3>
						</div>
						<div id="collapseThree" class="panel-collapse collapse"
							aria-expanded="false" style="height: 0px;">
							<div class="panel-body">내용</div>
						</div>
					</div>
					<div class="panel panel-inverse overflow-hidden" align="center">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a class="accordion-toggle accordion-toggle-styled collapsed"
									data-toggle="collapse" data-parent="#accordion"
									href="#collapseFour" aria-expanded="false"> <i
									class="fa fa-plus-circle pull-right"></i> 공지제목 #4
								</a>
							</h3>
						</div>
						<div id="collapseFour" class="panel-collapse collapse"
							aria-expanded="false" style="height: 0px;">
							<div class="panel-body">내용</div>
						</div>
					</div>
					<div class="panel panel-inverse overflow-hidden" align="center">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a class="accordion-toggle accordion-toggle-styled collapsed"
									data-toggle="collapse" data-parent="#accordion"
									href="#collapseFive" aria-expanded="false"> <i
									class="fa fa-plus-circle pull-right"></i> 공지제목 #5
								</a>
							</h3>
						</div>
						<div id="collapseFive" class="panel-collapse collapse"
							aria-expanded="false" style="height: 0px;">
							<div class="panel-body">공지내용</div>
						</div>
					</div>
					<div class="panel panel-inverse overflow-hidden" align="center">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a class="accordion-toggle accordion-toggle-styled collapsed"
									data-toggle="collapse" data-parent="#accordion"
									href="#collapseSix" aria-expanded="false"> <i
									class="fa fa-plus-circle pull-right"></i> 공지제목 #6
								</a>
							</h3>
						</div>
						<div id="collapseSix" class="panel-collapse collapse"
							aria-expanded="false" style="height: 0px;">
							<div class="panel-body">공지내용</div>
					</div>
				</div>
			</div>
		</div>

		<div align="center">
		<ul class="pagination m-t-0 m-b-10" >
			<li class="disabled"><a href="javascript:;">«</a></li>
			<li class="active"><a href="javascript:;">1</a></li>
			<li><a href="javascript:;">2</a></li>
			<li><a href="javascript:;">3</a></li>
			<li><a href="javascript:;">4</a></li>
			<li><a href="javascript:;">5</a></li>
			<li><a href="javascript:;">»</a></li>
		</ul>
	</div>
	<div>
		<form class="navbar-form full-width" align="center">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="검색">
				<button type="submit" class="btn btn-search">
					<span class="fa fa-search"></span>
				</button>
			</div>
		</form>
	</div>
	</div>
		<!-- end #content -->
<a id="moveNoticeWrite" class="btn btn-danger btn-block">공지사항 작성하기</a>

<script type="text/javascript">
	$(function(){
		$("#moveNoticeWrite").data("menu-url", "/onepart/resident/moveNoticeWrite");

		$("#moveNoticeWrite").click(function(){
			var menuUrl = $(this).data("menu-url");
			console.log(menuUrl);

			$.ajax({
				url :menuUrl,
				dataType : "html",
				success:function(result){
					$("#content").html(result);
				}

			});
		});

	});
	$(function(){
		$("#moveNoticeUpdate").data("menu-url", "/onepart/resident/moveNoticeUpdate");

		$("#moveNoticeUpdate").click(function(){
			var menuUrl = $(this).data("menu-url");
			console.log(menuUrl);

			$.ajax({
				url :menuUrl,
				dataType : "html",
				success:function(result){
					$("#content").html(result);
				}

			});
		});

	});






</script>

</body>
</html>