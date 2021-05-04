package com.kh.onepart.manager.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

public interface NoticeManagerDao{

	ArrayList selectAllNotice(SqlSessionTemplate sqlSession);
	
}
