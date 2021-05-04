package com.kh.onepart.manager.facility.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.manager.facility.model.vo.FacReservation;
import com.kh.onepart.manager.facility.model.vo.FacSeatInfo;
import com.kh.onepart.manager.facility.model.vo.Image;
import com.kh.onepart.manager.facility.model.vo.Reservation;

@Repository
public class FacliltyDaoImpl implements FacliltyDao{
	//아파트 시설물 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllReservation(SqlSessionTemplate sqlSession) {

		ArrayList list = (ArrayList) sqlSession.selectList("faclilty.selectAllReservation");

		return list;

	}
	//모든시설물 예약 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllUserReservation(SqlSessionTemplate sqlSession) {

		ArrayList reservationList = (ArrayList) sqlSession.selectList("faclilty.selectAllUserReservation");

		return reservationList;
	}
	//해당 시설물 예약 내역 불러오는 메소드
	@Override
	public FacReservation selectOneUserReservation(SqlSessionTemplate sqlSession, int facRsrvSeq) {

		FacReservation fr = sqlSession.selectOne("faclilty.selectOneUserReservation", facRsrvSeq);

		return fr;
	}
	//해당 예약건 예약완료 처리하는 메소드
	@Override
	public int updatesuccessReservation(SqlSessionTemplate sqlSession, int facRsrvSeq) {

		int result = sqlSession.update("faclilty.updatesuccessReservation", facRsrvSeq);

		return result;
	}
	//해당 예약건 예약반려 처리하는 메소드
	@Override
	public int updatefailReservation(SqlSessionTemplate sqlSession, int facRsrvSeq) {

		int result = sqlSession.update("faclilty.updatefailReservation", facRsrvSeq);

		return result;

	}
	//시설물 정보 insert하는 메소드
	@Override
	public int insertReservationInfo(SqlSessionTemplate sqlSession, Reservation reserv) {

		sqlSession.insert("faclilty.insertReservationInfo", reserv);
		int facSeq = reserv.getFacSeq();
		return facSeq;
	}
	//시설물 정보 insert하는 메소드(좌석)
		@Override
		public int insertReservationInfo2(SqlSessionTemplate sqlSession, Reservation reserv) {

			sqlSession.insert("faclilty.insertReservationInfo2", reserv);
			int facSeq = reserv.getFacSeq();
			return facSeq;
		}
	//대표사진 insert하는 메소드
	@Override
	public int insertReservationImgFirst(SqlSessionTemplate sqlSession, Image image) {

		int result = sqlSession.insert("faclilty.insertReservationImgFirst", image);

		return result;
	}
	//서브사진 insert하는 메소드
	@Override
	public int insertReservationImgSecond(SqlSessionTemplate sqlSession, Image image) {

		int result = sqlSession.insert("faclilty.insertReservationImgSecond", image);

		return result;

	}
	//해당 시설물 리스트 불러오는 메소드
	@Override
	public Reservation selectOneGeneralReservation(SqlSessionTemplate sqlSession, int facSeq) {

		Reservation rs = sqlSession.selectOne("faclilty.selectOneGeneralReservation", facSeq);

		return rs;
	}
	//해당 시설물 수정하는 메소드
	@Override
	public int updateFacilityGeneral(SqlSessionTemplate sqlSession, Reservation reserv) {

		int result = sqlSession.update("faclilty.updateFacilityGeneral", reserv);

		return result;
	}
	//해당 시설물 삭제하는 메소드
	@Override
	public int deleteFacliltyGeneral(SqlSessionTemplate sqlSession, int facSeq) {

		int result = sqlSession.delete("faclilty.deleteFacliltyGeneral", facSeq);

		return result;
	}
	//시설물 좌석정보 insert하는 메소드
	@Override
	public int insertReservationSeatInfo(SqlSessionTemplate sqlSession, FacSeatInfo fsi) {

		int result = sqlSession.insert("faclilty.insertReservationSeatInfo", fsi);

		return result;
	}
	//해당 좌석 시설물 리스트 불러오는 메소드
	@Override
	public Reservation selectOneSeatReservation(SqlSessionTemplate sqlSession, int facSeq) {

		Reservation rs = sqlSession.selectOne("faclilty.selectOneSeatReservation", facSeq);

		return rs;
	}
	//해당 시설물 사진 리스트 불러오는 메소드
	@Override
	public ArrayList selectOneReservationImages(SqlSessionTemplate sqlSession, int facSeq) {

		ArrayList rsImage = (ArrayList) sqlSession.selectList("faclilty.selectOneReservationImages", facSeq);

		return rsImage;
	}
	//메인사진 수정하는 메소드
	@Override
	public int updateFacliltyGeneralFirstImage(SqlSessionTemplate sqlSession, Reservation firstRs) {

		int result = sqlSession.update("faclilty.updateFacliltyGeneralFirstImage", firstRs);

		return result;
	}
	//서브사진 수정하는  메소드
	@Override
	public int updateFacliltyGeneralSecondImage(SqlSessionTemplate sqlSession, Reservation secondRs) {

		int result = sqlSession.update("faclilty.updateFacliltyGeneralSecondImage", secondRs);

		return result;
	}
	//해당 시설물 수정하는 메소드 (좌석)
	@Override
	public int updateFacilitySeat(SqlSessionTemplate sqlSession, Reservation reserv) {

		int result = sqlSession.update("faclilty.updateFacilitySeat", reserv);

		return result;
	}

}
