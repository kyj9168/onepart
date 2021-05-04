package com.kh.onepart.manager.vote.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.manager.vote.model.vo.GeneralVote;
import com.kh.onepart.manager.vote.model.vo.GeneralVoteCandidate;
import com.kh.onepart.manager.vote.model.vo.CandidatePercent;
import com.kh.onepart.common.PageInfo;
import com.kh.onepart.manager.vote.model.vo.ElectionVote;
import com.kh.onepart.manager.vote.model.vo.ElectionVoteCandidate;

public interface ManagerVoteDao {
	//현재 진행중인 선거 리스트 불러오는 메소드
	ArrayList selectAllIngVoteList(SqlSessionTemplate sqlSession);
	//일주일 이내에 종료된 선거 리스트 불러오는 메소드
	ArrayList selectAllEndVoteList(SqlSessionTemplate sqlSession);
	//선택한 선거의 상세정보를 불러오는 메소드
	GeneralVote selectOneGeneralVoteInfo(SqlSessionTemplate sqlSession, int voteSeq);
	//선택한 선거의 후보 리스트를 불러오는 메소드
	ArrayList selectAllCandidateList(SqlSessionTemplate sqlSession, int voteSeq);
	//선택한 선거의 상세정보를 불러오는 메소드 (선거)
	ElectionVote selectOneElectionVoteInfo(SqlSessionTemplate sqlSession, int voteSeq);
	//선택한 선거의 후보 리스트를 불러오는 메소드 (선거)
	ArrayList selectAllElectionCandidateList(SqlSessionTemplate sqlSession, int voteSeq);
	//현재 선임되어있는 선관위 리스트 불러오는 메소드
	ArrayList selectAllSuperintendList(SqlSessionTemplate sqlSession);
	//해당 입주민 선관위 해임처리 하는 메소드
	int deleteSuperiented(SqlSessionTemplate sqlSession, int residentSeq);
	//위원장 선임 메소드
	int updateNewSuperientedFirst(SqlSessionTemplate sqlSession, int residentSeq);
	//위원 선임 메소드
	int updateNewSuperientedSecond(SqlSessionTemplate sqlSession, int residentSeq);
	//선임된 위원장 count 메소드
	int selectConfirmSuperientendMember(SqlSessionTemplate sqlSession);
	//각 후보마다 투표수 리스트 가져오는 메소드
	CandidatePercent selectCandidatePercentList(SqlSessionTemplate sqlSession,
			ElectionVoteCandidate electionVoteCandidate);
	//각 후보마다 투표수 리스트 가져오는 메소드 (일반투표)
	CandidatePercent selectCandidatePercentListGen(SqlSessionTemplate sqlSession,
			GeneralVoteCandidate generalVoteCandidate);
	//현재 진행중인 선거 카운트 불러오는 메소드
	int selectAllIngVoteCount(SqlSessionTemplate sqlSession);
	//현재 진행중인 선거 리스트 불러오는 메소드 - 페이징 버전
	ArrayList selectAllIngVoteListVerPaging(SqlSessionTemplate sqlSession, PageInfo pi);


}
