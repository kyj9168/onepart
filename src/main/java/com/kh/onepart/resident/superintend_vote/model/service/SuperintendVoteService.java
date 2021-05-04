package com.kh.onepart.resident.superintend_vote.model.service;

import java.util.ArrayList;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.superintend_vote.model.vo.ApartDetailInfo;
import com.kh.onepart.resident.superintend_vote.model.vo.CandidatePercent;
import com.kh.onepart.resident.superintend_vote.model.vo.ElectionVote;
import com.kh.onepart.resident.superintend_vote.model.vo.ElectionVoteCandidate;
import com.kh.onepart.resident.superintend_vote.model.vo.GeneralVote;
import com.kh.onepart.resident.superintend_vote.model.vo.GeneralVoteBdNm;
import com.kh.onepart.resident.superintend_vote.model.vo.GeneralVoteCandidate;
import com.kh.onepart.resident.superintend_vote.model.vo.VotePrtcpt;
import com.kh.onepart.resident.superintend_vote.model.vo.VoteSelected;

public interface SuperintendVoteService {
	//투표정보 insert 하는 메소드
	int insertGeneralVote(GeneralVote gv, ArrayList<GeneralVoteBdNm> bdNmList, ArrayList<GeneralVoteCandidate> candidateList);
	//선거정보 insert하는 메소드
	int insertElectionVote(ElectionVote ev);
	//현재 진행중인 선거 리스트 불러오는 메소드
	ArrayList selectAllIngVoteList();
	//일주일 이내에 종료된 선거 리스트 불러오는 메소드
	ArrayList selectAllEndVoteList();
	//해당 선거 정보 담아오는 메소드
	ElectionVote selectOneElectionVote(int voteSeq);
	//해당 선거에 등록된 후보 담아오는 메소드
	ArrayList selectAllElectionVoteCandidate(int voteSeq);
	//해당 선택동에 포함된 호 리스트 불러오는 메소드
	ArrayList selectAllHoList(int bdNm);
	//해당 선택동, 선택호 에 포함된 호 리스트 불러오는 메소드
	ArrayList selectAllNameList(ApartDetailInfo tdi);
	//해당 후보를 등록처리하고 정보 update하는 메소드
	int updateElectionVoteCandidate(ElectionVoteCandidate evc);
	//해당 투표 정보 담아오는 메소드
	GeneralVote selectOneGeneralVote(int voteSeq);
	//해당 투표에 등록된 후보 담아오는 메소드
	ArrayList selectAllGeneralVoteCandidate(int voteSeq);
	//입력받은 정보의 거주자가 있는지 확인하는 메소드
	int selectConfirmResident(ResidentVO rs);
	//해당 선거에 등록된 후보신청서 리스트 담아오는 메소드
	ArrayList selectAllElectionVoteCandidateApply(int electVoteSeq);
	//해당 신청서 세부내역 담아오는 메소드
	ElectionVoteCandidate selectOneElectionVoteCandidate(int electVoteCndtSignupSeq);
	//해당 신청서 경력사항 리스트 담아오는 메소드
	ArrayList selectAllElectionVoteCadidateCareer(int electVoteCndtSignupSeq);
	//선거 참여내역 확인하는 메소드
	int selectConfirmHistoryElectionVote(VotePrtcpt vp);
	//일반투표 참여내역 확인하는 메소드
	int selectConfirmHistoryGeneralVote(VotePrtcpt vp);
	//선거내역 insert하는 메소드
	int insertRealVoteElection(VotePrtcpt vp, VoteSelected vs);
	//일반투표 insert하는 메소드
	int insertRealVoteGeneral(VotePrtcpt vp, VoteSelected vs);
	//해당 선거에 투표권이 있는 선거인 명부 리스트 가져오는 메소드
	ArrayList selectAllElectionElectoralList(int electVoteSeq);
	//해당 투표에 투표권이 있는 선거인 명부 리스트 가져오는 메소드
	ArrayList selectAllGeneralElectoralList(int electVoteSeq);
	//해당선거 투표권 명부인 갯수 가져오는 메소드
	int selectCountAllElectionElectoral(int voteSeq);
	//해당선거를 진행한 명부인 갯수 가녀오는 메소드
	int selectCountApplyElectionElctoral(int voteSeq);
	//해당투표 투표권 명부인 갯수 가져오는 메소드
	int selectCountAllGeneralElectoral(int voteSeq);
	//해당투표를 진행한 명부인 갯수 가녀오는 메소드 (일반투표)
	int selectCountApplyGeneralElctoral(int voteSeq);
	//각 후보마다 투표수 리스트 가져오는 메소드
	ArrayList selectCandidatePercentList(ArrayList<ElectionVoteCandidate> candidateList);
	//각 후보마다 투표수 리스트 가져오는 메소드 (일반투표)
	ArrayList<CandidatePercent> selectCandidatePercentListGen(ArrayList<GeneralVoteCandidate> candidateListGen);

}
