package com.kh.onepart.resident.my_home.maintenance_cost.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MaintenanceCostDaoImpl implements MaintenanceCostDao{
	//로그인 유저의 관리비 내역 리스트 가져오는 메소드
	@Override
	public ArrayList selectAllUserMaintenanceCostList(SqlSessionTemplate sqlSession, String aptDetailInfoSeq) {

		ArrayList costList = (ArrayList) sqlSession.selectList("maintenance.selectAllUserMaintenanceCostList", aptDetailInfoSeq);

		return costList;

	}
	//로그인 유저의 새대 평수를 가져오는 메소드
	@Override
	public int selectUserSquareMeasure(SqlSessionTemplate sqlSession, String aptDetailInfoSeq) {

		int squareMeasure = sqlSession.selectOne("maintenance.selectUserSquareMeasure", aptDetailInfoSeq);

		return squareMeasure;

	}
	//로그인 유저와 같은 평수의 관리비 평균 리스트 가져오는 메소드
	@Override
	public ArrayList selectAllUserCompareMaintenanceCostList(SqlSessionTemplate sqlSession, int squareMeasure) {

		ArrayList compareCostList = (ArrayList) sqlSession.selectList("maintenance.selectAllUserCompareMaintenanceCostList", squareMeasure);

		return compareCostList;

	}
	//로그인 유저의 개별사용료 내역 리스트 가져오는 메소드
	@Override
	public ArrayList selectCompareUserMaintenanceCostList(SqlSessionTemplate sqlSession, String aptDetailInfoSeq) {

		ArrayList costList = (ArrayList) sqlSession.selectList("maintenance.selectCompareUserMaintenanceCostList", aptDetailInfoSeq);

		return costList;

	}
	//로그인 유저의 최근 5달관리비 내역 리스트 가져오는 메소드
	@Override
	public ArrayList selectAllUserCompareMonthCostList(SqlSessionTemplate sqlSession, String aptDetailInfoSeq) {

		ArrayList compareMonthCostList = (ArrayList) sqlSession.selectList("maintenance.selectAllUserCompareMonthCostList", aptDetailInfoSeq);

		return compareMonthCostList;

	}
	//월별 카테고리별 금액 합계 리스트 가져오는 메소드
	@Override
	public ArrayList selectAllSumMonthCostList(SqlSessionTemplate sqlSession, String aptDetailInfoSeq) {

		ArrayList sumMonthCostList = (ArrayList) sqlSession.selectList("maintenance.selectAllSumMonthCostList", aptDetailInfoSeq);

		return sumMonthCostList;

	}

}
