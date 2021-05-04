package com.kh.onepart.manager.main.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MainDaoImpl implements MainDao {

	/** 입주세대 전체 세대 수 */
	@Override
	public int selectTotalCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ManagerMain.selectTotalCount");
	}

	/** 현재 세대 수 */
	@Override
	public int selectCurrentCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ManagerMain.selectCurrentCount");
	}

	/** 총 입주민 인원 수 */
	@Override
	public int selectResidentTotalCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ManagerMain.selectResidentTotalCount");
	}

	/** 한 가구당 인원 수 */
	@Override
	public double selectCountPerHousehold(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ManagerMain.selectCountPerHousehold");
	}

	/** 등록 차량 수 */
	@Override
	public int selectEnrollCarCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ManagerMain.selectEnrollCarCount");
	}

}
