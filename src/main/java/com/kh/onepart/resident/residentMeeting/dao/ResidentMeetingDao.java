package com.kh.onepart.resident.residentMeeting.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.resident.residentMeeting.vo.ResidentAllInfo;
import com.kh.onepart.resident.residentMeeting.vo.ResidentMeetingVO;

public interface ResidentMeetingDao {

	/**
	 * 입주자 대표 회의 메인페이지
	 * @param sqlSession
	 * @return
	 */
	ArrayList<ResidentMeetingVO> selectMeetingInfoList(SqlSessionTemplate sqlSession);

	/**
	 * 입주민 정보 가져오기
	 * @param sqlSession
	 * @return
	 */
	ArrayList<ResidentAllInfo> selectResidentVOList(SqlSessionTemplate sqlSession);

	/**
	 * 입주자 대표 회의 등록
	 * @param sqlSession
	 * @param residentMeetingVO
	 */
	void insertMeetingRegister(SqlSessionTemplate sqlSession, ResidentMeetingVO residentMeetingVO);

	/**
	 * 입주자 대표 회의 상세보기
	 * @param sqlSession
	 * @param residentMeetingVO
	 * @return
	 */
	ResidentMeetingVO selectResidentMeetingMainDetail(SqlSessionTemplate sqlSession, ResidentMeetingVO residentMeetingVO);

	/**
	 * 입주자 대표 회의 삭제
	 * @param sqlSession
	 * @param residentsMeetingSeq
	 */
	void deleteResidentMeeting(SqlSessionTemplate sqlSession, int residentsMeetingSeq);

	/**
	 * 입주자 대표 회의 수정
	 * @param sqlSession
	 * @param residentMeetingVO
	 */
	void residentMeetingMainModify(SqlSessionTemplate sqlSession, ResidentMeetingVO residentMeetingVO);

	/**
	 * 입주자 대표 회의 회의록 저장
	 * @param sqlSession
	 * @param residentMeetingVO
	 */
	void saveMeetingMinutes(SqlSessionTemplate sqlSession, ResidentMeetingVO residentMeetingVO);

}
