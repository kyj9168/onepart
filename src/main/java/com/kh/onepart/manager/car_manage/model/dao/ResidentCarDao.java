package com.kh.onepart.manager.car_manage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.manager.car_manage.model.vo.ResidentCarVO;

public interface ResidentCarDao {

	List<ResidentCarVO> residentCarList(SqlSessionTemplate sqlSession);

	void addResidentCar(SqlSessionTemplate sqlSession, ResidentCarVO residentCarVO);

	void deleteResidentCar(SqlSessionTemplate sqlSession, String residentEnrollCar);

	ResidentCarVO selectResidentCar(SqlSessionTemplate sqlSession, ResidentCarVO residentCarVO);

}
