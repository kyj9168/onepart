package com.kh.onepart.resident.residentMeeting.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.resident.residentMeeting.vo.ResidentAllInfo;
import com.kh.onepart.resident.residentMeeting.vo.ResidentMeetingVO;

@Repository
public class ResidentMeetingDaoImpl implements ResidentMeetingDao {

	/** 입주자 대표 회의 메인페이지 */
	@Override
	public ArrayList<ResidentMeetingVO> selectMeetingInfoList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("ResidentMeeting.selectMeetingInfoList");
	}

	/** 입주민 정보 가져오기 */
	@Override
	public ArrayList<ResidentAllInfo> selectResidentVOList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("ResidentMeeting.selectResidentVOList");
	}

	/** 입주자 대표 회의 등록 */
	@Override
	public void insertMeetingRegister(SqlSessionTemplate sqlSession, ResidentMeetingVO residentMeetingVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("ResidentMeeting.insertMeetingRegister", residentMeetingVO);
	}

	/** 입주자 대표 회의 상세보기 */
	@Override
	public ResidentMeetingVO selectResidentMeetingMainDetail(SqlSessionTemplate sqlSession,
			ResidentMeetingVO residentMeetingVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ResidentMeeting.selectResidentMeetingMainDetail", residentMeetingVO);
	}

	/** 입주자 대표 회의 삭제 */
	@Override
	public void deleteResidentMeeting(SqlSessionTemplate sqlSession, int residentsMeetingSeq) {
		// TODO Auto-generated method stub
		sqlSession.delete("ResidentMeeting.deleteResidentMeeting", residentsMeetingSeq);
	}

	/** 입주자 대표 회의 수정 */
	@Override
	public void residentMeetingMainModify(SqlSessionTemplate sqlSession, ResidentMeetingVO residentMeetingVO) {
		// TODO Auto-generated method stub
		sqlSession.update("ResidentMeeting.residentMeetingMainModify", residentMeetingVO);
	}

	/** 입주자 대표 회의 회의록 저장 */
	@Override
	public void saveMeetingMinutes(SqlSessionTemplate sqlSession, ResidentMeetingVO residentMeetingVO) {
		// TODO Auto-generated method stub
		sqlSession.update("ResidentMeeting.saveMeetingMinutes", residentMeetingVO);
	}

}
