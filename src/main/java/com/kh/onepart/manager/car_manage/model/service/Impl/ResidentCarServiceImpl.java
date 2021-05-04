package com.kh.onepart.manager.car_manage.model.service.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.onepart.manager.car_manage.model.dao.ResidentCarDao;
import com.kh.onepart.manager.car_manage.model.service.ResidentCarService;
import com.kh.onepart.manager.car_manage.model.vo.ResidentCarVO;


@Service
public class ResidentCarServiceImpl implements ResidentCarService{

	@Autowired
	ResidentCarDao residentCarDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ResidentCarVO> residentCarList() {
		return residentCarDao.residentCarList(sqlSession);
	}

	@Override
	public void addResidentCar(ResidentCarVO residentCarVO) {
		residentCarDao.addResidentCar(sqlSession,residentCarVO);

	}

	@Override
	public void deleteResidentCar(String residentEnrollCar) {
		residentCarDao.deleteResidentCar(sqlSession, residentEnrollCar);
	}

	@Override
	public ResidentCarVO selectResidentCar(ResidentCarVO residentCarVO) {
		return residentCarDao.selectResidentCar(sqlSession, residentCarVO);

	}

}
