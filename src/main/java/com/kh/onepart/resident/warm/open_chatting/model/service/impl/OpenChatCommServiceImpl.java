package com.kh.onepart.resident.warm.open_chatting.model.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.resident.warm.open_chatting.model.dao.OpenChatCommDao;
import com.kh.onepart.resident.warm.open_chatting.model.service.OpenChatCommService;
import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatCommVO;

@Service
public class OpenChatCommServiceImpl implements OpenChatCommService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	OpenChatCommDao openChatCommDao;

	@Override
	public void saveOpenChatComm(OpenChatCommVO openChatCommVO) {
		openChatCommDao.insert(sqlSession, openChatCommVO);
	}

	@Override
	public List<OpenChatCommVO> getPrevMessages(int openChatSeq) {
		return openChatCommDao.selectListByOpenChatSeq(sqlSession, openChatSeq);
	}

	@Override
	public void saveOpenChatImageComm(OpenChatCommVO openChatCommVO) {
		openChatCommDao.saveOpenChatImageComm(sqlSession, openChatCommVO);

	}
}
