package com.kh.onepart.manager.survey.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.common.PageInfo;
import com.kh.onepart.manager.survey.model.dao.ManagerSurveyDao;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyQstn;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyQstnOption;
import com.kh.onepart.manager.survey.model.vo.RequestSurveyVO;
import com.kh.onepart.manager.survey.model.vo.SurveyQstn;
import com.kh.onepart.manager.survey.model.vo.SurveyQstnOption;
import com.kh.onepart.manager.survey.model.vo.SurveyVO;

@Service
public class ManagerSurveyServiceImpl implements ManagerSurveyService{

	@Autowired
	ManagerSurveyDao managerSurveyDao;

	@Autowired
	private SqlSessionTemplate sqlSession;


	/** 설문조사 리스트 전체 카운트 */
	@Override
	public int surveyListCount() {
		// TODO Auto-generated method stub

		int surveyListCount = managerSurveyDao.selectSurveyListCount(sqlSession);

		return surveyListCount;
	}

	/** 설문조사 메인화면 */
	@Override
	public ArrayList<SurveyVO> getSurveyList(PageInfo pi) {
		// TODO Auto-generated method stub

		ArrayList<SurveyVO> surveyVOList = managerSurveyDao.selectSurveyList(sqlSession, pi);

		return surveyVOList;
	}

	/** 설문조사 검색*/
	@Override
	public ArrayList<SurveyVO> getSearchSurvey(PageInfo pi, SurveyVO requestSurveyVO){
		// TODO Auto-generated method stub

		ArrayList<SurveyVO> surveyVOList = managerSurveyDao.selectSearchSurveyList(sqlSession, requestSurveyVO, pi);

		return surveyVOList;

	}

	/** 설문조사 등록 */
	@Override
	public void insertSurvey(RequestSurveyVO requestSurveyVO, ArrayList<RequestSurveyQstn> requestSurveyQstn,
			List<RequestSurveyQstnOption> surveyQstnOption) {
		// TODO Auto-generated method stub

		// INSERT SURVEY
		int surveySeq = managerSurveyDao.insertSurvey(sqlSession, requestSurveyVO);

		// INSERT SURVEY_QSTN
		for(int i=0; i<requestSurveyQstn.size(); i++) {
			requestSurveyQstn.get(i).setSurveySeq(surveySeq);

			int surveyQstnSeq = managerSurveyDao.insertsurveyQstn(sqlSession, requestSurveyQstn.get(i));

			// 객관식, 체크박스 일 경우
			if (requestSurveyQstn.get(i).getSurveyQstnType() == 3 || requestSurveyQstn.get(i).getSurveyQstnType() == 4) {

				// 받아온 전체 옵션 개수만큼 반복
				for(int j=0; j<surveyQstnOption.size(); j++) {

					// 문제 번호가 같은 것 끼리 INSERT
					if(requestSurveyQstn.get(i).getSurveyQstnNum() == surveyQstnOption.get(j).getSurveyQstnNum()) {
						surveyQstnOption.get(j).setSurveyQstnSeq(surveyQstnSeq);
						managerSurveyDao.insertSurveyQstnOption(sqlSession, surveyQstnOption.get(j));
					}

				} // end for j
			} // end if
		} // end for i
	}

	/** 설문조사 상세정보 */
	@Override
	public ArrayList<Object> selectSurveyDetail(int surveySeq) {
		// TODO Auto-generated method stub

		ArrayList<Object> surveyDetailList = new ArrayList<Object>();

		// 설문조사 기본 정보
		SurveyVO surveyVO = managerSurveyDao.selectSurveyBasicInfo(sqlSession, surveySeq);

		// 설문조사 문제 정보
		ArrayList<SurveyQstn> surveyQstnList = managerSurveyDao.selectSurveyQstnList(sqlSession, surveySeq);

		// 설문조사 옵션 정보
		ArrayList<SurveyQstnOption> surveyQstnOptionList = managerSurveyDao.selectsurveyQstnOptionList(sqlSession, surveyQstnList);


		System.out.println("==================== 상세정보 ====================");
		System.out.println("surveyVO ::: " + surveyVO);
		System.out.println("surveyQstnList ::: " + surveyQstnList);
		System.out.println("surveyQstnOptionList ::: " + surveyQstnOptionList);

		surveyDetailList.add(surveyVO);
		surveyDetailList.add(surveyQstnList);
		surveyDetailList.add(surveyQstnOptionList);

		return surveyDetailList;
	}


}
