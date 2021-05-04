package com.kh.onepart.resident.my_apartment.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.resident.my_apartment.notice.model.vo.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Override
	public ArrayList<NoticeVo> selectNoticeVo(int noticeSeq,SqlSessionTemplate sqlSession) {
		
		return null;
	}

	@Override
	public ArrayList<NoticeVo> insertNoticeVo(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
