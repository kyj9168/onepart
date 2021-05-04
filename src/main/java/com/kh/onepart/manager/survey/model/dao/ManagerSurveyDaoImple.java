package com.kh.onepart.manager.survey.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.common.PageInfo;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyQstn;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyQstnOption;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyVO;
import com.kh.onepart.manager.survey.model.vo.SurveyQstn;
import com.kh.onepart.manager.survey.model.vo.SurveyQstnOption;
import com.kh.onepart.manager.survey.model.vo.SurveyVO;

@Repository
public class ManagerSurveyDaoImple implements ManagerSurveyDao{


	/** 설문조사 총 리스트 조회 */
	@Override
	public ArrayList<SurveyVO> selectSurveyList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		System.out.println("selectSurveyList dao in");
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		ArrayList<SurveyVO> surveyListCount = (ArrayList) sqlSession.selectList("ManagerSurvey.selectSurveyList", null, rowBounds);

		return surveyListCount;
	}

	/** 설문조사 총 카운트 */
	@Override
	public int selectSurveyListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		System.out.println("selectSurveyListCount dao in");

		int listCount = sqlSession.selectOne("ManagerSurvey.selectSurveyListCount");

		return listCount;
	}


	/** 설문조사 검색 */
	@Override
	public ArrayList<SurveyVO> selectSearchSurveyList(SqlSessionTemplate sqlSession, SurveyVO requestSurveyVO, PageInfo pi) {
		// TODO Auto-generated method stub

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		ArrayList<SurveyVO> surveyVOList = (ArrayList) sqlSession.selectList("ManagerSurvey.selectSearchSurveyList", requestSurveyVO, rowBounds);

		return surveyVOList;
	}

	/** 설문조사 등록 - INSERT SURVEY */
	@Override
	public int insertSurvey(SqlSessionTemplate sqlSession, RequestSurveyVO requestSurveyVO) {
		// TODO Auto-generated method stub

		sqlSession.insert("ManagerSurvey.insertSurvey", requestSurveyVO);
		int surveySeq = requestSurveyVO.getSurveySeq();
		System.out.println("surveySeq:::" + surveySeq);

		return surveySeq;

	}

	/** 설문조사 등록 - INSERT SURVEY_QSTN */
	@Override
	public int insertsurveyQstn(SqlSessionTemplate sqlSession, RequestSurveyQstn requestSurveyQstn) {
		// TODO Auto-generated method stub

		sqlSession.insert("ManagerSurvey.insertSurveyQstn", requestSurveyQstn);
		int surveyQstnSeq = requestSurveyQstn.getSurveyQstnSeq();
		System.out.println("surveyQstnSeq::" + surveyQstnSeq);

		return surveyQstnSeq;
	}

	/** 설문조사 등록 - SURVEY_QSTN_OPTION */
	@Override
	public void insertSurveyQstnOption(SqlSessionTemplate sqlSession, RequestSurveyQstnOption requestSurveyQstnOption) {
		// TODO Auto-generated method stub

		sqlSession.insert("ManagerSurvey.insertSurveyQstnOption", requestSurveyQstnOption);

	}

	/** 설문조사 상세정보 - 기본정보 */
	@Override
	public SurveyVO selectSurveyBasicInfo(SqlSessionTemplate sqlSession, int surveySeq) {
		// TODO Auto-generated method stub

		SurveyVO surveyVO = sqlSession.selectOne("ManagerSurvey.selectSurveyBasicInfo", surveySeq);

		return surveyVO;
	}

	/** 설문조사 상세정보 - 문제정보 */
	@Override
	public ArrayList<SurveyQstn> selectSurveyQstnList(SqlSessionTemplate sqlSession, int surveySeq) {
		// TODO Auto-generated method stub

		ArrayList<SurveyQstn> surveyQstnList = (ArrayList) sqlSession.selectList("ManagerSurvey.selectSurveyQstnInfo", surveySeq);

		return surveyQstnList;
	}

	/** 설문조사 상세정보 - 옵션정보 */
	@Override
	public ArrayList<SurveyQstnOption> selectsurveyQstnOptionList(SqlSessionTemplate sqlSession, ArrayList<SurveyQstn> surveyQstnList) {
		// TODO Auto-generated method stub

		ArrayList<SurveyQstnOption> selectsurveyQstnOptionList = (ArrayList) sqlSession.selectList("ManagerSurvey.selectsurveyQstnOptionList", surveyQstnList);

		return selectsurveyQstnOptionList;
	}



}
