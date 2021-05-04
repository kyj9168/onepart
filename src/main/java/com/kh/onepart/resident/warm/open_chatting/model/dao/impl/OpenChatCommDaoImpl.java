package com.kh.onepart.resident.warm.open_chatting.model.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.resident.warm.open_chatting.model.dao.OpenChatCommDao;
import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatCommVO;

@Repository
public class OpenChatCommDaoImpl implements OpenChatCommDao {

	@Override
	public List<OpenChatCommVO> selectListByOpenChatSeq(SqlSessionTemplate sqlSession, int openChatSeq) {

		return sqlSession.selectList("OpenChatComm.selectListByOpenChatSeq", openChatSeq);
	}

	@Override
	public void insert(SqlSessionTemplate sqlSession, OpenChatCommVO openChatCommVO) {
		sqlSession.insert("OpenChatComm.insert", openChatCommVO);
	}

	@Override
	public void saveOpenChatImageComm(SqlSessionTemplate sqlSession, OpenChatCommVO openChatCommVO) {
		sqlSession.insert("OpenChatComm.saveOpenChatImageComm", openChatCommVO);

	}
}
