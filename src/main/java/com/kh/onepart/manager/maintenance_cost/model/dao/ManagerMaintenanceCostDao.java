package com.kh.onepart.manager.maintenance_cost.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.manager.maintenance_cost.model.vo.CostExcel;

public interface ManagerMaintenanceCostDao {
	//단지내 내역별 총 관리비 리스트 받아오는 메소드
	ArrayList selectAllApartCostList(SqlSessionTemplate sqlSession);
	//단지내 5달 관리비의 합계 리스트 가져오는 메소드
	ArrayList selectAllSumCostList(SqlSessionTemplate sqlSession);
	//excel insert
	int insertExcelMaintenanceCost(SqlSessionTemplate sqlSession, CostExcel costExcel);

}
