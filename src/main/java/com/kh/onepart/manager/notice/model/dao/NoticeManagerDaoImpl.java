package com.kh.onepart.manager.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeManagerDaoImpl implements NoticeManagerDao {

	@Override
	public ArrayList selectAllNotice(SqlSessionTemplate sqlSession) {
		
		ArrayList list = (ArrayList) sqlSession.selectList("noticemanage1.selectAllNotice1");
		
		return list;
	}
	
	
	
}
