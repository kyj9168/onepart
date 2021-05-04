<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){

		// 모달창 이동
		$('.modal-dialog').draggable({
		      handle: ".modal-header"
		});


		$('#enrollBtn').click(function(){
			var resultObj = {};
			resultObj.loginUser = '${loginUser.residentSeq}';
			resultObj.surveySeq = '${surveyVO.surveySeq}';
			var surveyQstnSeqArray = [];

			var answerResult = [];

			console.log(resultObj.loginUser);
			console.log(resultObj.surveySeq);

			$('.questionArea').each(function(){
				var num = $(this).children().eq(0).val();

				var questionArray = [];
				var len = $(this).children('[name=answer]').length;
				console.log("leng :: "  + len);
				$(this).children('[name=answer]').each(function(index){

					var input = $(this).eq(0);
					var value;

					var surveyQstnSeq = $(this).parents('.questionArea').children('#surveyQstnSeq').eq(0).val();

					var flag = true;
					for(var i=0; i<surveyQstnSeqArray.length; i++){
						if(surveyQstnSeq == surveyQstnSeqArray[i]){
							flag = false;
							console.log("false in!!");
						}
					}

					if(flag){
						console.log("flag in!!");
						surveyQstnSeqArray.push(surveyQstnSeq);
					}

					if(input.attr('type') == 'radio' && input.is(":checked")){
						value = input.val()+"";
						questionArray.push(value);
					} else if(input.attr('type') == 'checkbox' && input.is(":checked")){
						value = input.val()+"";
						questionArray.push(value);
					} else if(input.attr('type') == 'text' || input.prop('tagName') == 'TEXTAREA')  {

						value = input.val()+"";
						questionArray.push(value);
					}
				});

				answerResult.push(questionArray);
			});

			console.log('-------end--------')

			resultObj.answerList = answerResult;
			resultObj.surveyQstnSeqArray = surveyQstnSeqArray;
			var resultStr = JSON.stringify(resultObj);
			console.log(answerResult);
			console.log(resultStr);

			$.ajax({
				url : 'insertsurveyPrtcpt',
				type : 'post',
				data : {resultStr : resultStr},
				success : function(data) {
					console.log('succ');
					$('#modal-dialog').modal("hide");
					$('.modal-backdrop').remove();
					$('.modal-open').css("overflow", "visible");
					$("#content").html(data);
				},
				error : function(error) {
					console.log('error');
				}
			});

		});

	});

</script>
</head>
<body>
	<!-- #modal-dialog -->
	<div class="modal fade" id="modal-dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title"><i class="fa fa-pencil-square-o"></i>설문조사</h3>
				</div>
				<div class="modal-body">
					<h4><c:out value="${ surveyVO.surveyTitle }"/></h4>
					<p><c:out value="${ surveyVO.surveySimpleIntro }"/></p>
					<hr>
					<div>
						<c:forEach var="surveyQstn" items="${surveyQstnList }">
							<div class="questionArea">
								<input type="hidden" class="numData" value="${ surveyQstn.surveyQstnNum }">

								<!-- 단답형 -->
								<c:if test="${surveyQstn.surveyQstnType == 1 }">

									<h4><i class="fa fa-pencil"></i><c:out value=" ${surveyQstn.surveyQstnTitle }"/></h4>
									<input type="text" class="form-control answer" placeholder="내용을 입력해주세요." name="answer">
								</c:if>

								<!-- 장문형 -->
								<c:if test="${surveyQstn.surveyQstnType == 2 }">
									<h4><i class="fa fa-pencil-square-o"></i><c:out value=" ${surveyQstn.surveyQstnTitle }"/></h4>
									<textarea class="form-control answer" placeholder="내용을 입력해주세요." rows="5" name="answer" style="resize: none;"></textarea>
								</c:if>

								<!-- 객관식 -->
								<c:if test="${surveyQstn.surveyQstnType == 3 }">
									<h4><i class="fa fa-dot-circle-o"></i><c:out value=" ${surveyQstn.surveyQstnTitle }"/></h4>
									<c:forEach var="surveyQstnOption" items="${surveyQstnOptionList}">
										<c:if test="${surveyQstnOption.surveyQstnSeq == surveyQstn.surveyQstnSeq}">
											<input type="radio" class="answer" data-render="switchery" data-theme="default" name="answer" id="${surveyQstnOption.surveyQstnSeq}_${surveyQstnOption.surveyQstnOptionNum}" value="${surveyQstnOption.surveyQstnOptionContent}">
											<h4 style="display: inline-block;"><label for="${surveyQstnOption.surveyQstnSeq}_${surveyQstnOption.surveyQstnOptionNum}"><c:out value="${surveyQstnOption.surveyQstnOptionContent}"/></label></h4>
											<br>
										</c:if>
									</c:forEach>
								</c:if>

								<!-- 체크박스 -->
								<c:if test="${surveyQstn.surveyQstnType == 4 }">
									<h4><i class="fa fa-check-square-o"></i><c:out value=" ${surveyQstn.surveyQstnTitle }"/></h4>
									<c:forEach var="surveyQstnOption" items="${surveyQstnOptionList}">
										<c:if test="${surveyQstnOption.surveyQstnSeq == surveyQstn.surveyQstnSeq}">
											<input type="checkbox" class='answer' data-render="switchery" data-theme="default" name="answer" id="${surveyQstnOption.surveyQstnSeq}_${surveyQstnOption.surveyQstnOptionNum}" value="${surveyQstnOption.surveyQstnOptionContent}">
											<h4 style="display: inline-block;"><label for="${surveyQstnOption.surveyQstnSeq}_${surveyQstnOption.surveyQstnOptionNum}"><c:out value="${surveyQstnOption.surveyQstnOptionContent}"/></label></h4>
											<br>
										</c:if>
									</c:forEach>
								</c:if>
								<hr>
								<input type="hidden" value="${surveyQstn.surveyQstnSeq}" id="surveyQstnSeq">
							</div>
						</c:forEach>
					</div>
				</div>

				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" id="close">닫기</a>
					<a class="btn btn-sm btn-primary" id="enrollBtn">완료</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>