package com.kh.onepart.manager.visit_car.model.service;

import java.util.ArrayList;

import com.kh.onepart.manager.visit_car.model.vo.ManagerVisitCarVo;

public interface ManagerVisitCarService {

	//방문차량 등록 리스트 불러오는 메소드
	ArrayList selectVisitcarList();

	//방문차량 상태 승인으로 업데이트용 메소드
	int updateYesVisitCar(int visitCarSeq);

	//방문차량 상태 거절로 업데이트용 메소드
	int updateNoVisitCar(int visitCarSeq);

	//방문차량 상태 거절 사유 업데이트용 메소드
	int updateRejectReason(ManagerVisitCarVo requestManagerVisitCarVo);

}
