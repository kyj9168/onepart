package com.kh.onepart.resident.superintend_vote.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.superintend_vote.model.dao.SuperintendVoteDao;
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

@Service
public class SuperintendVoteServiceImpl implements SuperintendVoteService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SuperintendVoteDao svd;

	//투표정보 insert 하는 메소드
	@Override
	public int insertGeneralVote(GeneralVote gv, ArrayList<GeneralVoteBdNm> bdNmList, ArrayList<GeneralVoteCandidate> candidateList) {

		//투표테이블 insert 메소드 (return gnrVoteSeq)
		int gnrVoteSeq = svd.insertGeneralVote(sqlSession, gv);
		System.out.println("service gnrVoteSeq : " + gnrVoteSeq);

		//동 투표일때 통투표 테이블 insert 메소드
		if(gv.getGnrVoteGrant() == 2) {
			for(int i = 0 ; i < bdNmList.size(); i++) {
				bdNmList.get(i).setGnrVoteSeq(gnrVoteSeq);
				int result = svd.insertGeneralVoteBdNm(sqlSession, bdNmList.get(i));
			}
		}

		//해당 투표 후보정보 후보테이블 insert 메소드
		for(int i = 0; i < candidateList.size(); i++) {
			candidateList.get(i).setGnrVoteSeq(gnrVoteSeq);
			int result = svd.insertGeneralVoteCandidate(sqlSession, candidateList.get(i));
		}

		return gnrVoteSeq;
	}
	//선거정보 insert하는 메소드
	@Override
	public int insertElectionVote(ElectionVote ev) {

		int result = svd.insertElectionVote(sqlSession, ev);

		return result;

	}
	//현재 진행중인 선거 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllIngVoteList() {

		ArrayList ingVoteList = svd.selectAllIngVoteList(sqlSession);

		return ingVoteList;

	}
	//일주일 이내에 종료된 선거 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllEndVoteList() {

		ArrayList endVoteList = svd.selectAllEndVoteList(sqlSession);

		return endVoteList;

	}
	//해당 선거 정보 담아오는 메소드
	@Override
	public ElectionVote selectOneElectionVote(int voteSeq) {

		ElectionVote ev = svd.selectOneElectionVote(sqlSession, voteSeq);

		return ev;

	}
	//해당 선거에 등록된 후보 담아오는 메소드
	@Override
	public ArrayList selectAllElectionVoteCandidate(int voteSeq) {

		ArrayList candidateList = svd.selectAllElectionVoteCandidate(sqlSession, voteSeq);

		return candidateList;

	}
	//해당 선택동에 포함된 호 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllHoList(int bdNm) {

		ArrayList hoList = svd.selectAllHoList(sqlSession, bdNm);

		return hoList;

	}
	//해당 선택동, 선택호 에 포함된 호 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllNameList(ApartDetailInfo tdi) {

		ArrayList nameList = svd.selectAllNameList(sqlSession, tdi);

		return nameList;

	}
	//해당 후보를 등록처리하고 정보 update하는 메소드
	@Override
	public int updateElectionVoteCandidate(ElectionVoteCandidate evc) {

		//해당 선거의 후보신청 고유번호를 받아오는 메소드
		int electVoteCndtSignupSeq = svd.selectUserElectVoteCndtSignupSeq(sqlSession, evc);
		System.out.println("service electVoteCndtSignupSeq : " + electVoteCndtSignupSeq);

		//해당 후보를 등록처리하고 정보 update하는 메소드
		evc.setElectVoteCndtSignupSeq(electVoteCndtSignupSeq);
		int result = svd.updateElectionVoteCandidate(sqlSession, evc);

		return result;

	}
	//해당 투표 정보 담아오는 메소드
	@Override
	public GeneralVote selectOneGeneralVote(int voteSeq) {

		GeneralVote gv = svd.selectOneGeneralVote(sqlSession, voteSeq);

		return gv;

	}
	//해당 투표에 등록된 후보 담아오는 메소드
	@Override
	public ArrayList selectAllGeneralVoteCandidate(int voteSeq) {

		ArrayList candidateListGen = svd.selectAllGeneralVoteCandidate(sqlSession, voteSeq);

		return candidateListGen;

	}
	//입력받은 정보의 거주자가 있는지 확인하는 메소드
	@Override
	public int selectConfirmResident(ResidentVO rs) {

		//일반 세대주 vs 복수 세대주 구분하는 메소드
		int kind = svd.selectKindResident(sqlSession, rs);
		int result;

		if(kind == 0) {
			//해당동에 가입되어있는 세대주 없음
			result = 0;
		}else if(kind == 1) {
			//해당동에 가입되어있는 세대주 한명
			//일반세대주 입력이름 매치하는 메소드
			int result2 = svd.selectConfirmResident(sqlSession, rs);
			if(result2 > 0) {
				//매치됨
				result = result2;
			}else {
				//매치안됨
				result = -1;
			}
		}else {
			//해당동에 가입되어있는 세대주 여러명
			//복수 세대주 중 투표권을 가지고 있는 세대주 매치하는 메소드
			try{
				int result3 = svd.selectConfirmResidents(sqlSession, rs);
				System.out.println("result3 : " + result3);
				//매치됨
				result = result3;
			}catch(NullPointerException e){
				//매치안됨
				result = -1;
			}
		}

		return result;

	}
	//해당 선거에 등록된 후보신청서 리스트 담아오는 메소드
	@Override
	public ArrayList selectAllElectionVoteCandidateApply(int electVoteSeq) {

		ArrayList candidateApplyList = svd.selectAllElectionVoteCandidateApply(sqlSession, electVoteSeq);

		return candidateApplyList;

	}
	//해당 신청서 세부내역 담아오는 메소드
	@Override
	public ElectionVoteCandidate selectOneElectionVoteCandidate(int electVoteCndtSignupSeq) {

		ElectionVoteCandidate evc = svd.selectOneElectionVoteCandidate(sqlSession, electVoteCndtSignupSeq);

		return evc;

	}
	//해당 신청서 경력사항 리스트 담아오는 메소드
	@Override
	public ArrayList selectAllElectionVoteCadidateCareer(int electVoteCndtSignupSeq) {

		ArrayList careerList = svd.selectAllElectionVoteCadidateCareer(sqlSession, electVoteCndtSignupSeq);

		return careerList;

	}
	//선거 참여내역 확인하는 메소드
	@Override
	public int selectConfirmHistoryElectionVote(VotePrtcpt vp) {

		int result = svd.selectConfirmHistoryElectionVote(sqlSession, vp);

		return result;

	}
	//일반투표 참여내역 확인하는 메소드
	@Override
	public int selectConfirmHistoryGeneralVote(VotePrtcpt vp) {

		int result = svd.selectConfirmHistoryGeneralVote(sqlSession, vp);

		return result;

	}
	//선거내역 insert하는 메소드
	@Override
	public int insertRealVoteElection(VotePrtcpt vp, VoteSelected vs) {

		//선거 참여내역 insert하는 메소드 (return votePrtcptSeq)
		int votePrtcptSeq = svd.insertRealVoteElection(sqlSession, vp);

		//해당 선거 참여내역의 선택 후보 insert하는 메소드
		vs.setVotePrtcptSeq(votePrtcptSeq);
		int result = svd.insertRealVoteElectionCandidate(sqlSession, vs);

		return result;

	}
	//일반투표 insert하는 메소드
	@Override
	public int insertRealVoteGeneral(VotePrtcpt vp, VoteSelected vs) {

		//일반투표 참여내역 insert하는 메소드 (return votePrtcptSeq)
		int votePrtcptSeq = svd.insertRealVoteGeneral(sqlSession, vp);

		//해당 일반투표 참여내역의 선택 후보 insert하는 메소드
		vs.setVotePrtcptSeq(votePrtcptSeq);
		int result = svd.insertRealVoteGeneralCandidate(sqlSession, vs);

		return result;

	}
	//해당 선거에 투표권이 있는 선거인 명부 리스트 가져오는 메소드
	@Override
	public ArrayList selectAllElectionElectoralList(int electVoteSeq) {

		//해당 선거의 구분 (동별/모든세대주) 가져오는 메소드
		ElectoralRegister status = svd.selectElectionStatus(sqlSession, electVoteSeq);
		System.out.println("service status.getStatus() : " + status.getStatus());
		ArrayList electoralList = null;
		if(status.getStatus().equals("세대주")) {
			//모든 세대주 명부 가져오는 메소드
			electoralList = svd.selectAllElectoralRegister(sqlSession, electVoteSeq);
		}else {
			//동별 세대주 명부 가져오는 메소드
			ElectoralRegister er = new ElectoralRegister();
			er.setElectVoteSeq(electVoteSeq);
			er.setStatus(status.getStatus());
			electoralList = svd.selectDongElectoralRegister(sqlSession, er);
		}


		return electoralList;
	}
	//해당 투표에 투표권이 있는 선거인 명부 리스트 가져오는 메소드
	@Override
	public ArrayList selectAllGeneralElectoralList(int electVoteSeq) {

		//해당 투표의 구분 (동별/모든세대주) 가져오는 메소드
		ElectoralRegister status = svd.selectGenaralStatus(sqlSession, electVoteSeq);
		System.out.println("service status.getStatus() : " + status.getStatus());
		ArrayList electoralList = null;
		if(status.getStatus().equals("세대주")) {
			//모든 세대주 명부 가져오는 메소드
			electoralList = svd.selectAllElectoralRegister(sqlSession, electVoteSeq);
		}else {
			//투표권 부여할 동 리스트 가져오는 메소드
			ArrayList<GeneralVoteBdNm> dongList = svd.selectAllDongList(sqlSession, electVoteSeq);
			System.out.println(dongList);
			ArrayList realDongList = new ArrayList();
			for(int i = 0; i < dongList.size(); i++) {
				realDongList.add(dongList.get(i).getBdNm());
			}

			//동별 세대주 명부 가져오는 메소드 (다중동 포함)
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("electVoteSeq", electVoteSeq);
			map.put("dongList", realDongList);
			System.out.println("service map : " + map);
			electoralList = svd.selectDongGeneralRegister(sqlSession, map);
		}


		return electoralList;

	}
	//해당선거 투표권 명부인 갯수 가져오는 메소드
	@Override
	public int selectCountAllElectionElectoral(int voteSeq) {

		int electVoteSeq = voteSeq;

		//해당 선거의 구분 (동별/모든세대주) 가져오는 메소드
		ElectoralRegister status = svd.selectElectionStatus(sqlSession, electVoteSeq);
		System.out.println("service status.getStatus() : " + status.getStatus());
		int num1 = 0;
		if(status.getStatus().equals("세대주")) {
			//모든 세대주 명부 갯수 가져오는 메소드
			num1 = svd.selectCountAllElectoralRegister(sqlSession, voteSeq);
		}else {
			//동별 세대주 명부 갯수 가져오는 메소드
			ElectoralRegister er = new ElectoralRegister();
			er.setElectVoteSeq(electVoteSeq);
			er.setStatus(status.getStatus());
			num1 = svd.selectCountDongElectoralRegister(sqlSession, er);
		}


		return num1;

	}
	//해당선거를 진행한 명부인 갯수 가녀오는 메소드
	@Override
	public int selectCountApplyElectionElctoral(int voteSeq) {

		int	num1 = svd.selectCountApplyElectoralRegister(sqlSession, voteSeq);

		return num1;

	}
	//해당투표 투표권 명부인 갯수 가져오는 메소드 (일반투표)
	@Override
	public int selectCountAllGeneralElectoral(int voteSeq) {

		int electVoteSeq = voteSeq;

		//해당 선거의 구분 (동별/모든세대주) 가져오는 메소드
		ElectoralRegister status = svd.selectGenaralStatus(sqlSession, electVoteSeq);
		System.out.println("service status.getStatus() : " + status.getStatus());
		int num1 = 0;
		if(status.getStatus().equals("세대주")) {
			//모든 세대주 명부 갯수 가져오는 메소드
			num1 = svd.selectCountAllElectoralRegister(sqlSession, voteSeq);
		}else {
			//투표권 부여할 동 리스트 가져오는 메소드
			ArrayList<GeneralVoteBdNm> dongList = svd.selectAllDongList(sqlSession, electVoteSeq);
			System.out.println(dongList);
			ArrayList realDongList = new ArrayList();
			for(int i = 0; i < dongList.size(); i++) {
				realDongList.add(dongList.get(i).getBdNm());
			}

			//동별 세대주 명부 갯수 가져오는 메소드 (일반투표)
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("electVoteSeq", electVoteSeq);
			map.put("dongList", realDongList);
			System.out.println("service map : " + map);
			num1 = svd.selectCountDongElectoralRegisterGenarl(sqlSession, map);
		}


		return num1;
	}
	//해당투표를 진행한 명부인 갯수 가녀오는 메소드 (일반투표)
	@Override
	public int selectCountApplyGeneralElctoral(int voteSeq) {

		int	num1 = svd.selectCountApplyGeneralElctoral(sqlSession, voteSeq);

		return num1;

	}
	//각 후보마다 투표수 리스트 가져오는 메소드
	@Override
	public ArrayList selectCandidatePercentList(ArrayList<ElectionVoteCandidate> candidateList) {

		ArrayList<CandidatePercent> candidatePercentList = new ArrayList();

		for(int i = 0; i < candidateList.size(); i++) {
			//각 후보별 투표수 담아오는 메소드
			CandidatePercent percent = svd.selectCandidatePercentList(sqlSession, candidateList.get(i));
			candidatePercentList.add(percent);
		}

		return candidatePercentList;

	}
	//각 후보마다 투표수 리스트 가져오는 메소드 (일반투표)
	@Override
	public ArrayList<CandidatePercent> selectCandidatePercentListGen(ArrayList<GeneralVoteCandidate> candidateListGen) {

		ArrayList<CandidatePercent> candidatePercentList = new ArrayList();

		for(int i = 0; i < candidateListGen.size(); i++) {
			//각 후보별 투표수 담아오는 메소드
			CandidatePercent percent = svd.selectCandidatePercentListGen(sqlSession, candidateListGen.get(i));
			candidatePercentList.add(percent);
		}

		return candidatePercentList;

	}
}
