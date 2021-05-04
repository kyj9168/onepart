package com.kh.onepart.manager.maintenance_cost.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.onepart.manager.maintenance_cost.model.vo.CostDay;
import com.kh.onepart.manager.maintenance_cost.model.vo.CostExcel;

public interface ManagerMaintenanceCostService {
	//단지내 내역별 총 관리비 리스트 받아오는 메소드
	ArrayList selectAllApartCostList();
	//단지내 5달 관리비의 합계 리스트 가져오는 메소드
	ArrayList selectAllSumCostList();
	//excel insert 메소드
	List<CostExcel> xlsxExcelReader(MultipartHttpServletRequest req, CostDay day);
	//xlsExcelReader insert 메소드
	List<CostExcel> xlsExcelReader(MultipartHttpServletRequest req, CostDay day);

}
