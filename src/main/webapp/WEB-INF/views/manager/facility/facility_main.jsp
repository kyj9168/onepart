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
<jsp:include page="../facility/facility_include.jsp"></jsp:include>
<div style="width:85%; margin:0 auto">
	<!-- 전체 div -->
	<div>
		<!-- 나의 예약현황 div -->
		<div>
			<h4>시설물 예약신청 리스트</h4>
			<div class="panel-body" style="background:white">
	             <table class="table table-hover" style="text-align:center;">
	                   <thead>
                            <tr>
                                 <td style="font-weight:bold;">예약번호</td>
                                 <td style="font-weight:bold;">시설명</td>
                                 <td style="font-weight:bold;">이용날짜</td>
                                 <td style="font-weight:bold;">이용시간</td>
                                 <td style="font-weight:bold;">신청일</td>
                                 <td style="font-weight:bold;">신청인 명</td>
                                 <td style="font-weight:bold;">현황</td>
                             </tr>
	                   </thead>
	                   <tbody>
							<c:forEach var="reservationList" items="${ reservationList }">
							<tr onclick="detailReservation(${ reservationList.facRsrvSeq });">
								<td>${ reservationList.facRsrvSeq }</td>
								<td>${ reservationList.facNm }</td>
								<td>${ reservationList.propUseDt }</td>
								<td>${ reservationList.propUseTm }</td>
								<td>${ reservationList.enrollDt }</td>
								<td>${ reservationList.residentNm }</td>
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
							</tr>
	                        </c:forEach>
	                    </tbody>
	             </table>
	       </div>
		</div>
		<br><br><br>
		<!-- 우리아파트 공공시설물 div -->
		<div>
			<h4>우리아파트 공공시설물</h4>
			<!-- 공공시설물 리스트 div -->
			<div style="width:100%">
                <ul class="result-list">
                    <c:forEach var="list" items="${ list }">
                   	<li>
                   		<div class="result-image" style="width:20%">
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
                            <a onclick="modifyGeneral(${list.facSeq});" class="btn btn-inverse btn-block" style="margin:0 auto; margin-top:85%">수정</a>
                            <a href="#modal-dialog" data-toggle="modal" onclick="deleteReservationFac(${list.facSeq});" class="btn btn-inverse btn-block" style="margin:0 auto; margin-top:10%">삭제</a>
                            </c:if>
                            <c:if test="${ list.facType == 1}">
                            <a onclick="modifySeat(${list.facSeq});" class="btn btn-inverse btn-block" style="margin:0 auto; margin-top:85%">수정</a>
                            <a href="#modal-dialog" data-toggle="modal" onclick="deleteReservationFac(${list.facSeq});" class="btn btn-inverse btn-block" style="margin:0 auto; margin-top:10%">삭제</a>
                            </c:if>
                        </div>
                   	</li>
                    </c:forEach>
                </ul>
			</div>
		</div>
	</div>
</div>
<!-- 시설물 삭제 modal -->
<div class="modal fade" id="modal-dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">시설물 삭제하기</h4>
			</div>
			<div class="modal-body">
				해당 시설물을 삭제처리 하시겠습니까? <br>
				삭제완료 후에는 복구가 불가능 하며, 시설물을 재등록 하셔야 합니다.
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" onclick="deleteFac();">시설물삭제</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var deletefacSeq;
	/* 일반시설물 수정 function */
	function modifyGeneral(facSeq) {
		$.ajax({
			url:"/onepart/manager/facility_modify_general",
			dataType:"html",
			data:{facSeq:facSeq},
			success:function(result){
				$("#content").html(result);
			}
		});
	}
	/* 좌석시설물 수정 fucntion */
	function modifySeat(facSeq) {
		$.ajax({
			url:"/onepart/manager/facility_modify_seat",
			dataType:"html",
			data:{facSeq:facSeq},
			success:function(result){
				$("#content").html(result);
			}
		});
	}
	/* 시설물 삭제 fucntion */
	function deleteReservationFac(facSeq) {
		deletefacSeq = facSeq;
		console.log(deletefacSeq);
	}
	/* 시설물 삭제완료 function */
	function deleteFac() {
		$.ajax({
			url:"/onepart/manager/facility_delete_general",
			dataType:"html",
			data:{facSeq:deletefacSeq},
			success:function(result){
				$.ajax({
        			url:"/onepart/manager/menuFacility",
        			dataType:"html",
        			success:function(result){
        				$("#content").html(result);
        				$('#modal-dialog').modal("hide");
						$('.modal-backdrop').remove();
						$('.modal-open').css("overflow", "visible");
        			}
        		});
			}
		});
	}
</script>
</body>
</html>