package com.kh.onepart.manager.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.common.PageInfo;
import com.kh.onepart.common.Pagination;
import com.kh.onepart.manager.main.model.service.MainService;
import com.kh.onepart.manager.main.model.vo.ResidentStatusVO;
import com.kh.onepart.manager.vote.model.service.ManagerVoteService;

@Controller
public class ManagerMainController {

	// 메인 관련
	@Autowired
	MainService mainService;

	// 투표 관련
	@Autowired
	private ManagerVoteService vs;

	/**
	 * 메인페이지 이동
	 * @return
	 */
	@RequestMapping("/manager/menuMain")
	public String moveMain() {
		System.out.println("in moveMain");

		return "/manager/main/main";
	}

	/**
	 * 메인페이지 - 입주민 통계
	 * @return
	 */
	@RequestMapping("/manager/main/residentStatus")
	public ModelAndView residentStatus(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("in residentStatus");

		modelAndView.setViewName("jsonView");

		// 입주 현황
		ResidentStatusVO residentStatusVO = mainService.residentStatus();

		// 총 입주민 인원 수
		int residentTotalCount = mainService.residentTotalCount();

		// 한 가구당 인원 수
		double countPerHousehold = mainService.countPerHousehold();

		// 등록 차량 수
		int enrollCarCount = mainService.enrollCarCount();


		residentStatusVO.setResidentTotalCount(residentTotalCount);
		residentStatusVO.setCountPerHousehold(countPerHousehold);
		residentStatusVO.setEnrollCarCount(enrollCarCount);

		System.out.println(residentStatusVO);

		modelAndView.addObject("residentStatusVO", residentStatusVO);

		return modelAndView;
	}

	@RequestMapping("/manager/main/ingVoteInfo")
	public ModelAndView ingVoteInfo(HttpServletRequest request, ModelAndView modelAndView) {

		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		System.out.println("currentPage::::" + currentPage);

		int selectAllIngVoteCount = vs.selectAllIngVoteCount();
		System.out.println("selectAllIngVoteCount :: " + selectAllIngVoteCount);

		PageInfo pi = Pagination.getPageInfo(currentPage, selectAllIngVoteCount);

		ArrayList ingVoteList = vs.selectAllIngVoteListVerPaging(pi);
		System.out.println("controller ingVoteList : " + ingVoteList);

		modelAndView.addObject("ingVoteList", ingVoteList);
		modelAndView.addObject("pi", pi);
		modelAndView.setViewName("jsonView");

		return modelAndView;
	}
}

