package com.kh.onepart.resident.my_apartment.survey.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.common.PageInfo;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyMainVO;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyPrtcpt;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyQstn;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveySelected;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyQstn;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyQstnOption;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyStatisticsVO;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyVO;

@Repository
public class ResidentSurveyDaoImpl implements ResidentSurveyDao {

	/** 설문조사 진행 중 카운트 - 설문조사 메인 */
	@Override
	public int selectIngSurveyListCount(SqlSessionTemplate sqlSession, RequestSurveyMainVO requestSurveyMainVO) {
		// TODO Auto-generated method stub

		int surveyIngListCount = sqlSession.selectOne("ResidentSurvey.selectIngSurveyListCount", requestSurveyMainVO);

		return surveyIngListCount;
	}

	/** 설문조사 진행 중 리스트 - 설문조사 메인 */
	@Override
	public ArrayList<SurveyVO> selectIngSurveyList(SqlSessionTemplate sqlSession, RequestSurveyMainVO requestSurveyMainVO) {
		// TODO Auto-generated method stub

		PageInfo pi = requestSurveyMainVO.getPi();

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		ArrayList<SurveyVO> surveyIngList = (ArrayList) sqlSession.selectList("ResidentSurvey.selectSurveyList", requestSurveyMainVO, rowBounds);
		System.out.println("surveyIngList DAO::: " + surveyIngList);
		return surveyIngList;
	}

	/** 설문조사 상세정보 - 기본정보 */
	@Override
	public SurveyVO selectSurveyBasicInfo(SqlSessionTemplate sqlSession, SurveyVO requestSurveyVO) {
		// TODO Auto-generated method stub
		SurveyVO surveyVO = sqlSession.selectOne("ResidentSurvey.selectSurveyBasicInfo", requestSurveyVO);

		return surveyVO;
	}

	/** 설문조사 상세정보 - 문제정보 */
	@Override
	public ArrayList<SurveyQstn> selectSurveyQstnList(SqlSessionTemplate sqlSession, int surveySeq) {
		// TODO Auto-generated method stub

		ArrayList<SurveyQstn> surveyQstnList = (ArrayList) sqlSession.selectList("ResidentSurvey.selectSurveyQstnInfo", surveySeq);

		return surveyQstnList;
	}

	/** 설문조사 상세정보 - 옵션정보 */
	@Override
	public ArrayList<SurveyQstnOption> selectsurveyQstnOptionList(SqlSessionTemplate sqlSession,
			ArrayList<SurveyQstn> surveyQstnList) {
		// TODO Auto-generated method stub
		ArrayList<SurveyQstnOption> selectsurveyQstnOptionList = (ArrayList) sqlSession.selectList("ResidentSurvey.selectsurveyQstnOptionList", surveyQstnList);

		return selectsurveyQstnOptionList;
	}

	/** 설문조사 참여 기본정보 삽입 */
	@Override
	public int insertSurveyPrtcpt(SqlSessionTemplate sqlSession, RequestSurveyPrtcpt requestSurveyPrtcpt) {
		// TODO Auto-generated method stub

		sqlSession.insert("ResidentSurvey.insertSurveyPrtcpt", requestSurveyPrtcpt);
		int surveyPrtcptSeq = requestSurveyPrtcpt.getSurveyPrtcptSeq();

		return surveyPrtcptSeq;
	}

	/** 설문조사 참여 답변정보 삽입 */
	@Override
	public void insertsurveySelected(SqlSessionTemplate sqlSession, RequestSurveySelected requestSurveySelected) {
		// TODO Auto-generated method stub
		sqlSession.insert("ResidentSurvey.insertsurveySelected", requestSurveySelected);
	}

	/** 전체 입주 가구 수의 설문 전체 카운트 */
	@Override
	public int selectMovedHouseholdCount(SqlSessionTemplate sqlSession, int surveySeq) {
		// TODO Auto-generated method stub

		int movedhouseholdCount = sqlSession.selectOne("ResidentSurvey.selectMovedhouseholdCount", surveySeq);
		return movedhouseholdCount;
	}

	/** 설문에 참여한 가구 수의 카운트 */
	@Override
	public int selectHouseholdPrtcptCount(SqlSessionTemplate sqlSession, int surveySeq) {
		// TODO Auto-generated method stub
		int householdPrtcptCount = sqlSession.selectOne("ResidentSurvey.selectHouseholdPrtcptCount", surveySeq);
		return householdPrtcptCount;
	}

	/** 전체 입주민 수의 설문 전체 카운트 */
	@Override
	public int selecttotalResidentCount(SqlSessionTemplate sqlSession, int surveySeq) {
		// TODO Auto-generated method stub
		int totalResidentCount = sqlSession.selectOne("ResidentSurvey.selecttotalResidentCount", surveySeq);
		return totalResidentCount;
	}

	/** 설문에 참여한 입주민 수의 카운트 */
	@Override
	public int selectResidentPrtcptCount(SqlSessionTemplate sqlSession, int surveySeq) {
		// TODO Auto-generated method stub
		int residentPrtcptCount = sqlSession.selectOne("ResidentSurvey.selectResidentPrtcptCount", surveySeq);
		return residentPrtcptCount;
	}

	/** 설문조사 통계정보 가져오기 */
	@Override
	public ArrayList<SurveyStatisticsVO> getSelectedStatistics(SqlSessionTemplate sqlSession, RequestSurveyQstn requestSurveyQstn) {
		// TODO Auto-generated method stub

		ArrayList<SurveyStatisticsVO> surveyStatisticsVOList = (ArrayList) sqlSession.selectList("ResidentSurvey.getSelectedStatistics", requestSurveyQstn);

		return surveyStatisticsVOList;
	}

	/** 설문조사 옵션 정보 가져오기 */
	@Override
	public ArrayList<SurveyQstnOption> getSurveyQstnOptionList(SqlSessionTemplate sqlSession,
			RequestSurveyQstn requestSurveyQstn) {
		// TODO Auto-generated method stub

		ArrayList<SurveyQstnOption> surveyQstnOptionList = (ArrayList) sqlSession.selectList("ResidentSurvey.getSurveyQstnOptionList", requestSurveyQstn);
		return surveyQstnOptionList;
	}

}
