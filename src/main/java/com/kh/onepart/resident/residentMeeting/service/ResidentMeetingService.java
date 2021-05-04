package com.kh.onepart.resident.residentMeeting.service;

import java.util.ArrayList;

import com.kh.onepart.resident.residentMeeting.vo.ResidentAllInfo;
import com.kh.onepart.resident.residentMeeting.vo.ResidentMeetingVO;

public interface ResidentMeetingService {

	/**
	 * 입주자 대표 회의 메인페이지
	 * @return
	 */
	ArrayList<ResidentMeetingVO> selectMeetingInfo();

	/**
	 * 입주민 정보 가져오기
	 * @return
	 */
	ArrayList<ResidentAllInfo> selectResidentVOList();

	/**
	 * 입주자 대표 회의 등록
	 * @param residentMeetingVO
	 */
	void residentMeetingRegister(ResidentMeetingVO residentMeetingVO);

	/**
	 * 입주자 대표 회의 상세보기
	 * @param residentMeetingVO
	 * @return
	 */
	ResidentMeetingVO selectResidentMeetingMainDetail(ResidentMeetingVO residentMeetingVO);

	/**
	 * 입주자 대표 회의 삭제
	 * @param residentsMeetingSeq
	 */
	void deleteResidentMeeting(int residentsMeetingSeq);

	/**
	 * 입주자 대표 회의 수정
	 * @param residentMeetingVO
	 */
	void residentMeetingMainModify(ResidentMeetingVO residentMeetingVO);

	/**
	 * 입주자 대표 회의 회의록 저장
	 * @param residentMeetingVO
	 */
	void saveMeetingMinutes(ResidentMeetingVO residentMeetingVO);

}
