package com.kh.onepart.manager.visit_car.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.manager.visit_car.model.vo.ManagerVisitCarVo;

public interface ManagerVisitCarDao {

	//방문차량 등록 리스트 불러오는 메소드
	ArrayList selectVisitcarList(SqlSessionTemplate sqlSession);

	//방문차량 상태 승인으로 업데이트용 메소드
	int updateYesVisitCar(SqlSessionTemplate sqlSession, int visitCarSeq);

	//방문차량 상태 거절로 업데이트용 메소드
	int updateNoVisitCar(SqlSessionTemplate sqlSession, int visitCarSeq);

	//방문차량 상태 거절 사유 업데이트용 메소드
	int updateRejectReason(SqlSessionTemplate sqlSession, ManagerVisitCarVo requestManagerVisitCarVo);


}
