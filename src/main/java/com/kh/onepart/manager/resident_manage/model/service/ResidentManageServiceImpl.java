package com.kh.onepart.manager.resident_manage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.manager.resident_manage.model.dao.ResidentManageDao;

@Service
public class ResidentManageServiceImpl implements ResidentManageService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired 
	private ResidentManageDao rd;
	
	@Override
	public ArrayList selectAllResident() {
		
		ArrayList list = rd.selectAllResident(sqlSession);
		
		return list;
		
	}
}
