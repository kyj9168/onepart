package com.kh.onepart.resident.my_home.maintenance_cost.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.resident.my_home.maintenance_cost.model.dao.MaintenanceCostDao;

@Service
public class MaintenanceCostServiceImpl implements MaintenanceCostService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MaintenanceCostDao mcd;

	//로그인 유저의 관리비 내역 리스트 가져오는 메소드
	@Override
	public ArrayList selectAllUserMaintenanceCostList(String aptDetailInfoSeq) {

		ArrayList costList = mcd.selectAllUserMaintenanceCostList(sqlSession, aptDetailInfoSeq);

		return costList;

	}
	//로그인 유저와 같은 평수의 관리비 평균 리스트 가져오는 메소드
	@Override
	public ArrayList selectAllUserCompareMaintenanceCostList(String aptDetailInfoSeq) {

		//로그인 유저의 새대 평수를 가져오는 메소드
		int squareMeasure = mcd.selectUserSquareMeasure(sqlSession, aptDetailInfoSeq);
		//로그인 유저와 같은 평수의 관리비 평균 리스트 가져오는 메소드
		ArrayList compareCostList = mcd.selectAllUserCompareMaintenanceCostList(sqlSession, squareMeasure);

		return compareCostList;

	}
	//로그인 유저의 개별사용료 내역 리스트 가져오는 메소드
	@Override
	public ArrayList selectCompareUserMaintenanceCostList(String aptDetailInfoSeq) {

		ArrayList costList = mcd.selectCompareUserMaintenanceCostList(sqlSession, aptDetailInfoSeq);

		return costList;

	}
	//로그인 유저의 최근 5달관리비 내역 리스트 가져오는 메소드
	@Override
	public ArrayList selectAllUserCompareMonthCostList(String aptDetailInfoSeq) {

		ArrayList compareMonthCostList = mcd.selectAllUserCompareMonthCostList(sqlSession, aptDetailInfoSeq);

		return compareMonthCostList;

	}
	//월별 카테고리별 금액 합계 리스트 가져오는 메소드
	@Override
	public ArrayList selectAllSumMonthCostList(String aptDetailInfoSeq) {

		ArrayList sumMonthCostList = mcd.selectAllSumMonthCostList(sqlSession, aptDetailInfoSeq);

		return sumMonthCostList;

	}


}
