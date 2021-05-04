package com.kh.onepart.resident.my_apartment.survey.model.service;

import java.util.ArrayList;

import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyMainVO;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyPrtcpt;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyQstn;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveySelected;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyQstnOption;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyStatisticsVO;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyVO;


public interface ResidentSurveyService {

	/**
	 * 설문조사 진행 중 카운트 - 설문조사 메인
	 * @param residentSeq
	 * @return
	 */
	public int ingSurveyListCount(RequestSurveyMainVO requestSurveyMainVO);

	/**
	 * 설문조사 진행 중 리스트 - 설문조사 메인
	 * @param pi
	 * @param residentSeq
	 * @return
	 */
	public ArrayList<SurveyVO> ingSurveyList(RequestSurveyMainVO requestSurveyMainVO);

	/**
	 * 설문조사 상세정보
	 * @param requestSurveyVO
	 * @return
	 */
	public ArrayList<Object> selectSurveyDetail(SurveyVO requestSurveyVO);

	/**
	 * 설문조사 참여정보 삽입
	 * @param requestSurveyPrtcpt
	 * @param surveySelectedList
	 */
	public void insertsurveyPrtcpt(RequestSurveyPrtcpt requestSurveyPrtcpt,
			ArrayList<RequestSurveySelected> surveySelectedList);

	/**
	 * 설문조사 참여율 조회
	 * @param surveySeq
	 * @param i
	 * @return
	 */
	public double selectPrtcptPercent(int surveySeq, int surveyType);

	/**
	 * 설문조사 통계정보 가져오기
	 * @param surveySeq
	 * @return
	 */
	public ArrayList<SurveyStatisticsVO> getSelectedStatistics(int surveySeq, RequestSurveyQstn requestSurveyQstn);

	/**
	 * 설문조사 옵션 정보 가져오기
	 * @param surveySeq
	 * @param requestSurveyQstn
	 * @return
	 */
	public ArrayList<SurveyQstnOption> getSurveyQstnOptionList(int surveySeq, RequestSurveyQstn requestSurveyQstn);

	/**
	 * 통계정보 정리
	 * @param surveyStatisticsVOList
	 * @param surveyQstnOptionList
	 */
	public ArrayList<Object> surveyStatisticsVOListGroupBy(ArrayList<SurveyStatisticsVO> surveyStatisticsVOList,
			ArrayList<SurveyQstnOption> surveyQstnOptionList);

}
