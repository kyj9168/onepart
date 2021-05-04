package com.kh.onepart.resident.superintend_vote.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.superintend_vote.model.vo.ApartDetailInfo;
import com.kh.onepart.resident.superintend_vote.model.vo.CandidatePercent;
import com.kh.onepart.resident.superintend_vote.model.vo.ElectionVote;
import com.kh.onepart.resident.superintend_vote.model.vo.ElectionVoteCandidate;
import com.kh.onepart.resident.superintend_vote.model.vo.ElectoralRegister;
import com.kh.onepart.resident.superintend_vote.model.vo.GeneralVote;
import com.kh.onepart.resident.superintend_vote.model.vo.GeneralVoteBdNm;
import com.kh.onepart.resident.superintend_vote.model.vo.GeneralVoteCandidate;
import com.kh.onepart.resident.superintend_vote.model.vo.VotePrtcpt;
import com.kh.onepart.resident.superintend_vote.model.vo.VoteSelected;

public interface SuperintendVoteDao {
	//투표테이블 insert 메소드 (return gnrVoteSeq)
	int insertGeneralVote(SqlSessionTemplate sqlSession, GeneralVote gv);
	//동 투표일때 통투표 테이블 insert 메소드
	int insertGeneralVoteBdNm(SqlSessionTemplate sqlSession, GeneralVoteBdNm generalVoteBdNm);
	//해당 투표 후보정보 후보테이블 insert 메소드
	int insertGeneralVoteCandidate(SqlSessionTemplate sqlSession, GeneralVoteCandidate generalVoteCandidate);
	//선거정보 insert하는 메소드
	int insertElectionVote(SqlSessionTemplate sqlSession, ElectionVote ev);
	//현재 진행중인 선거 리스트 불러오는 메소드
	ArrayList selectAllIngVoteList(SqlSessionTemplate sqlSession);
	//일주일 이내에 종료된 선거 리스트 불러오는 메소드
	ArrayList selectAllEndVoteList(SqlSessionTemplate sqlSession);
	//해당 선거 정보 담아오는 메소드
	ElectionVote selectOneElectionVote(SqlSessionTemplate sqlSession, int voteSeq);
	//해당 선거에 등록된 후보 담아오는 메소드
	ArrayList selectAllElectionVoteCandidate(SqlSessionTemplate sqlSession, int voteSeq);
	//해당 선택동에 포함된 호 리스트 불러오는 메소드
	ArrayList selectAllHoList(SqlSessionTemplate sqlSession, int bdNm);
	//해당 선택동, 선택호 에 포함된 호 리스트 불러오는 메소드
	ArrayList selectAllNameList(SqlSessionTemplate sqlSession, ApartDetailInfo tdi);
	//해당 후보를 등록처리하고 정보 update하는 메소드
	int updateElectionVoteCandidate(SqlSessionTemplate sqlSession, ElectionVoteCandidate evc);
	//해당 선거의 후보신청 고유번호를 받아오는 메소드
	int selectUserElectVoteCndtSignupSeq(SqlSessionTemplate sqlSession, ElectionVoteCandidate evc);
	//해당 투표 정보 담아오는 메소드
	GeneralVote selectOneGeneralVote(SqlSessionTemplate sqlSession, int voteSeq);
	//해당 투표에 등록된 후보 담아오는 메소드
	ArrayList selectAllGeneralVoteCandidate(SqlSessionTemplate sqlSession, int voteSeq);
	//입력받은 정보의 거주자가 있는지 확인하는 메소드
	int selectConfirmResident(SqlSessionTemplate sqlSession, ResidentVO rs);
	//일반 세대주 vs 복수 세대주 구분하는 메소드
	int selectKindResident(SqlSessionTemplate sqlSession, ResidentVO rs);
	//복수 세대주 중 투표권을 가지고 있는 세대주 매치하는 메소드
	int selectConfirmResidents(SqlSessionTemplate sqlSession, ResidentVO rs);
	//해당 선거에 등록된 후보신청서 리스트 담아오는 메소드
	ArrayList selectAllElectionVoteCandidateApply(SqlSessionTemplate sqlSession, int electVoteSeq);
	//해당 신청서 세부내역 담아오는 메소드
	ElectionVoteCandidate selectOneElectionVoteCandidate(SqlSessionTemplate sqlSession, int electVoteCndtSignupSeq);
	//해당 신청서 경력사항 리스트 담아오는 메소드
	ArrayList selectAllElectionVoteCadidateCareer(SqlSessionTemplate sqlSession, int electVoteCndtSignupSeq);
	//선거 참여내역 확인하는 메소드
	int selectConfirmHistoryElectionVote(SqlSessionTemplate sqlSession, VotePrtcpt vp);
	//일반투표 참여내역 확인하는 메소드
	int selectConfirmHistoryGeneralVote(SqlSessionTemplate sqlSession, VotePrtcpt vp);
	//선거 참여내역 insert하는 메소드 (return votePrtcptSeq)
	int insertRealVoteElection(SqlSessionTemplate sqlSession, VotePrtcpt vp);
	//해당 선거 참여내역의 선택 후보 insert하는 메소드
	int insertRealVoteElectionCandidate(SqlSessionTemplate sqlSession, VoteSelected vs);
	//일반투표 참여내역 insert하는 메소드 (return votePrtcptSeq)
	int insertRealVoteGeneral(SqlSessionTemplate sqlSession, VotePrtcpt vp);
	//해당 일반투표 참여내역의 선택 후보 insert하는 메소드
	int insertRealVoteGeneralCandidate(SqlSessionTemplate sqlSession, VoteSelected vs);
	//해당 선거의 구분 (동별/모든세대주) 가져오는 메소드
	ElectoralRegister selectElectionStatus(SqlSessionTemplate sqlSession, int electVoteSeq);
	//모든 세대주 명부 가져오는 메소드
	ArrayList selectAllElectoralRegister(SqlSessionTemplate sqlSession, int electVoteSeq);
	//동별 세대주 명부 가져오는 메소드
	ArrayList selectDongElectoralRegister(SqlSessionTemplate sqlSession, ElectoralRegister er);
	//해당 투표의 구분 (동별/모든세대주) 가져오는 메소드
	ElectoralRegister selectGenaralStatus(SqlSessionTemplate sqlSession, int electVoteSeq);
	//투표권 부여할 동 리스트 가져오는 메소드
	ArrayList selectAllDongList(SqlSessionTemplate sqlSession, int electVoteSeq);
	//동별 세대주 명부 가져오는 메소드 (다중동 포함)
	ArrayList selectDongGeneralRegister(SqlSessionTemplate sqlSession, Map<String, Object> map);
	//모든 세대주 명부 갯수 가져오는 메소드
	int selectCountAllElectoralRegister(SqlSessionTemplate sqlSession, int voteSeq);
	//동별 세대주 명부 갯수 가져오는 메소드
	int selectCountDongElectoralRegister(SqlSessionTemplate sqlSession, ElectoralRegister er);
	//모든 세대주 명부중 선거를 진행한 세대주 갯수 가져오는 메소드
	int selectCountApplyElectoralRegister(SqlSessionTemplate sqlSession, int voteSeq);
	//동별 세대주 명부 갯수 가져오는 메소드 (일반투표)
	int selectCountDongElectoralRegisterGenarl(SqlSessionTemplate sqlSession, Map<String, Object> map);
	//해당투표를 진행한 명부인 갯수 가녀오는 메소드 (일반투표)
	int selectCountApplyGeneralElctoral(SqlSessionTemplate sqlSession, int voteSeq);
	//각 후보별 투표수 담아오는 메소드
	CandidatePercent selectCandidatePercentList(SqlSessionTemplate sqlSession,
			ElectionVoteCandidate electionVoteCandidate);
	//각 후보별 투표수 담아오는 메소드
	CandidatePercent selectCandidatePercentListGen(SqlSessionTemplate sqlSession,
			GeneralVoteCandidate generalVoteCandidate);


}
