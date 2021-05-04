package com.kh.onepart.manager.vote.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.onepart.manager.vote.model.vo.CandidatePercent;
import com.kh.onepart.common.PageInfo;
import com.kh.onepart.manager.vote.model.vo.ElectionVote;
import com.kh.onepart.manager.vote.model.vo.ElectionVoteCandidate;
import com.kh.onepart.manager.vote.model.vo.GeneralVote;
import com.kh.onepart.manager.vote.model.vo.GeneralVoteCandidate;

@Repository
public class ManagerVoteDaoImpl implements ManagerVoteDao{
	//현재 진행중인 선거 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllIngVoteList(SqlSessionTemplate sqlSession) {

		ArrayList ingVoteList = (ArrayList) sqlSession.selectList("manager_vote.selectAllIngVoteList");

		return ingVoteList;

	}
	//일주일 이내에 종료된 선거 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllEndVoteList(SqlSessionTemplate sqlSession) {

		ArrayList endVoteList = (ArrayList) sqlSession.selectList("manager_vote.selectAllEndVoteList");

		return endVoteList;

	}
	//선택한 선거의 상세정보를 불러오는 메소드
	@Override
	public GeneralVote selectOneGeneralVoteInfo(SqlSessionTemplate sqlSession, int voteSeq) {

		GeneralVote vote = sqlSession.selectOne("manager_vote.selectOneGeneralVoteInfo", voteSeq);

		return vote;

	}
	//선택한 선거의 후보 리스트를 불러오는 메소드
	@Override
	public ArrayList selectAllCandidateList(SqlSessionTemplate sqlSession, int voteSeq) {

		ArrayList candidateList = (ArrayList) sqlSession.selectList("manager_vote.selectAllCandidateList", voteSeq);

		return candidateList;

	}
	//선택한 선거의 상세정보를 불러오는 메소드 (선거)
	@Override
	public ElectionVote selectOneElectionVoteInfo(SqlSessionTemplate sqlSession, int voteSeq) {

		ElectionVote vote = sqlSession.selectOne("manager_vote.selectOneElectionVoteInfo", voteSeq);

		return vote;

	}
	//선택한 선거의 후보 리스트를 불러오는 메소드 (선거)
	@Override
	public ArrayList selectAllElectionCandidateList(SqlSessionTemplate sqlSession, int voteSeq) {

		ArrayList candidateList = (ArrayList) sqlSession.selectList("manager_vote.selectAllElectionCandidateList", voteSeq);

		return candidateList;

	}
	//현재 선임되어있는 선관위 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllSuperintendList(SqlSessionTemplate sqlSession) {

		ArrayList superintendList = (ArrayList) sqlSession.selectList("manager_vote.selectAllSuperintendList");

		return superintendList;

	}
	//해당 입주민 선관위 해임처리 하는 메소드
	@Override
	public int deleteSuperiented(SqlSessionTemplate sqlSession, int residentSeq) {

		int result = sqlSession.update("manager_vote.deleteSuperiented", residentSeq);

		return result;

	}

	//위원장 선임 메소드
	@Override
	public int updateNewSuperientedFirst(SqlSessionTemplate sqlSession, int residentSeq) {

		int result = sqlSession.update("manager_vote.updateNewSuperientedFirst", residentSeq);

		return result;

	}
	//위원 선임 메소드
	@Override
	public int updateNewSuperientedSecond(SqlSessionTemplate sqlSession, int residentSeq) {

		int result = sqlSession.update("manager_vote.updateNewSuperientedSecond", residentSeq);

		return result;

	}
	//선임된 위원장 count 메소드
	@Override
	public int selectConfirmSuperientendMember(SqlSessionTemplate sqlSession) {

		int resultNum = sqlSession.selectOne("manager_vote.selectConfirmSuperientendMember");

		return resultNum;

	}
	//각 후보마다 투표수 리스트 가져오는 메소드
	@Override
	public CandidatePercent selectCandidatePercentList(SqlSessionTemplate sqlSession,
			ElectionVoteCandidate electionVoteCandidate) {

		CandidatePercent percent = sqlSession.selectOne("manager_vote.selectCandidatePercentList", electionVoteCandidate);

		return percent;

	}
	//각 후보마다 투표수 리스트 가져오는 메소드 (일반투표)
	@Override
	public CandidatePercent selectCandidatePercentListGen(SqlSessionTemplate sqlSession,
			GeneralVoteCandidate generalVoteCandidate) {

		CandidatePercent percent = sqlSession.selectOne("manager_vote.selectCandidatePercentListGen", generalVoteCandidate);

		return percent;

  }
  
	//현재 진행중인 선거 카운트 불러오는 메소드
	@Override
	public int selectAllIngVoteCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("manager_vote.selectAllIngVoteCount");
	}

	//현재 진행중인 선거 리스트 불러오는 메소드 - 페이징 버전W
	@Override
	public ArrayList selectAllIngVoteListVerPaging(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		return (ArrayList) sqlSession.selectList("manager_vote.selectAllIngVoteListVerPaging", null, rowBounds);

	}

}
