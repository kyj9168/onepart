package com.kh.onepart.resident.convenience.reservate_facility.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.resident.convenience.reservate_facility.model.vo.FacReservation;
import com.kh.onepart.resident.convenience.reservate_facility.model.vo.FacSeatInfo;
import com.kh.onepart.resident.convenience.reservate_facility.model.vo.Reservation;

@Repository
public class ReservationDaoImpl implements ReservationDao{
	// 단지내 모든 시설물 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllReservation(SqlSessionTemplate sqlSession) {

		ArrayList list = (ArrayList) sqlSession.selectList("reservation.selectAllReservation");

		return list;
	}
	//해당 시설물번호의 상세정보 불러오는 메소드
	@Override
	public Reservation selectOneReservation(SqlSessionTemplate sqlSession, int facSeq) {

		Reservation reserv = sqlSession.selectOne("reservation.selectOneReservation", facSeq);

		return reserv;
	}
	// 해당 예약 insert하는 메소드
	@Override
	public int insertReservation(SqlSessionTemplate sqlSession, FacReservation fr) {

		int result = sqlSession.insert("reservation.insertReservation", fr);

		System.out.println("몇행 insert : " + result);

		return result;
	}
	//로그인 유저의 예약리스트 불러오는 메소드
	@Override
	public ArrayList selectUserReservation(SqlSessionTemplate sqlSession, int residentSeq) {

		ArrayList reservationList = (ArrayList) sqlSession.selectList("reservation.selectUserReservation", residentSeq);

		return reservationList;
	}
	//해당 예약번호의 예약건을 삭제하는 메소드
	@Override
	public int deleteUserReservation(SqlSessionTemplate sqlSession, int facRsrvSeq) {

		int result = sqlSession.delete("reservation.deleteUserReservation", facRsrvSeq);

		return result;
	}
	//해당 날짜 해당 시설물의 예약건 리스트를 불러오는 메소드
	@Override
	public ArrayList selectDdayReservation(SqlSessionTemplate sqlSession, FacReservation fr) {

		ArrayList dayReservationList = (ArrayList) sqlSession.selectList("reservation.selectDdayReservation", fr);

		return dayReservationList;
	}
	//해당 시설물번호의 좌석정보 불러오는 메소드
	@Override
	public ArrayList selectOneReservationSeatList(SqlSessionTemplate sqlSession, int facSeq) {

		ArrayList seatList = (ArrayList) sqlSession.selectList("reservation.selectOneReservationSeatList", facSeq);

		return seatList;

	}
	//해당 시설물번호의 좌석예약 상태 불러오는 메소드
	@Override
	public ArrayList selectOnePropSeatList(SqlSessionTemplate sqlSession, int facSeq) {

		ArrayList propSeatList = (ArrayList) sqlSession.selectList("reservation.selectOnePropSeatList", facSeq);

		return propSeatList;
	}
	//해당 좌석코드번호의 PK 불러오는 메소드
	@Override
	public int selectSeatPrimarykey(SqlSessionTemplate sqlSession, FacSeatInfo fr) {

		int realPropSeat = sqlSession.selectOne("reservation.selectSeatPrimarykey", fr);

		return realPropSeat;

	}
	//좌석 시설물 예약하는 메소드
	@Override
	public int insertReservationSeat(SqlSessionTemplate sqlSession, FacReservation fr2) {

		int result = sqlSession.insert("reservation.insertReservationSeat", fr2);

		return result;
	}
}
