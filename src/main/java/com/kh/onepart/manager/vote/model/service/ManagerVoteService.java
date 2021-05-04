package com.kh.onepart.manager.vote.model.service;

import java.util.ArrayList;

import com.kh.onepart.manager.vote.model.vo.GeneralVote;
import com.kh.onepart.manager.vote.model.vo.GeneralVoteCandidate;
import com.kh.onepart.manager.vote.model.vo.CandidatePercent;
import com.kh.onepart.common.PageInfo;
import com.kh.onepart.manager.vote.model.vo.ElectionVote;
import com.kh.onepart.manager.vote.model.vo.ElectionVoteCandidate;



public interface ManagerVoteService {
	//현재 진행중인 선거 리스트 불러오는 메소드
	ArrayList selectAllIngVoteList();
	//일주일 이내에 종료된 선거 리스트 불러오는 메소드
	ArrayList selectAllEndVoteList();
	//선택한 선거의 상세정보를 불러오는 메소드
	GeneralVote selectOneGeneralVoteInfo(int voteSeq);
	//선택한 선거의 후보 리스트를 불러오는 메소드
	ArrayList selectAllCandidateList(int voteSeq);
	//선택한 선거의 상세정보를 불러오는 메소드
	ElectionVote selectOneElectionVoteInfo(int voteSeq);
	//선택한 선거의 후보 리스트를 불러오는 메소드 (선거)
	ArrayList selectAllElectionCandidateList(int voteSeq);
	//현재 선임되어있는 선관위 리스트 불러오는 메소드
	ArrayList selectAllSuperintendList();
	//해당 입주민 선관위 해임처리 하는 메소드
	int deleteSuperiented(int residentSeq);
	//위원장 선임 메소드
	int updateNewSuperientedFirst(int residentSeq);
	//위원 선임 메소드
	int updateNewSuperientedSecond(int residentSeq);
	//선임된 위원장 count 메소드
	int selectConfirmSuperientendMember();
	//각 후보마다 투표수 리스트 가져오는 메소드
	ArrayList<CandidatePercent> selectCandidatePercentList(ArrayList<ElectionVoteCandidate> candidateList);
	//각 후보마다 투표수 리스트 가져오는 메소드 (일반투표)
	ArrayList<CandidatePercent> selectCandidatePercentListGen(ArrayList<GeneralVoteCandidate> candidateList);
	//현재 진행중인 선거 카운트 불러오는 메소드
	int selectAllIngVoteCount();
	//현재 진행중인 선거 리스트 불러오는 메소드 - 페이징 버전
	ArrayList selectAllIngVoteListVerPaging(PageInfo pi);


}
