package com.kh.onepart.manager.resident_manage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ResidentManageDaoImpl implements ResidentManageDao {
	
	@Override
	public ArrayList selectAllResident(SqlSessionTemplate sqlSession) {
		
		ArrayList list = (ArrayList) sqlSession.selectList("residentmanage11.selectAllResident11");
//		ArrayList list = (ArrayList) sqlSession.selectList("faclilty.selectAllReservation");
		
		return list;
		
	}
}
