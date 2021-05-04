package com.kh.onepart.resident.warm.open_chatting.model.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.resident.warm.open_chatting.model.dao.OpenChatMemberDao;
import com.kh.onepart.resident.warm.open_chatting.model.dao.OpenChatNoticeDao;
import com.kh.onepart.resident.warm.open_chatting.model.service.OpenChatNoticeService;
import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatNoticeVO;

@Service
public class OpenChatNoticeServiceImpl implements OpenChatNoticeService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private OpenChatNoticeDao openChatNoticeDao;
	@Override
	public OpenChatNoticeVO noticeSelect(OpenChatNoticeVO openChatNoticeVO) {
		return openChatNoticeDao.noticeSelect(sqlSession, openChatNoticeVO);

	}
	@Override
	public void insertNotice(OpenChatNoticeVO openChatNoticeVO) {
		openChatNoticeDao.insertNotice(sqlSession, openChatNoticeVO);

	}
	@Override
	public void updateNotice(OpenChatNoticeVO openChatNoticeVO) {
		openChatNoticeDao.updateNotice(sqlSession, openChatNoticeVO);

	}
	@Override
	public void deleteNotice(OpenChatNoticeVO openChatNoticeVO) {
		openChatNoticeDao.deleteNotice(sqlSession, openChatNoticeVO);
	}

}
