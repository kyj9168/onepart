package com.kh.onepart.resident.warm.open_chatting.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatMemberVO;

public interface OpenChatMemberDao {
	public List<OpenChatMemberVO> selectListAll(SqlSessionTemplate sqlSession);
	public OpenChatMemberVO selectOneById(SqlSessionTemplate sqlSession, int openChatMemberSeq);
	public int selectCountByOpenChatSeqAndResidentSeq(SqlSessionTemplate sqlSession, OpenChatMemberVO openChatMemberVO);
	public void insert(SqlSessionTemplate sqlSession, OpenChatMemberVO openChatMemberVO);
	public void update(SqlSessionTemplate sqlSession, OpenChatMemberVO openChatMemberVO);
	public void deleteById(SqlSessionTemplate sqlSession, int openChatMemberSeq);
	public void getOutThisRoom(SqlSessionTemplate sqlSession, OpenChatMemberVO openChatMemberVO);
	public int pastMemberEnter(SqlSessionTemplate sqlSession, OpenChatMemberVO openChatMemberVO);
	public void reEnterOpenChatMember(SqlSessionTemplate sqlSession, OpenChatMemberVO openChatMemberVO);
	public List<ResidentVO> chatPerson(SqlSessionTemplate sqlSession, int openChatSeq);

}
