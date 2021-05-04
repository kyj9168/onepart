package com.kh.onepart.batch.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

/**
 * @author ko
 *
 */
public interface BatchDao {

	/** 쪽지 - 7일 이전 메신저 삭제 */
	void deleteMessenger(SqlSessionTemplate sqlSession);

	/**
	 * 입주자 대표 회의 - 30분 주기로 입주자 대표 회의 상태 변경 - 예정
	 * @param sqlSession
	 */
	void updateResidentMeetingStatusScheduled(SqlSessionTemplate sqlSession);

	/**
	 * 입주자 대표 회의 - 30분 주기로 입주자 대표 회의 상태 변경 - 진행
	 * @param sqlSession
	 */
	void updateResidentMeetingStatusIng(SqlSessionTemplate sqlSession);

	/**
	 * 입주자 대표 회의 - 30분 주기로 입주자 대표 회의 상태 변경 - 완료
	 * @param sqlSession
	 */
	void updateResidentMeetingStatusFinish(SqlSessionTemplate sqlSession);

	/**
	 * 설문조사 - 상태변경 - 예정
	 * @param sqlSession
	 */
	void updateSurveyStatusScheduled(SqlSessionTemplate sqlSession);

	/**
	 * 설문조사 - 상태변경 - 진행
	 * @param sqlSession
	 */
	void updateSurveyStatusIng(SqlSessionTemplate sqlSession);

	/**
	 * 설문조사 - 상태변경 - 완료
	 * @param sqlSession
	 */
	void updateSurveyStatusFinish(SqlSessionTemplate sqlSession);

}
