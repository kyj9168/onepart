package com.kh.onepart.resident.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.common.PageInfo;
import com.kh.onepart.common.Pagination;
import com.kh.onepart.resident.my_apartment.survey.model.service.ResidentSurveyService;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyMainVO;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyVO;
import com.kh.onepart.resident.my_apartment.vote.model.service.VoteService;

@Controller
public class ResidentMainController {
	@Autowired
	private VoteService vs;
	@Autowired
    ResidentSurveyService residentSurveyService;

	@RequestMapping("/resident/menuMain")
	public ModelAndView moveMain(ModelAndView mv, HttpServletRequest request) {

		//아파트 공지사항 리스트
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();

		//현재 진행중인 선거 리스트 불러오는 메소드
		ArrayList ingVoteList = vs.selectAllIngVoteList(residentSeq);
		System.out.println("controller ingVoteList : " + ingVoteList);

		//현재 진행중인 투표 리스트
		int currentPage = 1;
		RequestSurveyMainVO requestSurveyMainVO = new RequestSurveyMainVO();
		int surveyIngListCount = residentSurveyService.ingSurveyListCount(requestSurveyMainVO);

        System.out.println("surveyIngListCount ::: " + surveyIngListCount);
        PageInfo pi = Pagination.getPageInfo(currentPage, surveyIngListCount);
        // 진행 중 구분
        requestSurveyMainVO.setSurveyType(2);
        requestSurveyMainVO.setResidentSeq(residentSeq);
        requestSurveyMainVO.setPi(pi);
		ArrayList<SurveyVO> ingSurveyVOList = residentSurveyService.ingSurveyList(requestSurveyMainVO);


		//현재 진행중인 설문조사 리스트

		mv.addObject("ingVoteList", ingVoteList);
		mv.addObject("ingSurveyVOList", ingSurveyVOList);
		mv.setViewName("/resident/main/main");

		return mv;
	}

}
