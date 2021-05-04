package com.kh.onepart.resident.main.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ResidentTemplateDaoImpl implements ResidentTemplateDao {

	/** 읽지 않은 쪽지 개수 */
	@Override
	public int selectNoReadMessengerCount(SqlSessionTemplate sqlSession, String loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Main.selectNoReadMessengerCount", loginUser);
	}

}
