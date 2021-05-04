<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Notice
	<i class="fa fa-2x fa-bullhorn"></i>
	<h2 class="text-muted m-l-5">공지사항</h2>
	<hr>
	<div class="panel panel-inverse" data-sortable-id="index-4">
		<div class="panel-heading">
			<textarea class="form-control no-rounded-corner bg-silver" rows="1">공지사항 title</textarea>
		</div>
		<div class="panel-toolbar">
			<div class="btn-group m-r-5">
				<a class="btn btn-white" href="javascript:;"><i
					class="fa fa-bold"></i></a> <a class="btn btn-white active"
					href="javascript:;"><i class="fa fa-italic"></i></a> <a
					class="btn btn-white" href="javascript:;"><i
					class="fa fa-underline"></i></a>
			</div>
			<div class="btn-group">
				<a class="btn btn-white" href="javascript:;"><i
					class="fa fa-align-left"></i></a> <a class="btn btn-white active"
					href="javascript:;"><i class="fa fa-align-center"></i></a> <a
					class="btn btn-white" href="javascript:;"><i
					class="fa fa-align-right"></i></a> <a class="btn btn-white"
					href="javascript:;"><i class="fa fa-align-justify"></i></a>
			</div>
				<span class="btn btn-success fileinput-button">
                      <i class="fa fa-plus"></i>
                      <span>Add files</span> <input type="file" name="files[]" multiple="">
                </span>
		</div>
		<textarea class="form-control no-rounded-corner bg-silver" rows="14">내용을 입력하시죠</textarea>
		<div class="panel-footer text-right">
			<a href="javascript:;" class="btn btn-white btn-sm">취소</a> <a
				href="javascript:;" class="btn btn-primary btn-sm m-l-5">작성</a>
		</div>
	</div>

</body>
</html>