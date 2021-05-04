package com.kh.onepart.manager.survey.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.common.PageInfo;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyQstn;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyQstnOption;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyVO;
import com.kh.onepart.manager.survey.model.vo.SurveyQstn;
import com.kh.onepart.manager.survey.model.vo.SurveyQstnOption;
import com.kh.onepart.manager.survey.model.vo.SurveyVO;

public interface ManagerSurveyDao {

	/**
	 * 설문조사 메인화면
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	ArrayList<SurveyVO> selectSurveyList(SqlSessionTemplate sqlSession, PageInfo pi);

	/**
	 * 설문조사 검색
	 * @param sqlSession
	 * @param requestSurveyVO
	 * @param pi
	 * @return
	 */
	ArrayList<SurveyVO> selectSearchSurveyList(SqlSessionTemplate sqlSession, SurveyVO requestSurveyVO, PageInfo pi);

	/**
	 * 설문조사 등록 - INSERT SURVEY
	 * @param sqlSession
	 * @param requestSurveyVO
	 */
	int insertSurvey(SqlSessionTemplate sqlSession, RequestSurveyVO requestSurveyVO);

	/**
	 * 설문조사 등록  - INSERT SURVEY_QSTN
	 * @param sqlSession
	 * @param requestSurveyQstn
	 * @return
	 */
	int insertsurveyQstn(SqlSessionTemplate sqlSession, RequestSurveyQstn requestSurveyQstn);

	/**
	 * 설문조사 등록 - INSERT SURVEY_QSTN_OPTION
	 * @param sqlSession
	 * @param requestSurveyQstnOption
	 */
	void insertSurveyQstnOption(SqlSessionTemplate sqlSession, RequestSurveyQstnOption requestSurveyQstnOption);

	/**
	 * 설문조사 리스트 전체 카운트
	 * @param sqlSession
	 * @return
	 */
	int selectSurveyListCount(SqlSessionTemplate sqlSession);

	/**
	 * 설문조사 기본 정보 가져오기
	 * @param sqlSession
	 * @param surveySeq
	 * @return
	 */
	SurveyVO selectSurveyBasicInfo(SqlSessionTemplate sqlSession, int surveySeq);

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

}
