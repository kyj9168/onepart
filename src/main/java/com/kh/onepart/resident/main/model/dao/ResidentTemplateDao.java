package com.kh.onepart.resident.main.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface ResidentTemplateDao {

	/**
	 * 읽지 않은 쪽지 개수
	 * @param sqlSession
	 * @param loginUser
	 * @return
	 */
	int selectNoReadMessengerCount(SqlSessionTemplate sqlSession, String loginUser);

}
