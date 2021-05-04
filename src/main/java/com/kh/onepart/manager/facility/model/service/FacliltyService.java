package com.kh.onepart.manager.facility.model.service;

import java.util.ArrayList;

import com.kh.onepart.manager.facility.model.vo.FacReservation;
import com.kh.onepart.manager.facility.model.vo.Image;
import com.kh.onepart.manager.facility.model.vo.Reservation;

public interface FacliltyService {
	//아파트 시설물 리스트 불러오는 메소드
	ArrayList selectAllReservation();
	//모든시설물 예약 리스트 불러오는 메소드
	ArrayList selectAllUserReservation();
	//해당 시설물 예약 내역 불러오는 메소드
	FacReservation selectOneUserReservation(int facRsrvSeq);
	//해당 예약건 예약완료 처리하는 메소드
	int updatesuccessReservation(int facRsrvSeq);
	//해당 예약건 예약반려 처리하는 메소드
	int updatefailReservation(int facRsrvSeq);
	//예약 시설물 insert하는 메소드
	int insertReservationGeneral(Reservation reserv, ArrayList<Image> imgArr);
	//해당 시설물 리스트 불러오는 메소드
	Reservation selectOneGeneralReservation(int facSeq);
	//해당 시설물 수정하는 메소드
	int updateFacilityGeneral(Reservation reserv);
	//해당 시설물 삭제하는 메소드
	int deleteFacliltyGeneral(int facSeq);
	//예약 시설물 insert하는 메소드
	int insertReservationSeat(Reservation reserv, ArrayList<Image> imgArr, String[] seatResultArr);
	//해당 좌석 시설물 리스트 불러오는 메소드
	Reservation selectOneSeatReservation(int facSeq);
	//해당 시설물 사진 리스트 불러오는 메소드
	ArrayList selectOneReservationImages(int facSeq);
	//해당 시설물의 이미지 수정하는 메소드
	int updateFacilityGeneralImage(Reservation reserv, ArrayList<Image> imgSecondArr, ArrayList<Image> imgFirstArr, String[] resultFile);
	//해당 시설물 수정하는 메소드 (좌석)
	int updateFacilitySeat(Reservation reserv);
	//해당 시설물의 이미지 수정하는 메소드 (좌석)
	int updateFacilitySeatImage(Reservation reserv, ArrayList<Image> imgSecondArr, ArrayList<Image> imgFirstArr,
			String[] resultFile);

}
