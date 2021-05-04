package com.kh.onepart.batch.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.batch.model.dao.BatchDao;

@Service
public class BatchServiceImpl implements BatchService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	BatchDao batchDao;

	/** 쪽지 - 7일 이전 메신저 삭제 */
	@Override
	public void deleteMessenger() {
		// TODO Auto-generated method stub
		batchDao.deleteMessenger(sqlSession);
	}

	/** 입주자 대표 회의 - 30분 주기로 입주자 대표 회의 상태 변경 */
	@Override
	public void updateResidentMeetingStatus() {
		// TODO Auto-generated method stub

		// 예정
		batchDao.updateResidentMeetingStatusScheduled(sqlSession);

		// 진행
		batchDao.updateResidentMeetingStatusIng(sqlSession);

		// 완료
		batchDao.updateResidentMeetingStatusFinish(sqlSession);
	}

	/** 설문조사 - 상태변경 */
	@Override
	public void updateSurveyStatus() {
		// TODO Auto-generated method stub

		// 예정
		batchDao.updateSurveyStatusScheduled(sqlSession);

		// 진행
		batchDao.updateSurveyStatusIng(sqlSession);

		// 완료
		batchDao.updateSurveyStatusFinish(sqlSession);

	}

}
