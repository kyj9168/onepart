package com.kh.onepart.resident.residentMeeting.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.resident.residentMeeting.dao.ResidentMeetingDao;
import com.kh.onepart.resident.residentMeeting.vo.ResidentAllInfo;
import com.kh.onepart.resident.residentMeeting.vo.ResidentMeetingVO;

@Service
public class ResidentMeetingServiceImpl implements ResidentMeetingService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	ResidentMeetingDao residentMeetingDao;

	/** 입주자 대표 회의 메인페이지 */
	@Override
	public ArrayList<ResidentMeetingVO> selectMeetingInfo() {
		// TODO Auto-generated method stub

		return residentMeetingDao.selectMeetingInfoList(sqlSession);
	}

	/** 입주민 정보 가져오기 */
	@Override
	public ArrayList<ResidentAllInfo> selectResidentVOList() {
		// TODO Auto-generated method stub
		return residentMeetingDao.selectResidentVOList(sqlSession);
	}

	/** 입주자 대표 회의 등록 */
	@Override
	public void residentMeetingRegister(ResidentMeetingVO residentMeetingVO) {
		// TODO Auto-generated method stub
		residentMeetingDao.insertMeetingRegister(sqlSession, residentMeetingVO);
	}


	/** 입주자 대표 회의 상세보기 */
	@Override
	public ResidentMeetingVO selectResidentMeetingMainDetail(ResidentMeetingVO residentMeetingVO) {
		// TODO Auto-generated method stub
		return residentMeetingDao.selectResidentMeetingMainDetail(sqlSession, residentMeetingVO);
	}

	/** 입주자 대표 회의 삭제 */
	@Override
	public void deleteResidentMeeting(int residentsMeetingSeq) {
		// TODO Auto-generated method stub
		residentMeetingDao.deleteResidentMeeting(sqlSession, residentsMeetingSeq);
	}

	/** 입주자 대표 회의 수정 */
	@Override
	public void residentMeetingMainModify(ResidentMeetingVO residentMeetingVO) {
		// TODO Auto-generated method stub
		residentMeetingDao.residentMeetingMainModify(sqlSession, residentMeetingVO);
	}

	/** 입주자 대표 회의 회의록 저장 */
	@Override
	public void saveMeetingMinutes(ResidentMeetingVO residentMeetingVO) {
		// TODO Auto-generated method stub
		residentMeetingDao.saveMeetingMinutes(sqlSession, residentMeetingVO);
	}



}
