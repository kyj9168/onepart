package com.kh.onepart.manager.facility.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.manager.facility.model.dao.FacliltyDao;
import com.kh.onepart.manager.facility.model.vo.FacReservation;
import com.kh.onepart.manager.facility.model.vo.FacSeatInfo;
import com.kh.onepart.manager.facility.model.vo.Image;
import com.kh.onepart.manager.facility.model.vo.Reservation;

@Service
public class FacliltyServiceImpl implements FacliltyService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private FacliltyDao fd;

	//아파트 시설물 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllReservation() {

		ArrayList list = fd.selectAllReservation(sqlSession);

		return list;
	}
	//모든시설물 예약 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllUserReservation() {

		ArrayList reservationList = fd.selectAllUserReservation(sqlSession);

		return reservationList;
	}
	//해당 시설물 예약 내역 불러오는 메소드
	@Override
	public FacReservation selectOneUserReservation(int facRsrvSeq) {

		FacReservation fr = fd.selectOneUserReservation(sqlSession, facRsrvSeq);

		return fr;

	}
	//해당 예약건 예약완료 처리하는 메소드
	@Override
	public int updatesuccessReservation(int facRsrvSeq) {

		int result = fd.updatesuccessReservation(sqlSession, facRsrvSeq);

		return result;

	}
	//해당 예약건 예약반려 처리하는 메소드
	@Override
	public int updatefailReservation(int facRsrvSeq) {

		int result = fd.updatefailReservation(sqlSession, facRsrvSeq);

		return result;

	}
	//예약 시설물 insert하는 메소드
	@Override
	public int insertReservationGeneral(Reservation reserv, ArrayList<Image> imgArr) {

		//시설물 정보 insert하는 메소드
		int facSeq = fd.insertReservationInfo(sqlSession, reserv);
		//시설물 사진들 insert하는 메소드
		for(int i = 0; i < imgArr.size(); i++) {
			if(i == 0) {
				//대표사진 insert하는 메소드
				imgArr.get(i).setFacSeq(facSeq);
				int result = fd.insertReservationImgFirst(sqlSession, imgArr.get(i));
			}else {
				//서브사진 insert하는 메소드
				imgArr.get(i).setFacSeq(facSeq);
				int result2 = fd.insertReservationImgSecond(sqlSession, imgArr.get(i));
			}
		}

		return facSeq;
	}
	//해당 시설물 리스트 불러오는 메소드
	@Override
	public Reservation selectOneGeneralReservation(int facSeq) {

		Reservation rs = fd.selectOneGeneralReservation(sqlSession, facSeq);

		return rs;
	}
	//해당 시설물 수정하는 메소드
	@Override
	public int updateFacilityGeneral(Reservation reserv) {

		int result = fd.updateFacilityGeneral(sqlSession, reserv);

		return result;
	}
	//해당 시설물 삭제하는 메소드
	@Override
	public int deleteFacliltyGeneral(int facSeq) {

		int result = fd.deleteFacliltyGeneral(sqlSession, facSeq);

		return result;
	}
	//예약 시설물 insert하는 메소드
	@Override
	public int insertReservationSeat(Reservation reserv, ArrayList<Image> imgArr, String[] seatResultArr) {
		//시설물 정보 insert하는 메소드(좌석)
		int facSeq = fd.insertReservationInfo2(sqlSession, reserv);
		//시설물 사진들 insert하는 메소드
		for(int i = 0; i < imgArr.size(); i++) {
			if(i == 0) {
				//대표사진 insert하는 메소드
				imgArr.get(i).setFacSeq(facSeq);
				int result = fd.insertReservationImgFirst(sqlSession, imgArr.get(i));
			}else {
				//서브사진 insert하는 메소드
				imgArr.get(i).setFacSeq(facSeq);
				int result2 = fd.insertReservationImgSecond(sqlSession, imgArr.get(i));
			}
		}
		//시설물 좌석정보 insert하는 메소드
		for(int i = 1; i <= seatResultArr.length; i++) {
			FacSeatInfo fsi = new FacSeatInfo();
			fsi.setFacSeatNum(i);
			fsi.setFacSeq(facSeq);
			fsi.setFacPositionNum(seatResultArr[i-1]);
			fsi.setFacSeatMaxNum(reserv.getSeatMaxNum());
			int result3 = fd.insertReservationSeatInfo(sqlSession, fsi);
		}

		return facSeq;
	}
	//해당 좌석 시설물 리스트 불러오는 메소드
	@Override
	public Reservation selectOneSeatReservation(int facSeq) {

		Reservation rs = fd.selectOneSeatReservation(sqlSession, facSeq);

		return rs;

	}
	//해당 시설물 사진 리스트 불러오는 메소드
	@Override
	public ArrayList selectOneReservationImages(int facSeq) {

		ArrayList rsImage = fd.selectOneReservationImages(sqlSession, facSeq);

		return rsImage;
	}
	//해당 시설물의 이미지 수정하는 메소드
	@Override
	public int updateFacilityGeneralImage(Reservation reserv, ArrayList<Image> imgSecondArr,
			ArrayList<Image> imgFirstArr, String[] resultFile) {
		//메인사진 수정하는 메소드
		int result = 0;
		if(imgFirstArr.size() != 0) {
			Reservation firstRs = new Reservation();
			firstRs.setFacSeq(reserv.getFacSeq());
			firstRs.setChangeNm(imgFirstArr.get(0).getChangeNm());
			firstRs.setOriginNm(imgFirstArr.get(0).getOriginNm());
			firstRs.setFilePath(imgFirstArr.get(0).getFilePath());
			result = fd.updateFacliltyGeneralFirstImage(sqlSession, firstRs);
		}

		//서브사진 수정하는  메소드
		if(resultFile != null) {
			for(int i = 0; i < resultFile.length; i++) {
				Reservation secondRs = new Reservation();
				secondRs.setImageSeq(Integer.parseInt(resultFile[i]));
				secondRs.setChangeNm(imgSecondArr.get(i).getChangeNm());
				secondRs.setOriginNm(imgSecondArr.get(i).getOriginNm());
				secondRs.setFilePath(imgSecondArr.get(i).getFilePath());
				int result2 = fd.updateFacliltyGeneralSecondImage(sqlSession, secondRs);
			}
		}

		return result;
	}
	//해당 시설물 수정하는 메소드 (좌석)
	@Override
	public int updateFacilitySeat(Reservation reserv) {

		int result = fd.updateFacilitySeat(sqlSession, reserv);

		return result;
	}
	//해당 시설물의 이미지 수정하는 메소드 (좌석)
	@Override
	public int updateFacilitySeatImage(Reservation reserv, ArrayList<Image> imgSecondArr, ArrayList<Image> imgFirstArr,
			String[] resultFile) {
		//메인사진 수정하는 메소드
				int result = 0;
				if(imgFirstArr.size() != 0) {
					Reservation firstRs = new Reservation();
					firstRs.setFacSeq(reserv.getFacSeq());
					firstRs.setChangeNm(imgFirstArr.get(0).getChangeNm());
					firstRs.setOriginNm(imgFirstArr.get(0).getOriginNm());
					firstRs.setFilePath(imgFirstArr.get(0).getFilePath());
					result = fd.updateFacliltyGeneralFirstImage(sqlSession, firstRs);
				}

				//서브사진 수정하는  메소드                                                                               
				if(resultFile != null) {
					for(int i = 0; i < resultFile.length; i++) {
						Reservation secondRs = new Reservation();
						secondRs.setImageSeq(Integer.parseInt(resultFile[i]));
						secondRs.setChangeNm(imgSecondArr.get(i).getChangeNm());
						secondRs.setOriginNm(imgSecondArr.get(i).getOriginNm());
						secondRs.setFilePath(imgSecondArr.get(i).getFilePath());
						int result2 = fd.updateFacliltyGeneralSecondImage(sqlSession, secondRs);
					}
				}

				return result;
	}


}
