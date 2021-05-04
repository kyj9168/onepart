<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Complaint
	<i class="fa fa-2x fa-fire-extinguisher"></i><h2 class="text-muted m-l-5">민원접수 </h2>
	<hr>
	<div class="panel-body">
		<table class="table table-striped">
			<thead align="center">
				<tr>
					<th>#</th>
					<th>작성자</th>
					<th>제목</th>
					<th>등록일</th>
				 	<th>상태</th>
					<button id="moveComplaintWrite" type="button" class="btn btn-success m-r-5 m-b-5">민원접수</button>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="complaintVo">
				<tr>
					<td>${complaintVo.complaintSeq}</td>
					<td>${complaintVo.residentSeq}</td>
					<td id="moveComplaintDetail">${complaintVo.complaintTitle}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${complaintVo.complaintEnrollDt}"/></td>
					<td>${complaintVo.complaintStatus }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<hr>
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
	<script type="text/javascript">
	$(function(){
		$("#moveComplaintDetail").data("menu-url", "/onepart/resident/moveComplaintDetail"); 	
		$("#moveComplaintDetail").data("menu-url", "/onepart/resident/moveComplaintDetail");
		$("#moveComplaintDetail").click(function(){
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
		$("#moveComplaintWrite").data("menu-url", "/onepart/resident/moveComplaintWrite"); 	
		
		$("#moveComplaintWrite").click(function(){
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