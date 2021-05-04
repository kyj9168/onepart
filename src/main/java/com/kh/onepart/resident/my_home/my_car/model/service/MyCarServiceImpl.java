package com.kh.onepart.resident.my_home.my_car.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.my_home.my_car.model.dao.MyCarDao;
import com.kh.onepart.resident.my_home.my_car.model.vo.MyCar;
import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatVO;

@Service
public class MyCarServiceImpl  implements MyCarService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MyCarDao MyCarDao;



	@Override
	public List<MyCar> getMyCarList(int residentSeq) {
		return MyCarDao.selectListAll(sqlSession, residentSeq);
	}


}
