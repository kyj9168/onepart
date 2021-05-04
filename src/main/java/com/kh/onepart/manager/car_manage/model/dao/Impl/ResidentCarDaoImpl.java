package com.kh.onepart.manager.car_manage.model.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.manager.car_manage.model.dao.ResidentCarDao;
import com.kh.onepart.manager.car_manage.model.vo.ResidentCarVO;

@Repository
public class ResidentCarDaoImpl implements ResidentCarDao{

	@Override
	public List<ResidentCarVO> residentCarList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ResidentCar.residentCarList");

	}

	@Override
	public void addResidentCar(SqlSessionTemplate sqlSession, ResidentCarVO residentCarVO) {
		sqlSession.insert("ResidentCar.addResidentCar", residentCarVO);

	}

	@Override
	public void deleteResidentCar(SqlSessionTemplate sqlSession, String residentEnrollCar) {
		sqlSession.delete("ResidentCar.deleteResidentCar", residentEnrollCar);

	}

	@Override
	public ResidentCarVO selectResidentCar(SqlSessionTemplate sqlSession, ResidentCarVO residentCarVO) {
		return sqlSession.selectOne("ResidentCar.selectResidentCar", residentCarVO);

	}

}
