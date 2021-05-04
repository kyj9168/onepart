package com.kh.onepart.resident.my_home.visit_car.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.resident.my_home.visit_car.model.vo.VisitCarVo;

public interface VisitCarDao {

	//방문차량 등록용 메소드
	int registerVisitCar(SqlSessionTemplate sqlSession, VisitCarVo requestVisitCarVo);

	//로그인 유저의 방문차량 등록 리스트 불러오는 메소드
	ArrayList selectMyVisitcarList(SqlSessionTemplate sqlSession, int residentSeq);

	//방문차량 등록 삭제용 메소드
	int deleteListVisitCar(SqlSessionTemplate sqlSession, String[] visitCarSeqArr);



}
