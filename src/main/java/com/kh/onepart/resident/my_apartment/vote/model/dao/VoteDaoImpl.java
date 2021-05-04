package com.kh.onepart.resident.my_apartment.vote.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.resident.my_apartment.vote.model.vo.CandidatePercent;
import com.kh.onepart.resident.my_apartment.vote.model.vo.Career;
import com.kh.onepart.resident.my_apartment.vote.model.vo.ElectionVote;
import com.kh.onepart.resident.my_apartment.vote.model.vo.ElectionVoteCandidate;
import com.kh.onepart.resident.my_apartment.vote.model.vo.GeneralVote;
import com.kh.onepart.resident.my_apartment.vote.model.vo.GeneralVoteCandidate;
import com.kh.onepart.resident.my_apartment.vote.model.vo.Image;
import com.kh.onepart.resident.my_apartment.vote.model.vo.VoteList;
import com.kh.onepart.resident.my_apartment.vote.model.vo.VotePrtcpt;
import com.kh.onepart.resident.my_apartment.vote.model.vo.VoteSelected;

@Repository
public class VoteDaoImpl implements VoteDao{
	//현재 진행중인 선거 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllIngVoteList(SqlSessionTemplate sqlSession, int residentSeq) {

		ArrayList ingVoteList = (ArrayList) sqlSession.selectList("vote.selectAllIngVoteList", residentSeq);

		return ingVoteList;

	}
	//일주일 이내에 종료된 선거 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllEndVoteList(SqlSessionTemplate sqlSession, int residentSeq) {

		ArrayList endVoteList = (ArrayList) sqlSession.selectList("vote.selectAllEndVoteList", residentSeq);

		return endVoteList;

	}
	//현재 진행중인 투표중 로그인유저가 참여하지 않은 선거 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllNoVoteList(SqlSessionTemplate sqlSession, int residentSeq) {

		ArrayList noVoteList = (ArrayList) sqlSession.selectList("vote.selectAllNoVoteList", residentSeq);

		return noVoteList;

	}
	//현재 후보신청을 받고있는 선거 리스트 불러오는메소드
	@Override
	public ArrayList selectAllCandidateVoteList(SqlSessionTemplate sqlSession) {

		ArrayList candidateVoteList = (ArrayList) sqlSession.selectList("vote.selectAllCandidateVoteList");

		return candidateVoteList;

	}
	//선택한 선거의 상세정보를 불러오는 메소드 (르그인 유저의 현황도 함께)
	@Override
	public GeneralVote selectOneGeneralVoteInfo(SqlSessionTemplate sqlSession, int voteSeq) {

		GeneralVote vote = sqlSession.selectOne("vote.selectOneGeneralVoteInfo", voteSeq);

		return vote;

	}
	//로그인유저의 현황을 불러오는 메소드
	@Override
	public VoteList selectOneGeneralVoteUserInfo(SqlSessionTemplate sqlSession, VoteList info) {

		VoteList voteUser = (VoteList) sqlSession.selectOne("vote.selectOneGeneralVoteUserInfo", info);

		return voteUser;

	}
	//선택한 선거의 후보 리스트를 불러오는 메소드
	@Override
	public ArrayList selectAllCandidateList(SqlSessionTemplate sqlSession, int voteSeq) {

		ArrayList candidateList = (ArrayList) sqlSession.selectList("vote.selectAllCandidateList", voteSeq);

		return candidateList;

	}
	//해당 유저가 참여한 투표참여 고유번호 받아오는 메소드
	@Override
	public int selectUserVotePrtcptSeq(SqlSessionTemplate sqlSession, VotePrtcpt vp) {

		int votePrtcptSeq = sqlSession.selectOne("vote.selectUserVotePrtcptSeq", vp);

		return votePrtcptSeq;
	}
	//받아온 투표참여 고유번호에 대한 선택내역 수정내역으로 update하는 메소드
	@Override
	public int updateGeneralVote(SqlSessionTemplate sqlSession, VoteSelected vs) {

		int result = sqlSession.update("vote.updateGeneralVote", vs);

		return  result;

	}
	//해당 투표내역이 insert가 되고 그에 대한 currentval값 받아오는 메소드
	@Override
	public int insertCurrentVotePrtcptSeq(SqlSessionTemplate sqlSession, VotePrtcpt vp) {

		sqlSession.insert("vote.insertCurrentVotePrtcptSeq", vp);
		int votePrtcptSeq = vp.getVotePrtcptSeq();

		return votePrtcptSeq;
	}
	//해당 투표내역에 선택된 후보내역 insert 하는 메소드
	@Override
	public int insertGeneralVote(SqlSessionTemplate sqlSession, VoteSelected vs) {

		int result = sqlSession.update("vote.insertGeneralVote", vs);

		return  result;

	}
	//선택한 선거의 상세정보를 불러오는 메소드 (선거)
	@Override
	public ElectionVote selectOneElectionVoteInfo(SqlSessionTemplate sqlSession, int voteSeq) {

		ElectionVote vote = sqlSession.selectOne("vote.selectOneElectionVoteInfo", voteSeq);

		return vote;

	}
	//로그인유저의 현황을 불러오는 메소드 (선거)
	@Override
	public VoteList selectOneElectionVoteUserInfo(SqlSessionTemplate sqlSession, VoteList info) {

		VoteList voteUser = (VoteList) sqlSession.selectOne("vote.selectOneElectionVoteUserInfo", info);

		return voteUser;

	}
	//선택한 선거의 후보 리스트를 불러오는 메소드(선거)
	@Override
	public ArrayList selectAllElectionCandidateList(SqlSessionTemplate sqlSession, int voteSeq) {

		ArrayList candidateList = (ArrayList) sqlSession.selectList("vote.selectAllElectionCandidateList", voteSeq);

		return candidateList;


	}
	//신청서 insert후 seqNm return받는 메소드
	@Override
	public int insertElectionCandidateApply(SqlSessionTemplate sqlSession, ElectionVoteCandidate evc) {

		sqlSession.insert("vote.insertElectionCandidateApply", evc);
		int electVoteCndtSignupSeq = evc.getElectVoteCndtSignupSeq();

		return electVoteCndtSignupSeq;

	}
	//해당 신청서에 이미지 inert메소드
	@Override
	public int insertElectionCandidateImg(SqlSessionTemplate sqlSession, Image img) {

		int result = sqlSession.insert("vote.insertElectionCandidateImg", img);

		return result;
	}
	//해당 신청서에 경력 및 기간 insert메소드
	@Override
	public int insertElectionCandidateCareer(SqlSessionTemplate sqlSession, Career career) {

		int result2 = sqlSession.insert("vote.insertElectionCandidateCareer", career);

		return result2;

	}
	//해당 선거내역이 insert가 되고 그에 대한 currentval값 받아오는 메소드
	@Override
	public int insertCurrentVotePrtcptSeqElection(SqlSessionTemplate sqlSession, VotePrtcpt vp) {

		sqlSession.insert("vote.insertCurrentVotePrtcptSeqElection", vp);
		int votePrtcptSeq = vp.getVotePrtcptSeq();

		return votePrtcptSeq;

	}
	//해당 선거내역에 선택된 후보내역 insert 하는 메소드
	@Override
	public int insertElectionVote(SqlSessionTemplate sqlSession, VoteSelected vs) {

		int result = sqlSession.update("vote.insertElectionVote", vs);

		return  result;

	}
	//각 후보마다 투표수 리스트 가져오는 메소드
	@Override
	public CandidatePercent selectCandidatePercentList(SqlSessionTemplate sqlSession,
			ElectionVoteCandidate electionVoteCandidate) {

		CandidatePercent percent = sqlSession.selectOne("vote.selectCandidatePercentList", electionVoteCandidate);

		return percent;

	}
	//각 후보마다 투표수 리스트 가져오는 메소드 (일반투표)
	@Override
	public CandidatePercent selectCandidatePercentListGen(SqlSessionTemplate sqlSession,
			GeneralVoteCandidate generalVoteCandidate) {

		CandidatePercent percent = sqlSession.selectOne("vote.selectCandidatePercentListGen", generalVoteCandidate);

		return percent;

	}

}
