package com.kh.onepart.batch.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BatchDaoImpl implements BatchDao {

	/** 쪽지 - 7일 이전 메신저 삭제 */
	@Override
	public void deleteMessenger(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		sqlSession.update("Batch.deleteMessenger");
	}

	/** 입주자 대표 회의 - 30분 주기로 입주자 대표 회의 상태 변경 - 예정 */
	@Override
	public void updateResidentMeetingStatusScheduled(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		sqlSession.update("Batch.updateResidentMeetingStatusScheduled");
	}

	/** 입주자 대표 회의 - 30분 주기로 입주자 대표 회의 상태 변경 - 진행 */
	@Override
	public void updateResidentMeetingStatusIng(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		sqlSession.update("Batch.updateResidentMeetingStatusIng");
	}

	/** 입주자 대표 회의 - 30분 주기로 입주자 대표 회의 상태 변경 - 완료 */
	@Override
	public void updateResidentMeetingStatusFinish(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		sqlSession.update("Batch.updateResidentMeetingStatusFinish");
	}

	/** 설문조사 - 상태변경 - 예정 */
	@Override
	public void updateSurveyStatusScheduled(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		sqlSession.update("Batch.updateSurveyStatusScheduled");
	}

	/** 설문조사 - 상태변경 - 진행 */
	@Override
	public void updateSurveyStatusIng(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		sqlSession.update("Batch.updateSurveyStatusIng");
	}

	/** 설문조사 - 상태변경 - 완료 */
	@Override
	public void updateSurveyStatusFinish(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		sqlSession.update("Batch.updateSurveyStatusFinish");
	}

}
