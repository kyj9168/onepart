package com.kh.onepart.resident.main.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.resident.main.model.dao.ResidentTemplateDao;

@Service
public class ResidentTemplateServiceImpl implements ResidentTemplateService {

	@Autowired
	ResidentTemplateDao residentTemplateDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 읽지 않은 쪽지 개수 */
	@Override
	public int selectNoReadMessengerCount(String loginUser) {
		// TODO Auto-generated method stub
		return residentTemplateDao.selectNoReadMessengerCount(sqlSession, loginUser);
	}

}
