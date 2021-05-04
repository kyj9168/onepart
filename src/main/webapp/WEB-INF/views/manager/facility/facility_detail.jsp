<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<!-- 시설물예약 상세보기 div -->
	<div>
		<h4>시설물 예약 신청 상세보기</h4>
		<div class="panel-body" style="background:white">
		<table style="width:95%; margin:0 auto;">
			<tr>
				<td><h2 style="width:95%">예약 No. ${ fr.facRsrvSeq }</h2></td>
			</tr>
		</table>
              <table class="table table-hover" style="text-align:center; width:95%; margin:0 auto;">
                  <tbody>
                     <tr>
                     		<td style="font-weight:bold; width:30%">시설명</td>
                     		<c:set var="result" value="${ fr.propUseDt }"></c:set>
                     		<c:set var="propUseDt2" value="${fn:substring(result,0,10) }"></c:set>
                          <td>${ fr.facNm }</td>
                     </tr>
                      <tr>
                     		<td style="font-weight:bold;">이용날짜</td>
                          <td>${ propUseDt2 }</td>
                     </tr>
                      <tr>
                     		<td style="font-weight:bold;">이용시간</td>
                          <td>${ fr.propUseTm }</td>
                     </tr>
                     <tr>
                     		<td style="font-weight:bold;">신청일</td>
                          <td>${ fr.enrollDt }</td>
                     </tr>
                     <tr>
                     		<td style="font-weight:bold;">사용료</td>
                          <td>${ fr.toalFee }원</td>
                     </tr>
                     <tr>
                     		<td style="font-weight:bold;">사용인원</td>
                          <td>${ fr.useHeadCount }명</td>
                     </tr>
                     <tr>
                     		<td style="font-weight:bold;">사용목적</td>
                          <td>${ fr.usePurpose }</td>
                     </tr>
                     <tr>
                     		<td style="font-weight:bold;">기타사항</td>
                          <td>${ fr.etc }</td>
                     </tr>
                     <tr>
                     		<td style="font-weight:bold;">개인 / 단체</td>
                     		<c:if test="${ fr.rsrvGroupType == 1}">
                     			<td>개인</td>
                     		</c:if>
                     		<c:if test="${ fr.rsrvGroupType == 2}">
                     			<td>딘체</td>
                     		</c:if>
                     </tr>
                     <tr>
                     		<td style="font-weight:bold;">신청자 명</td>
                          <td>${ fr.residentNm }</td>
                     </tr>
                     <tr>
                     		<td style="font-weight:bold;">연락처</td>
                         <td>${ fr.rsrvPhone }</td>
                     </tr>
                     <tr>
                     		<td style="font-weight:bold;">신청현황</td>
                     		<c:if test="${ fr.propStatus == 1}">
                     			<td>예약대기</td>
                     		</c:if>
                          	<c:if test="${ fr.propStatus == 2}">
                     			<td>예약완료</td>
                     		</c:if>
                     		<c:if test="${ fr.propStatus == 3}">
                     			<td>예약반려</td>
                     		</c:if>
                     </tr>
                  </tbody>
              </table>
              <br><br>
         		<table style="width:100%; margin:0 auto; text-align:center;">
         		<c:if test="${ fr.propStatus == 1}">
         			<tr>
				<td><a href="#modal-dialog" data-toggle="modal" onclick="successReservation(${ fr.facRsrvSeq })" class="btn btn-success" style="width:90%">예약 완료처리</a></td>
				<td><a href="#modal-dialog2" data-toggle="modal" onclick="failReservation(${ fr.facRsrvSeq })" class="btn btn-danger" style="width:90%">예약 반려처리</a></td>
         			</tr>
         		</c:if>
		<c:if test="${ fr.propStatus == 2 || fr.propStatus == 3}">
			<tr>
				<td>
					<br>
					<h5>예약 현황처리가 완료된 예약입니다.</h5>
				</td>
			</tr>
		</c:if>
		</table>
		<br><br>
        </div>
		</div>
	</div>
</div>
<!-- 예약완료 modal -->
<div class="modal fade" id="modal-dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">예약 완료</h4>
			</div>
			<div class="modal-body">
				해당 예약내역을 완료처리 하시겠습니까? <br>
				완료처리 후에는 복구가 불가능 하며, 수정하실 수 없습니다.
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" onclick="successReserv();">예약완료</a>
			</div>
		</div>
	</div>
</div>
<!-- 예약반려 modal -->
<div class="modal fade" id="modal-dialog2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">예약 반려</h4>
			</div>
			<div class="modal-body">
				해당 예약내역을 반려처리 하시겠습니까? <br>
				반려처리 후에는 복구가 불가능 하며, 수정하실 수 없습니다.
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
				<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal" onclick="failReserv();">예약반려</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var reservFacRsrvSeq;
	/* 예약 완료 function */
	function successReservation(facRsrvSeq){
		reservFacRsrvSeq = facRsrvSeq;
	}
	/* 예약 완료처리 function */
	function successReserv() {
		$.ajax({
			url:"/onepart/manager/successReservation",
			data:{facRsrvSeq:reservFacRsrvSeq},
			success:function(result){
				$.ajax({
					url:"/onepart/manager/menuFacility",
					dataType:"html",
					success:function(result){
						$("#content").html(result);
						$('#modal-dialog2').modal("hide");
						$('.modal-backdrop').remove();
						$('.modal-open').css("overflow", "visible");
					}
				});
			}
		});
	}
	/* 예약 반려 function */
	function failReservation(facRsrvSeq){
		reservFacRsrvSeq = facRsrvSeq;
	}
	/* 예약 반려처리 function */
	function failReserv() {
		$.ajax({
			url:"/onepart/manager/failReservation",
			data:{facRsrvSeq:reservFacRsrvSeq},
			success:function(result){
				$.ajax({
					url:"/onepart/manager/menuFacility",
					dataType:"html",
					success:function(result){
						$("#content").html(result);
						$('#modal-dialog2').modal("hide");
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