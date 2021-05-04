package com.kh.onepart.resident.my_home.visit_car.model.service;

import java.util.ArrayList;

import com.kh.onepart.resident.my_home.visit_car.model.vo.VisitCarVo;

public interface VisitCarService {

	//방문차량 등록용 메소드
	int registerVisitCar(VisitCarVo requestVisitCarVo);

	//로그인 유저의 방문차량 등록 리스트 불러오는 메소드
	ArrayList selectMyVisitcarList(int residentSeq);

	//방문차량 등록 삭제용 메소드
	int deleteListVisitCar(String[] visitCarSeqArr);

}
