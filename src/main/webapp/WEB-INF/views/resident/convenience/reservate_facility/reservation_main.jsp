<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<!-- 전체 div -->
	<div>
		<div style="width:85%; margin:0 auto">
		<br>
		<h2>시설물 예약하기</h2>
		<hr>
		<br>
			<!-- 나의 예약현황 div -->
			<h4>나의 예약현황</h4>
			<div class="panel-body" style="background:white">
                <table class="table table-hover" style="text-align:center;">
                    <thead>
                         <tr>
                             <td style="font-weight:bold;">예약번호</td>
                             <td style="font-weight:bold;">시설명</td>
                             <td style="font-weight:bold;">이용날짜</td>
                             <td style="font-weight:bold;">이용시간</td>
                             <td style="font-weight:bold;">신청일</td>
                             <td style="font-weight:bold;">현황</td>
                             <td style="font-weight:bold;">예약취소</td>
                         </tr>
                      </thead>
                      <tbody>
                     		<c:forEach var="reservationList" items="${ reservationList }">
								<tr>
									<td>${ reservationList.facRsrvSeq }</td>
									<td>${ reservationList.facNm }</td>
									<td>${ reservationList.propUseDt }</td>
									<td>${ reservationList.propUseTm }</td>
									<td>${ reservationList.enrollDt }</td>
									<td>
										<c:if test="${ reservationList.propStatus == 1}">
											예약대기
										</c:if>
										<c:if test="${ reservationList.propStatus == 2}">
											예약완료
										</c:if>
										<c:if test="${ reservationList.propStatus == 3}">
											예약반려
										</c:if>
									</td>
									<td>
										<c:if test="${ reservationList.propStatus == 1}">
											<a href="#modal-dialog" class="btn btn-danger btn-icon btn-circle btn-xs cancelBtn" data-toggle="modal" onclick="cancelReservation(${ reservationList.facRsrvSeq });">
												<i class="fa fa-times"></i>
											</a>
										</c:if>
									</td>
								</tr>
                         	</c:forEach>
                     </tbody>
              	</table>
       		</div>
		</div>
		<br><br>
		<div>
			<!-- 공공시설물 리스트 div -->
			<div style="width:85%; margin:0 auto">
			<h4>우리아파트 공공시설물</h4>
               <ul class="result-list">
               <c:forEach var="list" items="${ list }">
               	<li>
               		<div class="result-image" style="width:20%;">
                       	<a href="javascript:;"><img src="${ contextPath }/resources/uploadFiles/reservation/${ list.changeNm }" alt="" style="width:100%; height:213px"/></a>
                    </div>
                    <div class="result-info" style="width:65%">
                    	<br>
                        <h4 class="title"><a href="javascript:;">${ list.facNm }</a></h4>
                        <br>
                        <p class="desc">
                           	 위치 : ${ list.facPosition }
                        </p>
                        <p class="desc">
                            	이용시간 : ${ list.facAvailWeekOfDay } ${ list.facAvailTm }
                        </p>
                        <p class="desc">
                            	이용료 : 시간당 ${ list.facDefaultFee }원
                        </p>
                    </div>
                    <div class="result-price" align="center">
                    	<c:if test="${ list.facType == 2}">
                        <a onclick="reservateGeneral(${list.facSeq});" class="btn btn-inverse btn-block" style="margin:0 auto; margin-top:85%">예약하기</a>
                        </c:if>
                        <c:if test="${ list.facType == 1}">
                        <a onclick="reservateSeat(${list.facSeq});" class="btn btn-inverse btn-block" style="margin:0 auto; margin-top:85%">예약하기</a>
                        </c:if>
                    </div>
               	</li>
               </c:forEach>
               </ul>
			</div>
		</div>
	</div>
</div>
<!-- 예약취소 modal -->
<div class="modal fade" id="modal-dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">예약 취소하기</h4>
			</div>
			<div class="modal-body">
				해당 내역의 예약을 취소하시겠습니까? <br>
				취소완료 후에는 복구가 불가능 하며, 재예약을 진행하셔야 합니다.
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" onclick="deleteReservation(${ sessionScope.loginUser.residentSeq });">예약취소</a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var facRsrvSeq;
	/* 예약취소 function */
	function cancelReservation(num) {
		facRsrvSeq = num;
		console.log(facRsrvSeq);
	}
	/* 예약취소 완료 fucntion */
	function deleteReservation(residentSeq) {
		console.log("취소할 예약번호 : " + facRsrvSeq);

		$.ajax({
			url:"/onepart/resident/deleteUserReservation",
			type:"post",
			dataType:"html",
			data:{facRsrvSeq:facRsrvSeq, residentSeq:residentSeq},
			success:function(data){
				$.ajax({
					url:"/onepart/resident/menuReservateFacility",
					type:"post",
					dataType:"html",
					success:function(result){
						$('#modal-dialog  ').modal("hide");
						$('.modal-backdrop').remove();
						$('.modal-open').css("overflow", "visible");
						$("#content").html(result);

					}
				});

			}
		});
	}
	/* 일반시설물 예약 fucntion */
	function reservateGeneral(facSeq) {
		console.log(facSeq);
		$.ajax({
			url:"/onepart/resident/reservateGeneral",
			dataType:"html",
			data:{facSeq:facSeq},
			success:function(result){
				$("#content").html(result);
			}
		});
	}
	/* 좌석시설물 예약 function */
	function reservateSeat(facSeq) {
		console.log(facSeq);
		$.ajax({
			url:"/onepart/resident/reservatenSeat",
			dataType:"html",
			data:{facSeq:facSeq},
			success:function(result){
				$("#content").html(result);
			}
		});
	}
</script>
</body>
</html>