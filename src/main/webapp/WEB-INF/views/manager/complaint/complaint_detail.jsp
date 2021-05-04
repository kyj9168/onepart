<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>민원접수</title>
</head>
<body>
	<div class="wrapper">
Complaint
	<i class="fa fa-2x fa-fire-extinguisher"></i><h2 class="text-muted m-l-5">가로등좀 고쳐주세요 </h2>
	<div align="top-right">
			<select id="status" class="btn btn-success m-r-4 m-b-4">
				<option value="#1">#1(접수중)</option>
				<option value="#2">#2(처리중)</option>
				<option value="#3">#3(완료)</option>
				<option value="#4">#4(반려)</option>
			</select>
			<button type="button" class="btn btn-success m-r-4 m-b-4"">상태변경</button>
	</div>
	<hr>
		<button id="moveComplaintUpdate" type="button" class="btn btn-success m-r-4 m-b-4"">수정하기</button>
		<ul class="media-list underline m-b-20 p-b-15">
			<li class="media media-sm clearfix">
			<a href="javascript:;" class="pull-left"> <img class="media-object rounded-corner"
					alt="" src="">
			</a>
				<div class="media-body">
					<span class="email-from text-inverse f-w-600"> from John </span><span
						class="text-muted m-l-5"><i class="fa fa-clock-o fa-fw"></i>
						2019/08/29 8: 30 AM</span><br>
				</div></li>
		</ul>
		<ul class="attached-document clearfix">
			<li>
				<div class="document-name">
					<a href="#">가로등1</a>
				</div>
				<div class="document-file">
					<a href="#"><img src=""></i> </a>
				</div>
			</li>
			<li>
				<div class="document-name">
					<a href="#">가로등2</a>
				</div>
				<div class="document-file">
					<a href="#"> <img src="">
					</a>
				</div>
			</li>
		</ul>
		<hr>
		<p class="f-s-12 text-inverse">
			불빛이 들어오질 않내요 <br> 고쳐주세요
		</p>
	</div>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<!-- 댓글 부분 -->
	<div id="comment">
		<table border="1" bordercolor="lightgray">
			<!-- 댓글 목록 -->
			<c:if test="${requestScope.commentList != null}">
				<c:forEach var="comment" items="${requestScope.commentList}">

					<tr>
						<!-- 아이디, 작성날짜 -->
						<td width="150">
							<div>
								${comment.comment_id}<br> <font size="2" color="lightgray">${comment.comment_date}</font>
							</div>
						</td>
						<!-- 내용 -->
						<td width="550">
							<div class="text_wrapper">${comment.comment_content}</div>
						</td>
						<!-- 버튼 -->
						<td width="100">
							<div id="btn" style="text-align: center;">
								<a href="#">[답변]</a><br><!-- 관리자일 경우 답변색깔다르게?  -->
								<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
								<c:if test="${comment.comment_id == sessionScope.sessionID}">
									<a href="#">[수정]</a>
									<br>
									<a href="#">[삭제]</a>
								</c:if>
							</div>
						</td>
					</tr>

				</c:forEach>
			</c:if>

			<!-- 로그인 했을 경우만 댓글 작성가능 -->
			<c:if test="${sessionScope.sessionID !=null}">
				<tr bgcolor="#F5F5F5">
					<form id="writeCommentForm">
						<input type="hidden" name="comment_board"
							value="${board.board_num}"> <input type="hidden"
							name="comment_id" value="${sessionScope.sessionID}">
						<!-- 아이디-->
						<td width="600">
							<div>${sessionScope.sessionID}</div>
						</td>
						<!-- 본문 작성-->
						<td width="600">
							<div>
								<textarea name="comment_content" rows="4" cols="70"></textarea>
							</div>
						</td>
						<!-- 댓글 등록 버튼 -->
						<td width="100">
							<div id="btn" style="text-align: center;">
								<p>
									<a href="#" onclick="writeCmt()">[댓글등록]</a>
								</p>
							</div>
						</td>
					</form>
				</tr>
			</c:if>

		</table>
	</div>
	<div align="center">
		<a class="btn btn-white" style="width:100%" id="menuComplaint">목록</a>
	</div>
	<script>
		$(function(){
			$("#menuComplaint").data("menu-url", "/onepart/manager/menuComplaint");

			$("#menuComplaint").click(function(){
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
			$("#moveComplaintUpdate").data("menu-url", "/onepart/manager/moveComplaintUpdate");

			$("#moveComplaintUpdate").click(function(){
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