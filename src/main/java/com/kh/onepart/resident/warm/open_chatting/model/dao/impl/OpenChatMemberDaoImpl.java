package com.kh.onepart.resident.warm.open_chatting.model.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.warm.open_chatting.model.dao.OpenChatMemberDao;
import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatMemberVO;

@Repository
public class OpenChatMemberDaoImpl implements OpenChatMemberDao {

	@Override
	public List<OpenChatMemberVO> selectListAll(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("OpenChatMember.selectListAll");
	}

	@Override
	public OpenChatMemberVO selectOneById(SqlSessionTemplate sqlSession, int openChatMemberSeq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCountByOpenChatSeqAndResidentSeq(SqlSessionTemplate sqlSession, OpenChatMemberVO openChatMemberVO) {

		System.out.println(openChatMemberVO);

		return sqlSession.selectOne("OpenChatMember.selectCountByOpenChatSeqAndResidentSeq", openChatMemberVO);
	}

	@Override
	public void insert(SqlSessionTemplate sqlSession, OpenChatMemberVO openChatMemberVO) {

		sqlSession.insert("OpenChatMember.insert", openChatMemberVO);
	}

	@Override
	public void update(SqlSessionTemplate sqlSession, OpenChatMemberVO openChatMemberVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteById(SqlSessionTemplate sqlSession, int openChatMemberSeq) {
		// TODO Auto-generated method stub

	}

	@Override
	public void getOutThisRoom(SqlSessionTemplate sqlSession, OpenChatMemberVO openChatMemberVO) {
		sqlSession.update("OpenChatMember.getOutThisRoom", openChatMemberVO);

	}

	@Override
	public int pastMemberEnter(SqlSessionTemplate sqlSession, OpenChatMemberVO openChatMemberVO) {
		return sqlSession.selectOne("OpenChatMember.pastMemberEnter", openChatMemberVO);
	}

	@Override
	public void reEnterOpenChatMember(SqlSessionTemplate sqlSession, OpenChatMemberVO openChatMemberVO) {
		sqlSession.update("OpenChatMember.reEnterOpenChatMember", openChatMemberVO);

	}

	@Override
	public List<ResidentVO> chatPerson(SqlSessionTemplate sqlSession, int openChatSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("OpenChatMember.chatPerson", openChatSeq);
	}





}
