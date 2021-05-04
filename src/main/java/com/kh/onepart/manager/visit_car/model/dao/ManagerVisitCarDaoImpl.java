package com.kh.onepart.manager.visit_car.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.manager.visit_car.model.vo.ManagerVisitCarVo;

@Repository
public class ManagerVisitCarDaoImpl implements ManagerVisitCarDao{

	//방문차량 등록 리스트 불러오는 메소드
	@Override
	public ArrayList selectVisitcarList(SqlSessionTemplate sqlSession) {
		System.out.println("requestVisitCarVo ::D:: ");
		return (ArrayList) sqlSession.selectList("ManagerVisitCar.listVisitCar");
	}

	//방문차량 상태 승인으로 업데이트용 메소드
	@Override
	public int updateYesVisitCar(SqlSessionTemplate sqlSession, int visitCarSeq) {
		System.out.println("visitCarSeq ::D:: " + visitCarSeq);
		return sqlSession.update("ManagerVisitCar.updateYesVisitCar", visitCarSeq);
	}

	//방문차량 상태 거절로 업데이트용 메소드
	@Override
	public int updateNoVisitCar(SqlSessionTemplate sqlSession, int visitCarSeq) {
		System.out.println("visitCarSeq ::D:: " + visitCarSeq);
		return sqlSession.update("ManagerVisitCar.updateNoVisitCar", visitCarSeq);
	}

	//방문차량 상태 거절 사유 업데이트용 메소드
	@Override
	public int updateRejectReason(SqlSessionTemplate sqlSession, ManagerVisitCarVo requestManagerVisitCarVo) {
		System.out.println("requestManagerVisitCarVo ::D:: " + requestManagerVisitCarVo);
		return sqlSession.update("ManagerVisitCar.updateRejectReason", requestManagerVisitCarVo);
	}

}
