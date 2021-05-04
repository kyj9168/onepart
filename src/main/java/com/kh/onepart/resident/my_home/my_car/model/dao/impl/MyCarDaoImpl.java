package com.kh.onepart.resident.my_home.my_car.model.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.my_home.my_car.model.dao.MyCarDao;
import com.kh.onepart.resident.my_home.my_car.model.vo.MyCar;;

@Repository
public class MyCarDaoImpl implements MyCarDao {

	@Override
	public List<MyCar> selectListAll(SqlSessionTemplate sqlSession, int residentSeq) {
		return sqlSession.selectList("MyCar.selectListAll", residentSeq);

	}






}
