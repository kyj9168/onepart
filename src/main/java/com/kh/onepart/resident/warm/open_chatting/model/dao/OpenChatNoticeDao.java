package com.kh.onepart.resident.warm.open_chatting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatNoticeVO;

public interface OpenChatNoticeDao {
	public OpenChatNoticeVO selectOneById(SqlSessionTemplate sqlSession, int openChatNoticeSeq);
	public void insert(SqlSessionTemplate sqlSession, OpenChatNoticeVO openChatNoticeVO);
	public void update(SqlSessionTemplate sqlSession, OpenChatNoticeVO openChatNoticeVO);
	public OpenChatNoticeVO noticeSelect(SqlSessionTemplate sqlSession, OpenChatNoticeVO openChatNoticeVO);
	public void insertNotice(SqlSessionTemplate sqlSession, OpenChatNoticeVO openChatNoticeVO);
	public void updateNotice(SqlSessionTemplate sqlSession, OpenChatNoticeVO openChatNoticeVO);
	public void deleteNotice(SqlSessionTemplate sqlSession, OpenChatNoticeVO openChatNoticeVO);
}