package com.kh.onepart.resident.my_apartment.survey.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.common.PageInfo;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyMainVO;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyPrtcpt;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyQstn;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveySelected;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyQstn;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyQstnOption;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyStatisticsVO;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyVO;

public interface ResidentSurveyDao {

	/**
	 * 설문조사 진행 중 카운트 - 설문조사 메인
	 * @param sqlSession
	 * @param residentSeq
	 * @return
	 */
	int selectIngSurveyListCount(SqlSessionTemplate sqlSession, RequestSurveyMainVO requestSurveyMainVO);

	/**
	 * 설문조사 진행 중 리스트 - 설문조사 메인
	 * @param sqlSession
	 * @param pi
	 * @param residentSeq
	 * @return
	 */
	ArrayList<SurveyVO> selectIngSurveyList(SqlSessionTemplate sqlSession, RequestSurveyMainVO requestSurveyMainVO);

	/**
	 * 설문조사 기본 정보 가져오기
	 * @param sqlSession
	 * @param surveySeq
	 * @return
	 */
	SurveyVO selectSurveyBasicInfo(SqlSessionTemplate sqlSession, SurveyVO requestSurveyVO);

	/**
	 * 설문조사 문제 정보 가져오기
	 * @param sqlSession
	 * @param surveySeq
	 * @return
	 */
	ArrayList<SurveyQstn> selectSurveyQstnList(SqlSessionTemplate sqlSession, int surveySeq);

	/**
	 * 설문조사 옵션 정보 가져오기
	 * @param sqlSession
	 * @param surveyQstnList
	 * @return
	 */
	ArrayList<SurveyQstnOption> selectsurveyQstnOptionList(SqlSessionTemplate sqlSession, ArrayList<SurveyQstn> surveyQstnList);

	/**
	 * 설문조사 참여 기본정보 삽입
	 * @param requestSurveyPrtcpt
	 * @return
	 */
	int insertSurveyPrtcpt(SqlSessionTemplate sqlSession, RequestSurveyPrtcpt requestSurveyPrtcpt);

	/**
	 * 설문조사 참여 답변정보 삽입
	 * @param sqlSession
	 * @param requestSurveySelected
	 */
	void insertsurveySelected(SqlSessionTemplate sqlSession, RequestSurveySelected requestSurveySelected);

	/**
	 * 전체 입주 가구 수의 설문 전체 카운트
	 * @param surveySeq
	 * @return
	 */
	int selectMovedHouseholdCount(SqlSessionTemplate sqlSession, int surveySeq);

	/**
	 * 설문에 참여한 가구 수의 카운트
	 * @param sqlSession
	 * @param surveySeq
	 * @return
	 */
	int selectHouseholdPrtcptCount(SqlSessionTemplate sqlSession, int surveySeq);

	/**
	 * 전체 입주민 수의 설문 전체 카운트
	 * @param sqlSession
	 * @param surveySeq
	 * @return
	 */
	int selecttotalResidentCount(SqlSessionTemplate sqlSession, int surveySeq);

	/**
	 * 설문에 참여한 입주민 수의 카운트
	 * @param sqlSession
	 * @param surveySeq
	 * @return
	 */
	int selectResidentPrtcptCount(SqlSessionTemplate sqlSession, int surveySeq);

	/**
	 * 설문조사 통계정보 가져오기
	 * @param requestSurveyQstn
	 * @return
	 */
	ArrayList<SurveyStatisticsVO> getSelectedStatistics(SqlSessionTemplate sqlSession, RequestSurveyQstn requestSurveyQstn);

	/**
	 * 설문조사 옵션 정보 가져오기
	 * @param sqlSession
	 * @param requestSurveyQstn
	 * @return
	 */
	ArrayList<SurveyQstnOption> getSurveyQstnOptionList(SqlSessionTemplate sqlSession,
			RequestSurveyQstn requestSurveyQstn);

}
