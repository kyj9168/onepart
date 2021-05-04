package com.kh.onepart.resident.convenience.reservate_facility.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.resident.convenience.reservate_facility.model.dao.ReservationDao;
import com.kh.onepart.resident.convenience.reservate_facility.model.vo.FacReservation;
import com.kh.onepart.resident.convenience.reservate_facility.model.vo.FacSeatInfo;
import com.kh.onepart.resident.convenience.reservate_facility.model.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ReservationDao rd;

	// 단지내 모든 시설물 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllReservation() {

		ArrayList list = rd.selectAllReservation(sqlSession);

		return list;
	}
	//해당 시설물번호의 상세정보 불러오는 메소드
	@Override
	public Reservation selectOneReservation(int facSeq) {

		Reservation reserv = rd.selectOneReservation(sqlSession, facSeq);

		return reserv;
	}
	// 해당 예약 insert하는 메소드
	@Override
	public int insertReservation(FacReservation fr) {

		int result = rd.insertReservation(sqlSession, fr);

		return result;
	}
	//로그인 유저의 예약리스트 불러오는 메소드
	@Override
	public ArrayList selectUserReservation(int residentSeq) {

		ArrayList reservationList = rd.selectUserReservation(sqlSession, residentSeq);

		return reservationList;
	}
	//해당 예약번호의 예약건을 삭제하는 메소드
	@Override
	public int deleteUserReservation(int facRsrvSeq) {

		int result = rd.deleteUserReservation(sqlSession, facRsrvSeq);

		return result;
	}
	//해당 날짜 해당 시설물의 예약건 리스트를 불러오는 메소드
	@Override
	public ArrayList selectDdayReservation(FacReservation fr) {

		ArrayList dayReservationList = rd.selectDdayReservation(sqlSession, fr);

		return dayReservationList;
	}
	//해당 시설물번호의 좌석정보 불러오는 메소드
	@Override
	public ArrayList selectOneReservationSeatList(int facSeq) {

		ArrayList seatList = rd.selectOneReservationSeatList(sqlSession, facSeq);

		return seatList;
	}
	//해당 시설물번호의 좌석예약 상태 불러오는 메소드
	@Override
	public ArrayList selectOnePropSeatList(int facSeq) {

		ArrayList propSeatList = rd.selectOnePropSeatList(sqlSession, facSeq);

		return propSeatList;
	}
	//해당 좌석코드번호의 PK 불러오는 메소드
	@Override
	public int selectSeatPrimarykey(FacSeatInfo fr) {

		int realPropSeat = rd.selectSeatPrimarykey(sqlSession, fr);

		return realPropSeat;
	}
	//좌석 시설물 예약하는 메소드
	@Override
	public int insertReservationSeat(FacReservation fr2) {

		int result = rd.insertReservationSeat(sqlSession, fr2);

		return result;
	}

}
