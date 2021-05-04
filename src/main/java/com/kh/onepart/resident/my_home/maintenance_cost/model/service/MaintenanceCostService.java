package com.kh.onepart.resident.my_home.maintenance_cost.model.service;

import java.util.ArrayList;

public interface MaintenanceCostService {
	//로그인 유저의 관리비 내역 리스트 가져오는 메소드
	ArrayList selectAllUserMaintenanceCostList(String aptDetailInfoSeq);
	//로그인 유저와 같은 평수의 관리비 평균 리스트 가져오는 메소드
	ArrayList selectAllUserCompareMaintenanceCostList(String aptDetailInfoSeq);
	//로그인 유저의 개별사용료 내역 리스트 가져오는 메소드
	ArrayList selectCompareUserMaintenanceCostList(String aptDetailInfoSeq);
	//로그인 유저의 최근 5달관리비 내역 리스트 가져오는 메소드
	ArrayList selectAllUserCompareMonthCostList(String aptDetailInfoSeq);
	//월별 카테고리별 금액 합계 리스트 가져오는 메소드
	ArrayList selectAllSumMonthCostList(String aptDetailInfoSeq);

}
