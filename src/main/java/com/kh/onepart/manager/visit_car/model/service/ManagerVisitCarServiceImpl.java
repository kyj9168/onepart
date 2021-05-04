package com.kh.onepart.manager.visit_car.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.manager.visit_car.model.dao.ManagerVisitCarDao;
import com.kh.onepart.manager.visit_car.model.vo.ManagerVisitCarVo;

@Service
public class ManagerVisitCarServiceImpl implements ManagerVisitCarService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	ManagerVisitCarDao mVisitCarDao;

	//방문차량 등록 리스트 불러오는 메소드
	@Override
	public ArrayList selectVisitcarList() {
		System.out.println("selectVisitcarList ::S::");
		return mVisitCarDao.selectVisitcarList(sqlSession);
	}

	//방문차량 상태 승인으로 업데이트용 메소드
	@Override
	public int updateYesVisitCar(int visitCarSeq) {
		System.out.println("visitCarSeq ::S:: " + visitCarSeq);
		return mVisitCarDao.updateYesVisitCar(sqlSession,visitCarSeq);
	}

	//방문차량 상태 거절로 업데이트용 메소드
	@Override
	public int updateNoVisitCar(int visitCarSeq) {
		System.out.println("visitCarSeq ::S:: " + visitCarSeq);
		return mVisitCarDao.updateNoVisitCar(sqlSession,visitCarSeq);
	}

	//방문차량 상태 거절 사유 업데이트용 메소드
	@Override
	public int updateRejectReason(ManagerVisitCarVo requestManagerVisitCarVo) {
		return mVisitCarDao.updateRejectReason(sqlSession, requestManagerVisitCarVo);

	}

}
