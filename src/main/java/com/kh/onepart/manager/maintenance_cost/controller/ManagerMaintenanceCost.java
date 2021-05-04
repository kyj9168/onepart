package com.kh.onepart.manager.maintenance_cost.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.manager.maintenance_cost.model.service.ManagerMaintenanceCostService;
import com.kh.onepart.manager.maintenance_cost.model.vo.CostDay;
import com.kh.onepart.manager.maintenance_cost.model.vo.CostExcel;

@Controller
public class ManagerMaintenanceCost {
	@Autowired
	private ManagerMaintenanceCostService mmcs;

	@RequestMapping("/manager/menuMaintenanceCost")
	public ModelAndView moveMaintenance(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuVote");

		//단지내 내역별 총 관리비 리스트 받아오는 메소드
		ArrayList costList = mmcs.selectAllApartCostList();

		//현재 월
		TimeZone tz = TimeZone.getTimeZone("Asia/Seoul");
	    Calendar cal = Calendar.getInstance(tz);
	    int month = cal.get(Calendar.MONTH);

	    //단지내 5달 관리비의 합계 리스트 가져오는 메소드
	    ArrayList sumCostList = mmcs.selectAllSumCostList();

		mv.addObject("costList", costList);
		mv.addObject("month", month);
		mv.addObject("sumCostList", sumCostList);
		mv.setViewName("/manager/maintenance_cost/manager_maintenance_main");
		return mv;
	}

	@RequestMapping("/manager/insert_newMainentance")
	public ModelAndView insert_newMainentance(ModelAndView mv, HttpServletRequest request, MultipartHttpServletRequest req, CostDay day) {

		System.out.println("controller year :: " + day);
		int insertMonth = Integer.parseInt(day.getExcelMonth()) + 1;
		String insertDay = day.getExcelYear() + insertMonth + "30";
		String month = day.getExcelMonth() + "월";
		String year = day.getExcelYear() + "년";

		day.setExcelMonth(month);
		day.setExcelYear(year);
		day.setInsertDay(insertDay);

		System.out.println("수정 day :: " + day);

		List<CostExcel> list = new ArrayList<>();

		if(day.getFileType().equals("xlsx")){
			//xlsxExcelReader insert 메소드
			list = mmcs.xlsxExcelReader(req, day);

		}else if(day.getFileType().equals("xls")){
			//xlsExcelReader insert 메소드
			list = mmcs.xlsExcelReader(req, day);

		}

		mv.setViewName("jsonView");
		return mv;
	}

}
