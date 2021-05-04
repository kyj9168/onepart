package com.kh.onepart.manager.main.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface MainDao {

	/**
	 * 입주세대 전체 세대 수
	 * @param sqlSession
	 * @return
	 */
	int selectTotalCount(SqlSessionTemplate sqlSession);

	/**
	 * 현재 세대 수
	 * @param sqlSession
	 * @return
	 */
	int selectCurrentCount(SqlSessionTemplate sqlSession);

	/**
	 * 총 입주민 인원 수
	 * @param sqlSession
	 * @return
	 */
	int selectResidentTotalCount(SqlSessionTemplate sqlSession);

	/**
	 * 한 가구당 인원 수
	 * @param sqlSession
	 * @return
	 */
	double selectCountPerHousehold(SqlSessionTemplate sqlSession);

	/**
	 * 등록 차량 수
	 * @param sqlSession
	 * @return
	 */
	int selectEnrollCarCount(SqlSessionTemplate sqlSession);

}
