<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Resident Manager
	<i class="fa fa-2x fa-users"></i>
	<h2 class="text-muted m-l-5">회원정보 수정</h2>
	<div align="center">
		<div class="panel-body panel-form">
			<form class="form-horizontal form-bordered"
				data-parsley-validate="true" name="demo-form" novalidate="">
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="fullname">이름*
						:</label>
					<div class="col-md-6 col-sm-6">
						<input class="form-control" type="text" id="fullname"
							name="fullname" placeholder="Required"
							data-parsley-required="true" data-parsley-id="6114">
						<ul class="parsley-errors-list" id="parsley-id-6114"></ul>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="fullname">아이디*
						:</label>
					<div class="col-md-6 col-sm-6">
						<input class="form-control" type="text" id="fullname"
							name="fullname" placeholder="Required"
							data-parsley-required="true" data-parsley-id="6114">
						<ul class="parsley-errors-list" id="parsley-id-6114"></ul>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="email">이메일
						* :</label>
					<div class="col-md-6 col-sm-6">
						<input class="form-control" type="text" id="email" name="email"
							data-parsley-type="email" placeholder="Email"
							data-parsley-required="true" data-parsley-id="9012">
						<ul class="parsley-errors-list" id="parsley-id-9012"></ul>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="message">Phone
						:</label>
					<div class="col-md-6 col-sm-6">
						<input class="form-control" type="text" id="data-phone"
							data-parsley-type="number" placeholder="(XXX) XXXX XXX"
							data-parsley-id="2420">
						<ul class="parsley-errors-list" id="parsley-id-2420"></ul>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="message">아파트
						동 :</label>
					<div class="col-md-6 col-sm-6">
						<input class="form-control" type="text" id="number" name="number"
							data-parsley-type="number" placeholder="Number"
							data-parsley-id="0006">
						<ul class="parsley-errors-list" id="parsley-id-0006"></ul>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="message">아파트
						호 :</label>
					<div class="col-md-6 col-sm-6">
						<input class="form-control" type="text" id="number" name="number"
							data-parsley-type="number" placeholder="Number"
							data-parsley-id="0006">
						<ul class="parsley-errors-list" id="parsley-id-0006"></ul>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4"></label>
					<div class="col-md-6 col-sm-6">
						<button type="submit" class="btn btn-primary">수정완료</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>