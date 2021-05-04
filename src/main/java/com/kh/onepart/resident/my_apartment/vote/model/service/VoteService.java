package com.kh.onepart.resident.my_apartment.vote.model.service;

import java.util.ArrayList;

import com.kh.onepart.resident.my_apartment.vote.model.vo.CandidatePercent;
import com.kh.onepart.resident.my_apartment.vote.model.vo.Career;
import com.kh.onepart.resident.my_apartment.vote.model.vo.ElectionVote;
import com.kh.onepart.resident.my_apartment.vote.model.vo.ElectionVoteCandidate;
import com.kh.onepart.resident.my_apartment.vote.model.vo.GeneralVote;
import com.kh.onepart.resident.my_apartment.vote.model.vo.GeneralVoteCandidate;
import com.kh.onepart.resident.my_apartment.vote.model.vo.Image;
import com.kh.onepart.resident.my_apartment.vote.model.vo.VoteList;
import com.kh.onepart.resident.my_apartment.vote.model.vo.VotePrtcpt;

public interface VoteService {
	//현재 진행중인 선거 리스트 불러오는 메소드
	ArrayList selectAllIngVoteList(int residentSeq);
	//현재 진행중인 투표중 로그인유저가 참여하지 않은 선거 리스트 불러오는 메소드
	ArrayList selectAllNoVoteList(int residentSeq);
	//일주일 이내에 종료된 선거 리스트 불러오는 메소드
	ArrayList selectAllEndVoteList(int residentSeq);
	//현재 후보신청을 받고있는 선거 리스트 불러오는메소드
	ArrayList selectAllCandidateVoteList();
	//선택한 선거의 상세정보를 불러오는 메소드 (르그인 유저의 현황도 함께)
	GeneralVote selectOneGeneralVoteInfo(int voteSeq);
	//로그인유저의 현황을 불러오는 메소드
	VoteList selectOneGeneralVoteUserInfo(VoteList info);
	//선택한 선거의 후보 리스트를 불러오는 메소드
	ArrayList selectAllCandidateList(int voteSeq);
	//해당 투표의 수정내역 update하는 메소드
	int updateGeneralVote(VotePrtcpt vp, int gnrVoteCndtEnrollSeq);
	//해당 투표의 수정내역 insert하는 메소드
	int insertGeneralVote(VotePrtcpt vp, int gnrVoteCndtEnrollSeq);
	//선택한 선거의 상세정보를 불러오는 메소드 (선거)
	ElectionVote selectOneElectionVoteInfo(int voteSeq);
	//로그인유저의 현황을 불러오는 메소드 (선거)
	VoteList selectOneElectionVoteUserInfo(VoteList info);
	//선택한 선거의 후보 리스트를 불러오는 메소드 (선거)
	ArrayList selectAllElectionCandidateList(int voteSeq);
	//신청서 insert 메소드
	int insertElectionCandidateApply(Image img, ElectionVoteCandidate evc, ArrayList<Career> careerArr);
	//해당 투표의 수정내역 insert하는 메소드
	int insertElectionVote(VotePrtcpt vp, int electVoteCndtSignupSeq);
	//각 후보마다 투표수 리스트 가져오는 메소드
	ArrayList<CandidatePercent> selectCandidatePercentList(ArrayList<ElectionVoteCandidate> candidateList);
	//각 후보마다 투표수 리스트 가져오는 메소드 (일반투표)
	ArrayList<CandidatePercent> selectCandidatePercentListGen(ArrayList<GeneralVoteCandidate> candidateList);


}
