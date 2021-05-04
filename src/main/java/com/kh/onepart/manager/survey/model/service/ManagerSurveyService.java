package com.kh.onepart.manager.survey.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.onepart.common.PageInfo;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyQstn;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyQstnOption;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyVO;
import com.kh.onepart.manager.survey.model.vo.SurveyVO;

public interface ManagerSurveyService {

	/**
	 * 설문조사 메인화면 - 관리자
	 * @return
	 */
	ArrayList<SurveyVO> getSurveyList(PageInfo pi);

	/**
	 * 설문조사 리스트 전체 카운트
	 * @return
	 */
	int surveyListCount();

	/**
	 * 설문조사 검색
	 * @param requestSurveyVO
	 * @return
	 */
	ArrayList<SurveyVO> getSearchSurvey(PageInfo pi, SurveyVO requestSurveyVO);


	/**
	 * 설문조사 등록
	 * @param requestSurveyVO
	 * @param requestSurveyQstn
	 * @param surveyQstnOption
	 * @return
	 */
	void insertSurvey(RequestSurveyVO requestSurveyVO, ArrayList<RequestSurveyQstn> requestSurveyQstn,
			List<RequestSurveyQstnOption> surveyQstnOption);

	/**
	 * 설문조사 상세정보
	 * @param surveySeq
	 * @return
	 */
	ArrayList<Object> selectSurveyDetail(int surveySeq);


}
