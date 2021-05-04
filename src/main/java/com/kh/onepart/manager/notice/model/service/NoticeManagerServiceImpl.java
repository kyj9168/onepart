package com.kh.onepart.manager.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.manager.notice.model.dao.NoticeManagerDao;

@Service
public class NoticeManagerServiceImpl implements NoticeManagerService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeManagerDao nmd;

	@Override
	public ArrayList selectAllNotice() {
		
		
		ArrayList list = nmd.selectAllNotice(sqlSession);
		
		
		return list;
	}
	
	
}
