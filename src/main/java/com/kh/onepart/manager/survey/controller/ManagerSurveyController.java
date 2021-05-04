package com.kh.onepart.manager.survey.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.kh.onepart.common.PageInfo;
import com.kh.onepart.common.Pagination;
import com.kh.onepart.manager.survey.model.service.ManagerSurveyService;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyQstn;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyQstnOption;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyVO;
import com.kh.onepart.manager.survey.model.vo.SurveyQstn;
import com.kh.onepart.manager.survey.model.vo.SurveyQstnOption;
import com.kh.onepart.manager.survey.model.vo.SurveyVO;

@Controller
public class ManagerSurveyController {

	@Autowired
	ManagerSurveyService surveyService;

	/**
	 * 설문조사 메인페이지
	 * @return
	 */
	@RequestMapping("/manager/menuSurvey")
	public ModelAndView moveAccountPage(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("in manager/menuSurvey");

		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		System.out.println("currentPage::::" + currentPage);

		int surveyListCount = surveyService.surveyListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, surveyListCount);

		ArrayList<SurveyVO> surveyList = surveyService.getSurveyList(pi);

		modelAndView.addObject("surveyList", surveyList);
		modelAndView.addObject("pi", pi);
		modelAndView.setViewName("manager/survey/surveyMain");

		return modelAndView;
	}


	/**
	 * 검색버튼 클릭
	 * @param requestSurveyVO
	 * @return
	 */
	@RequestMapping(value="/manager/searchSurvey")
	public ModelAndView searchSurvey(HttpServletRequest request, SurveyVO requestSurveyVO, ModelAndView modelAndView) {
		System.out.println("in manager/searchSurvey");

		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}


		int surveyListCount = surveyService.surveyListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, surveyListCount);

		ArrayList<SurveyVO> surveyList = surveyService.getSearchSurvey(pi, requestSurveyVO);

		modelAndView.addObject("surveyList", surveyList);
		modelAndView.addObject("pi", pi);
		modelAndView.setViewName("jsonView");

		System.out.println("send!!");

		return modelAndView;
	}

	/**
	 * 설문조사 등록
	 * @param resultJson
	 * @return
	 */
	@RequestMapping(value="/manager/insertSurvey")
	public ModelAndView insertSurvey(String resultJsonStr, ModelAndView modelAndView) {

		System.out.println("resultJsonStr :: " + resultJsonStr);

		ObjectMapper mapper = new ObjectMapper();
		Map<Object, Object> surveyVOMap = new HashMap<Object, Object>();
		List<Object> surveyQstnList = new ArrayList<Object>();
		try {

			surveyVOMap = mapper.readValue(resultJsonStr, new TypeReference<Map<Object, Object>>(){});

			System.out.println("map :: " + surveyVOMap);

			RequestSurveyVO requestSurveyVO = new RequestSurveyVO();


			// requestSurveyVO settings
			String surveyTitle = (String) surveyVOMap.get("surveyTitle");
			String surveySimpleIntro = (String) surveyVOMap.get("surveySimpleIntro");
			String surveyPeriod = (String) surveyVOMap.get("surveyPeriod");
			String surveyType = (String) surveyVOMap.get("surveyType");

			requestSurveyVO.setSurveyTitle(surveyTitle);
			requestSurveyVO.setSurveySimpleIntro(surveySimpleIntro);
			requestSurveyVO.setSurveyPeriod(surveyPeriod);
			requestSurveyVO.setSurveyType(Integer.parseInt(surveyType));

			// requestSurveyQstn settings
			surveyQstnList = (List<Object>) surveyVOMap.get("surveyQstn");
			ArrayList<RequestSurveyQstn> requestSurveyQstn = new ArrayList<RequestSurveyQstn>();
			List<RequestSurveyQstnOption> surveyQstnOption = new ArrayList<RequestSurveyQstnOption>();
			for(int i=0; i<surveyQstnList.size(); i++) {
				Map<Object, Object> surveyQstnMap = new HashMap<Object, Object>();
				surveyQstnMap = (Map<Object, Object>) surveyQstnList.get(i);
				RequestSurveyQstn tempRequestSurveyQstn = new RequestSurveyQstn();

				int surveyQstnNum = (int) surveyQstnMap.get("surveyQstnNum");
				String surveyQstnTitle = (String) surveyQstnMap.get("surveyQstnTitle");
				String surveyQstnType = (String) surveyQstnMap.get("surveyQstnType");
				String surveyQstnNece = "";
				if((boolean) surveyQstnMap.get("surveyQstnNece") == true) {
					surveyQstnNece = "Y";
				} else {
					surveyQstnNece = "N";
				}

				tempRequestSurveyQstn.setSurveyQstnNum(surveyQstnNum);
				tempRequestSurveyQstn.setSurveyQstnTitle(surveyQstnTitle);
				tempRequestSurveyQstn.setSurveyQstnType(Integer.parseInt(surveyQstnType));
				tempRequestSurveyQstn.setSurveyQstnNece(surveyQstnNece);

				ArrayList<Object> surveyQstnOptionList = (ArrayList<Object>) surveyQstnMap.get("surveyQstnOption");

				// System.out.println("surveyQstnOptionList :: " + surveyQstnOptionList);
				for(int j=0; j<surveyQstnOptionList.size(); j++) {

					ArrayList<Object> optionDetail = (ArrayList<Object>) surveyQstnOptionList.get(j);
					// System.out.println("optionDetail ::: " + optionDetail);

					RequestSurveyQstnOption requestSurveyQstnOption = null;
					for(int k=0; k<optionDetail.size(); k++) {
						if(k % 2 == 0) {
							requestSurveyQstnOption = new RequestSurveyQstnOption();
							requestSurveyQstnOption.setSurveyQstnOptionNum((Integer) optionDetail.get(k));
						} else {
							requestSurveyQstnOption.setSurveyQstnOptionContent((String) optionDetail.get(k));
							requestSurveyQstnOption.setSurveyQstnNum(surveyQstnNum);
							surveyQstnOption.add(requestSurveyQstnOption);
						}
					}
				}
				requestSurveyQstn.add(tempRequestSurveyQstn);
			}

			surveyService.insertSurvey(requestSurveyVO, requestSurveyQstn, surveyQstnOption);

			System.out.println("requestSurveyVO:::" + requestSurveyVO);
			System.out.println("requestSurveyQstn:::" + requestSurveyQstn);
			System.out.println("surveyQstnOption:::" + surveyQstnOption);

		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		modelAndView.setViewName("redirect:menuSurvey");
		return modelAndView;
	}


	/**
	 * 설문조사 상세정보
	 * @param surveySeq
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/manager/surveyDetail")
	public ModelAndView moveSurveyDetail(int surveySeq, ModelAndView modelAndView) {
		System.out.println("/manager/surveyDetail in");
		System.out.println("request surveySeq :::" + surveySeq);
		modelAndView.setViewName("manager/survey/surveyDetail");

		ArrayList<Object> surveyDetailList = surveyService.selectSurveyDetail(surveySeq);
		SurveyVO surveyVO = (SurveyVO) surveyDetailList.get(0);
		ArrayList<SurveyQstn> surveyQstnList = (ArrayList<SurveyQstn>) surveyDetailList.get(1);
		ArrayList<SurveyQstnOption> surveyQstnOptionList = (ArrayList<SurveyQstnOption>) surveyDetailList.get(2);

		modelAndView.addObject("surveyVO", surveyVO);
		modelAndView.addObject("surveyQstnList", surveyQstnList);
		modelAndView.addObject("surveyQstnOptionList", surveyQstnOptionList);

		return modelAndView;
	}

	/**
	 * 설문조사 삭제
	 * @param surveySeq
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/manager/deleteSurvey")
	public ModelAndView deleteSurvey(int surveySeq, ModelAndView modelAndView) {
		System.out.println("/manager/surveyDetail in");
		System.out.println("request surveySeq :::" + surveySeq);
		modelAndView.setViewName("manager/survey/surveyDetail");

		ArrayList<Object> surveyDetailList = surveyService.selectSurveyDetail(surveySeq);
		SurveyVO surveyVO = (SurveyVO) surveyDetailList.get(0);
		ArrayList<SurveyQstn> surveyQstnList = (ArrayList<SurveyQstn>) surveyDetailList.get(1);
		ArrayList<SurveyQstnOption> surveyQstnOptionList = (ArrayList<SurveyQstnOption>) surveyDetailList.get(2);

		modelAndView.addObject("surveyVO", surveyVO);
		modelAndView.addObject("surveyQstnList", surveyQstnList);
		modelAndView.addObject("surveyQstnOptionList", surveyQstnOptionList);

		return modelAndView;
	}



}
