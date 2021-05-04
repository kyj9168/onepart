package com.kh.onepart.resident.my_home.maintenance_cost.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

public interface MaintenanceCostDao {
	//로그인 유저의 관리비 내역 리스트 가져오는 메소드
	ArrayList selectAllUserMaintenanceCostList(SqlSessionTemplate sqlSession, String aptDetailInfoSeq);
	//로그인 유저의 새대 평수를 가져오는 메소드
	int selectUserSquareMeasure(SqlSessionTemplate sqlSession, String aptDetailInfoSeq);
	//로그인 유저와 같은 평수의 관리비 평균 리스트 가져오는 메소드
	ArrayList selectAllUserCompareMaintenanceCostList(SqlSessionTemplate sqlSession, int squareMeasure);
	//로그인 유저의 개별사용료 내역 리스트 가져오는 메소드
	ArrayList selectCompareUserMaintenanceCostList(SqlSessionTemplate sqlSession, String aptDetailInfoSeq);
	//로그인 유저의 최근 5달관리비 내역 리스트 가져오는 메소드
	ArrayList selectAllUserCompareMonthCostList(SqlSessionTemplate sqlSession, String aptDetailInfoSeq);
	//월별 카테고리별 금액 합계 리스트 가져오는 메소드
	ArrayList selectAllSumMonthCostList(SqlSessionTemplate sqlSession, String aptDetailInfoSeq);

}
