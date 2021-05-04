package com.kh.onepart.manager.main.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.manager.main.model.dao.MainDao;
import com.kh.onepart.manager.main.model.vo.ResidentStatusVO;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainDao MainDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 입주 현황 */
	@Override
	public ResidentStatusVO residentStatus() {
		// TODO Auto-generated method stub

		int totalCount = MainDao.selectTotalCount(sqlSession);
		int currentCount = MainDao.selectCurrentCount(sqlSession);
		double residentPercent = (double) currentCount / totalCount * 100;
		residentPercent = Math.round(residentPercent * 100) / 100.0;

		ResidentStatusVO residentStatusVO = new ResidentStatusVO();
		residentStatusVO.setTotalCount(totalCount);
		residentStatusVO.setCurrentCount(currentCount);
		residentStatusVO.setResidentPercent(residentPercent);

		return residentStatusVO;
	}

	/** 총 입주민 인원 수 */
	@Override
	public int residentTotalCount() {
		// TODO Auto-generated method stub
		return MainDao.selectResidentTotalCount(sqlSession);
	}

	/** 한 가구당 인원 수 */
	@Override
	public double countPerHousehold() {
		// TODO Auto-generated method stub
		return MainDao.selectCountPerHousehold(sqlSession);
	}

	/** 등록 차량 수 */
	@Override
	public int enrollCarCount() {
		// TODO Auto-generated method stub
		return MainDao.selectEnrollCarCount(sqlSession);
	}

}
