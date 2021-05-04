package com.kh.onepart.resident.convenience.reservate_facility.model.service;

import java.util.ArrayList;

import com.kh.onepart.resident.convenience.reservate_facility.model.vo.FacReservation;
import com.kh.onepart.resident.convenience.reservate_facility.model.vo.FacSeatInfo;
import com.kh.onepart.resident.convenience.reservate_facility.model.vo.Reservation;

public interface ReservationService {
	// 단지내 모든 시설물 리스트 불러오는 메소드
	ArrayList<Reservation> selectAllReservation();
	//해당 시설물번호의 상세정보 불러오는 메소드
	Reservation selectOneReservation(int facSeq);
	// 해당 예약 insert하는 메소드
	int insertReservation(FacReservation fr);
	//로그인 유저의 예약리스트 불러오는 메소드
	ArrayList selectUserReservation(int residentSeq);
	//해당 예약번호의 예약건을 삭제하는 메소드
	int deleteUserReservation(int facRsrvSeq);
	//해당 날짜 해당 시설물의 예약건 리스트를 불러오는 메소드
	ArrayList selectDdayReservation(FacReservation fr);
	//해당 시설물번호의 좌석정보 불러오는 메소드
	ArrayList selectOneReservationSeatList(int facSeq);
	//해당 시설물번호의 좌석예약 상태 불러오는 메소드
	ArrayList selectOnePropSeatList(int facSeq);
	//해당 좌석코드번호의 PK 불러오는 메소드
	int selectSeatPrimarykey(FacSeatInfo fr);
	//좌석 시설물 예약하는 메소드
	int insertReservationSeat(FacReservation fr2);

}
