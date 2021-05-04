package com.kh.onepart.resident.my_home.my_car.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.my_home.my_car.model.vo.MyCar;

public interface MyCarDao {
	public List<MyCar> selectListAll(SqlSessionTemplate sqlSession, int residentSeq);
}
