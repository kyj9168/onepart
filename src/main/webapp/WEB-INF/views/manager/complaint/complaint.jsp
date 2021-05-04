<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<tr>
					<td>1</td>
					<td>John</td>
					<td id="moveComplaintDetail">가로등좀 고쳐주세요</td>
					<td>2019/08/29</td>
					<td>반려</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Eunhae</td>
					<td>민원접수 제목</td>
					<td>2019/08/29</td>
					<td>반려</td>
				</tr>
				<tr>
					<td>3</td>
					<td>Dongha</td>
					<td>민원접수 제목</td>
					<td>2019/08/29</td>
					<td>반려</td>
				</tr>
				<tr>
					<td>4</td>
					<td>YoungJun</td>
					<td>민원접수 제목</td>
					<td>2019/08/29</td>
					<td>반려</td>
				</tr>
				<tr>
					<td>5</td>
					<td>John</td>
					<td>가로등좀 고쳐주세요</td>
					<td>2019/08/29</td>
					<td>반려</td>
				</tr>
				<tr>
					<td>6</td>
					<td>Eunhae</td>
					<td>민원접수 제목</td>
					<td>2019/08/29</td>
					<td>반려</td>
				</tr>
				<tr>
					<td>7</td>
					<td>Dongha</td>
					<td>민원접수 제목</td>
					<td>2019/08/29</td>
					<td>반려</td>
				</tr>
				<tr>
					<td>8</td>
					<td>YoungJun</td>
					<td>민원접수 제목</td>
					<td>2019/08/29</td>
					<td>반려</td>
				</tr>
				<tr>
					<td>9</td>
					<td>John</td>
					<td>가로등좀 고쳐주세요</td>
					<td>2019/08/29</td>
					<td>반려</td>
				</tr>
				<tr>
					<td>10</td>
					<td>Eunhae</td>
					<td>민원접수 제목</td>
					<td>2019/08/29</td>
					<td>반려</td>
				</tr>
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
		$("#moveComplaintDetail").data("menu-url", "/onepart/manager/moveComplaintDetail"); 	
		
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
		$("#moveComplaintWrite").data("menu-url", "/onepart/manager/moveComplaintWrite"); 	
		
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