<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../superintend_vote/superintend_vote_include.jsp"></jsp:include>
<jsp:include page="../superintend_vote/superintend_vote_detail_include_3.jsp"></jsp:include>
<!-- 선거결과 div -->
<div style="width:95%; margin:0 auto">
	<!-- title div -->
	<table style="width:95%">
		<tr>
			<td>
				<div class="form-group">
                    <h4>선거 결과</h4>                   
                </div>
			</td>
		</tr>
	</table>
	<!-- 결과그래프 div -->
	<div style="width:95%">
	<hr>
	<h4>선거결과</h4>
			<div>
				<table style="width:100%">
					<tr>
						<td style="width:50%">
							<!-- 짝수번 후보 정보 -->
							<div>
								<table style="width:100%">
									<tr>
										<td style="width:40%"><h3>기호1번 김은혜</h3></td>
										<td>당선</td>
										<td style="width:50%"></td>
									</tr>
									<tr>
										<td colspan="3"><div style="background:skyblue; height:20px; width:87%"></div></td>
									</tr>
									<tr>
										<td><p>58%</p></td>
										<td></td>
										<td></td>
									</tr>
									<tr style="height:20px;">
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>선거 총 참여율 : 68.3%</td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div>
						</td>
						<td style="width:5%"></td>
						<td>
							<!-- 홀수번 후보 정보 -->
							<div>
								<table style="width:100%; text-align:right;">
									<tr>
										<td></td>
										<td style=""><h3>기호2번 고동하</h3></td>
										<td></td>
									</tr>
									<tr align="right">
										<td colspan="3"><div style="background:skyblue; height:20px; width:60%"></div></td>
									</tr>
									<tr>
										<td></td>
										<td><p>40%</p></td>
										<td></td>
									</tr>
									<tr style="height:20px;">
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td>무효표 : 2%</td>
										<td></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>
		<br><br>
	</div>
</div>
</body>
</html>