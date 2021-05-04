package com.kh.onepart.batch.model.service;

public interface BatchService {

	/** 쪽지 - 7일 이전 메신저 삭제 */
	void deleteMessenger();

	/** 입주자 대표 회의 - 30분 주기로 입주자 대표 회의 상태 변경 */
	void updateResidentMeetingStatus();

	/** 설문조사 - 상태변경 */
	void updateSurveyStatus();

}
