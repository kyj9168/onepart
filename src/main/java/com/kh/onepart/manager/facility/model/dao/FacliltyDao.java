package com.kh.onepart.manager.facility.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.manager.facility.model.vo.FacReservation;
import com.kh.onepart.manager.facility.model.vo.FacSeatInfo;
import com.kh.onepart.manager.facility.model.vo.Image;
import com.kh.onepart.manager.facility.model.vo.Reservation;

public interface FacliltyDao {
	//아파트 시설물 리스트 불러오는 메소드
	ArrayList selectAllReservation(SqlSessionTemplate sqlSession);
	//모든시설물 예약 리스트 불러오는 메소드
	ArrayList selectAllUserReservation(SqlSessionTemplate sqlSession);
	//해당 시설물 예약 내역 불러오는 메소드
	FacReservation selectOneUserReservation(SqlSessionTemplate sqlSession, int facRsrvSeq);
	//해당 예약건 예약완료 처리하는 메소드
	int updatesuccessReservation(SqlSessionTemplate sqlSession, int facRsrvSeq);
	//해당 예약건 예약반려 처리하는 메소드
	int updatefailReservation(SqlSessionTemplate sqlSession, int facRsrvSeq);
	//시설물 정보 insert하는 메소드
	int insertReservationInfo(SqlSessionTemplate sqlSession, Reservation reserv);
	//대표사진 insert하는 메소드
	int insertReservationImgFirst(SqlSessionTemplate sqlSession, Image image);
	//서브사진 insert하는 메소드
	int insertReservationImgSecond(SqlSessionTemplate sqlSession, Image image);
	//해당 시설물 리스트 불러오는 메소드
	Reservation selectOneGeneralReservation(SqlSessionTemplate sqlSession, int facSeq);
	//해당 시설물 수정하는 메소드
	int updateFacilityGeneral(SqlSessionTemplate sqlSession, Reservation reserv);
	//해당 시설물 삭제하는 메소드
	int deleteFacliltyGeneral(SqlSessionTemplate sqlSession, int facSeq);
	//시설물 정보 insert하는 메소드(좌석)
	int insertReservationInfo2(SqlSessionTemplate sqlSession, Reservation reserv);
	//시설물 좌석정보 insert하는 메소드
	int insertReservationSeatInfo(SqlSessionTemplate sqlSession, FacSeatInfo fsi);
	//해당 좌석 시설물 리스트 불러오는 메소드
	Reservation selectOneSeatReservation(SqlSessionTemplate sqlSession, int facSeq);
	//해당 시설물 사진 리스트 불러오는 메소드
	ArrayList selectOneReservationImages(SqlSessionTemplate sqlSession, int facSeq);
	//메인사진 수정하는 메소드
	int updateFacliltyGeneralFirstImage(SqlSessionTemplate sqlSession, Reservation firstRs);
	//서브사진 수정하는  메소드
	int updateFacliltyGeneralSecondImage(SqlSessionTemplate sqlSession, Reservation secondRs);
	//해당 시설물 수정하는 메소드 (좌석)
	int updateFacilitySeat(SqlSessionTemplate sqlSession, Reservation reserv);

}
