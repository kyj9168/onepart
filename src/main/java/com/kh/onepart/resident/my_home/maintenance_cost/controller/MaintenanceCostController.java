package com.kh.onepart.resident.my_home.maintenance_cost.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.my_home.maintenance_cost.model.service.MaintenanceCostService;

@Controller
public class MaintenanceCostController {
	@Autowired
	private MaintenanceCostService mcs;

	@RequestMapping("/resident/menuMaintenanceCost")
	public ModelAndView moveMaintenance(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuVote");

		//로그인 유저 정보
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();
		String aptDetailInfoSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getAptDetailInfoSeq();

		//로그인 유저의 관리비 내역 리스트 가져오는 메소드
		ArrayList costList = mcs.selectAllUserMaintenanceCostList(aptDetailInfoSeq);
		System.out.println("controller costList : " + costList);

		mv.addObject("costList", costList);
		mv.setViewName("/resident/my_home/maintenance_cost/maintenance_main");

		return mv;
	}

	@RequestMapping("/resident/maintenancecompare")
	public ModelAndView moveMaintenance_maintenancecompare(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuVote");

		//로그인 유저 정보
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();
		String aptDetailInfoSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getAptDetailInfoSeq();

		//로그인 유저의 관리비 내역 리스트 가져오는 메소드
		ArrayList costList = mcs.selectAllUserMaintenanceCostList(aptDetailInfoSeq);
		System.out.println("controller costList : " + costList);

		//현재 월
		TimeZone tz = TimeZone.getTimeZone("Asia/Seoul");
	    Calendar cal = Calendar.getInstance(tz);
	    int month = cal.get(Calendar.MONTH);
	    System.out.println("현재 월 :: " + month);

	    //로그인 유저의 최근 5달관리비 내역 리스트 가져오는 메소드
	    ArrayList compareMonthCostList = mcs.selectAllUserCompareMonthCostList(aptDetailInfoSeq);

	    //월별 카테고리별 금액 합계 리스트 가져오는 메소드
	    ArrayList sumMonthCostList = mcs.selectAllSumMonthCostList(aptDetailInfoSeq);

		mv.addObject("costList", costList);
		mv.addObject("compareMonthCostList", compareMonthCostList);
		mv.addObject("month", month);
		mv.addObject("sumMonthCostList", sumMonthCostList);

		mv.setViewName("/resident/my_home/maintenance_cost/maintenance_compare_1");

		return mv;

	}

	@RequestMapping("/resident/maintenancecompare2")
	public String moveMaintenance_maintenancecompare2() {
		System.out.println("/menuVote");
		return "/resident/my_home/maintenance_cost/maintenance_compare_2";
	}

	@RequestMapping("/resident/maintenancecompare3")
	public ModelAndView moveMaintenance_maintenancecompar3(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuVote");

		//로그인 유저 정보
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();
		String aptDetailInfoSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getAptDetailInfoSeq();

		//로그인 유저의 관리비 내역 리스트 가져오는 메소드
		ArrayList costList = mcs.selectAllUserMaintenanceCostList(aptDetailInfoSeq);
		System.out.println("controller costList : " + costList);

		//로그인 유저의 개별사용료 내역 리스트 가져오는 메소드
		ArrayList costList2 = mcs.selectCompareUserMaintenanceCostList(aptDetailInfoSeq);
		System.out.println("controller costList : " + costList);

		//로그인 유저와 같은 평수의 관리비 평균 리스트 가져오는 메소드
		ArrayList compareCostList = mcs.selectAllUserCompareMaintenanceCostList(aptDetailInfoSeq);

		mv.addObject("costList", costList);
		mv.addObject("costList2", costList2);
		mv.addObject("compareCostList", compareCostList);
		mv.setViewName("/resident/my_home/maintenance_cost/maintenance_compare_3");

		return mv;
	}

	@RequestMapping("/resident/maintenancedetail")
	public ModelAndView moveMaintenance_maintenancedetail(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuVote");

		//로그인 유저 정보
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();
		String aptDetailInfoSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getAptDetailInfoSeq();

		//로그인 유저의 관리비 내역 리스트 가져오는 메소드
		ArrayList costList = mcs.selectAllUserMaintenanceCostList(aptDetailInfoSeq);
		System.out.println("controller costList : " + costList);

		mv.addObject("costList", costList);
		mv.setViewName("/resident/my_home/maintenance_cost/maintenance_detail");

		return mv;

	}

	@RequestMapping("/resident/maintenanceuseDetail")
	public String moveMaintenance_maintenanceuseDetail() {
		System.out.println("/menuVote");
		return "/resident/my_home/maintenance_cost/maintenance_useDetail";
	}

	@RequestMapping("/resident/useDetailMonth")
	public String moveMaintenance_useDetailMonth() {
		System.out.println("/menuVote");
		return "/resident/my_home/maintenance_cost/maintenance_useDetail_month";
	}

	@RequestMapping("/resident/payment")
	public ModelAndView moveMaintenance_payment(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuVote");

		//로그인 유저 정보
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();
		String aptDetailInfoSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getAptDetailInfoSeq();

		//로그인 유저의 관리비 내역 리스트 가져오는 메소드
		ArrayList costList = mcs.selectAllUserMaintenanceCostList(aptDetailInfoSeq);
		System.out.println("controller costList : " + costList);

		mv.addObject("costList", costList);
		mv.setViewName("/resident/my_home/maintenance_cost/maintenance_payment");

		return mv;

	}
}
