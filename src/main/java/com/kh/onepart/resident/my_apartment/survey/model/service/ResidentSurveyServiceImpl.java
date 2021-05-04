package com.kh.onepart.resident.my_apartment.survey.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.common.PageInfo;
import com.kh.onepart.resident.my_apartment.survey.model.dao.ResidentSurveyDao;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyMainVO;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyPrtcpt;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveyQstn;
import com.kh.onepart.resident.my_apartment.survey.model.vo.RequestSurveySelected;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyQstn;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyQstnOption;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyStatisticsVO;
import com.kh.onepart.resident.my_apartment.survey.model.vo.SurveyVO;

@Service
public class ResidentSurveyServiceImpl implements ResidentSurveyService {

	@Autowired
	ResidentSurveyDao residentSurveyDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 설문조사 진행 중 카운트 - 설문조사 메인 */
	@Override
	public int ingSurveyListCount(RequestSurveyMainVO requestSurveyMainVO) {
		// TODO Auto-generated method stub

		int surveyIngListCount = residentSurveyDao.selectIngSurveyListCount(sqlSession, requestSurveyMainVO);

		return surveyIngListCount;
	}

	/** 설문조사 진행 중 리스트 - 설문조사 메인 */
	@Override
	public ArrayList<SurveyVO> ingSurveyList(RequestSurveyMainVO requestSurveyMainVO) {
		// TODO Auto-generated method stub

		ArrayList<SurveyVO> ingSurveyVOList = residentSurveyDao.selectIngSurveyList(sqlSession, requestSurveyMainVO);

		return ingSurveyVOList;
	}

	/** 설문조사 상세정보 */
	@Override
	public ArrayList<Object> selectSurveyDetail(SurveyVO requestSurveyVO) {
		// TODO Auto-generated method stub
		ArrayList<Object> surveyDetailList = new ArrayList<Object>();

		// 설문조사 기본 정보
		SurveyVO surveyVO = residentSurveyDao.selectSurveyBasicInfo(sqlSession, requestSurveyVO);

		// 설문조사 문제 정보
		ArrayList<SurveyQstn> surveyQstnList = residentSurveyDao.selectSurveyQstnList(sqlSession, requestSurveyVO.getSurveySeq());

		// 설문조사 옵션 정보
		ArrayList<SurveyQstnOption> surveyQstnOptionList = residentSurveyDao.selectsurveyQstnOptionList(sqlSession, surveyQstnList);


		System.out.println("==================== 상세정보 ====================");
		System.out.println("surveyVO ::: " + surveyVO);
		System.out.println("surveyQstnList ::: " + surveyQstnList);
		System.out.println("surveyQstnOptionList ::: " + surveyQstnOptionList);

		surveyDetailList.add(surveyVO);
		surveyDetailList.add(surveyQstnList);
		surveyDetailList.add(surveyQstnOptionList);

		return surveyDetailList;
	}

	/** 설문조사 참여정보 삽입 */
	@Override
	public void insertsurveyPrtcpt(RequestSurveyPrtcpt requestSurveyPrtcpt,
			ArrayList<RequestSurveySelected> surveySelectedList) {
		// TODO Auto-generated method stub
		System.out.println("insertsurveyPrtcpt service in!!!!");

		// 설문조사 참여 기본정보 삽입
		int surveyPrtcptSeq = residentSurveyDao.insertSurveyPrtcpt(sqlSession, requestSurveyPrtcpt);
		System.out.println("surveyPrtcptSeq ::: " + surveyPrtcptSeq);

		for(int i=0; i<surveySelectedList.size(); i++) {
			surveySelectedList.get(i).setSurveyPrtcptSeq(surveyPrtcptSeq);
			// 설문조사 참여 답변정보 삽입
			residentSurveyDao.insertsurveySelected(sqlSession, surveySelectedList.get(i));
		}
	}

	/** 설문조사 참여율 조회 */
	@Override
	public double selectPrtcptPercent(int surveySeq, int surveyType) {
		// TODO Auto-generated method stub
		double prtcptPercent  = 0.0;
		// 설문 타입이 세대별일 경우
		if(surveyType == 2) {
			// 전체 입주 가구 수의 설문 전체 카운트
			int movedHouseholdCount = residentSurveyDao.selectMovedHouseholdCount(sqlSession, surveySeq);
			System.out.println("movedHouseholdCount:::: " + movedHouseholdCount);

			// 설문에 참여한 가구 수의 카운트
			int householdPrtcptCount = residentSurveyDao.selectHouseholdPrtcptCount(sqlSession, surveySeq);
			System.out.println("householdPrtcptCount:::: " + householdPrtcptCount);

			prtcptPercent = (double) householdPrtcptCount / movedHouseholdCount * 100;

			System.out.println("PrtcptPercent ::: " + prtcptPercent);

		// 설문 타입이 일반일 경우
		} else {

			// 전체 입주민 수의 설문 전체 카운트
			int totalResidentCount = residentSurveyDao.selecttotalResidentCount(sqlSession, surveySeq);
			System.out.println("totalResidentCount :: " + totalResidentCount);

			// 설문에 참여한 입주민 수의 카운트
			int residentPrtcptCount = residentSurveyDao.selectResidentPrtcptCount(sqlSession, surveySeq);
			System.out.println("residentPrtcptCount :: " + residentPrtcptCount);

			prtcptPercent = (double) residentPrtcptCount / totalResidentCount * 100;
		}
		return prtcptPercent;
	}

	/** 설문조사 통계정보 가져오기 */
	@Override
	public ArrayList<SurveyStatisticsVO> getSelectedStatistics(int surveySeq, RequestSurveyQstn requestSurveyQstn) {
		// TODO Auto-generated method stub

		ArrayList<SurveyStatisticsVO> surveyStatisticsVOList = residentSurveyDao.getSelectedStatistics(sqlSession, requestSurveyQstn);
		return surveyStatisticsVOList;
	}

	/** 설문조사 옵션 정보 가져오기 */
	@Override
	public ArrayList<SurveyQstnOption> getSurveyQstnOptionList(int surveySeq, RequestSurveyQstn requestSurveyQstn) {
		// TODO Auto-generated method stub

		ArrayList<SurveyQstnOption> surveyQstnOptionList = residentSurveyDao.getSurveyQstnOptionList(sqlSession, requestSurveyQstn);
		return surveyQstnOptionList;
	}

	/** 통계정보 정리 */
	@Override
	public ArrayList<Object> surveyStatisticsVOListGroupBy(ArrayList<SurveyStatisticsVO> surveyStatisticsVOList,
			ArrayList<SurveyQstnOption> surveyQstnOptionList) {
		// TODO Auto-generated method stub
		ArrayList<String> optionInfoList = new ArrayList<String>();
		ArrayList<Integer> countInfoList = new ArrayList<Integer>();
		for(SurveyQstnOption surveyQstnOption : surveyQstnOptionList) {
			optionInfoList.add(surveyQstnOption.getSurveyQstnOptionContent());
			int count = 0;

			for(SurveyStatisticsVO surveyStatisticsVO : surveyStatisticsVOList) {
				String selectedAnswer = surveyStatisticsVO.getSelectedAnswer();
				selectedAnswer = selectedAnswer.replace("[", "");
				selectedAnswer = selectedAnswer.replace("]", "");
				System.out.println("selectedAnswer::" + selectedAnswer);
				String tmp[] = selectedAnswer.split(", ");
				for(int i=0; i<tmp.length; i++) {
					System.out.println("=====!=====================");
					System.out.println(surveyQstnOption.getSurveyQstnOptionContent() + "::::::::::::::::::::::::::::" + tmp[i]);
					if(surveyQstnOption.getSurveyQstnOptionContent().equals(tmp[i])) {
						count ++;
					}
				} // end for i
			} // end second for
			countInfoList.add(count);
		} // end first for

		for(int i=0; i<optionInfoList.size(); i++) {
			System.out.println(optionInfoList.get(i) + "::::" + countInfoList.get(i));
		}

		ArrayList<Object> list = new ArrayList<Object>();
		list.add(optionInfoList);
		list.add(countInfoList);

		return list;
	}

}
