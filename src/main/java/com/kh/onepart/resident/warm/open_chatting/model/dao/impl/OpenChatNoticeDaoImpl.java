package com.kh.onepart.resident.warm.open_chatting.model.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.resident.warm.open_chatting.model.dao.OpenChatNoticeDao;
import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatNoticeVO;

@Repository
public class OpenChatNoticeDaoImpl implements OpenChatNoticeDao {

	@Override
	public OpenChatNoticeVO selectOneById(SqlSessionTemplate sqlSession, int openChatNoticeSeq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(SqlSessionTemplate sqlSession, OpenChatNoticeVO openChatNoticeVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(SqlSessionTemplate sqlSession, OpenChatNoticeVO openChatNoticeVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public OpenChatNoticeVO noticeSelect(SqlSessionTemplate sqlSession, OpenChatNoticeVO openChatNoticeVO) {

		return sqlSession.selectOne("OpenChatNotice.noticeSelect", openChatNoticeVO);
	}

	@Override
	public void insertNotice(SqlSessionTemplate sqlSession, OpenChatNoticeVO openChatNoticeVO) {
		sqlSession.insert("OpenChatNotice.insertNotice", openChatNoticeVO);

	}

	@Override
	public void updateNotice(SqlSessionTemplate sqlSession, OpenChatNoticeVO openChatNoticeVO) {
		sqlSession.update("OpenChatNotice.updateNotice", openChatNoticeVO);

	}

	@Override
	public void deleteNotice(SqlSessionTemplate sqlSession, OpenChatNoticeVO openChatNoticeVO) {
		sqlSession.delete("OpenChatNotice.deleteNotice", openChatNoticeVO);

	}

}
