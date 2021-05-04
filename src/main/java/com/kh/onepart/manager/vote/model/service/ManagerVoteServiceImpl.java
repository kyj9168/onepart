package com.kh.onepart.manager.vote.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.common.PageInfo;
import com.kh.onepart.manager.vote.model.dao.ManagerVoteDao;
import com.kh.onepart.manager.vote.model.vo.GeneralVote;
import com.kh.onepart.manager.vote.model.vo.GeneralVoteCandidate;
import com.kh.onepart.manager.vote.model.vo.CandidatePercent;
import com.kh.onepart.manager.vote.model.vo.ElectionVote;
import com.kh.onepart.manager.vote.model.vo.ElectionVoteCandidate;


@Service
public class ManagerVoteServiceImpl implements ManagerVoteService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ManagerVoteDao vd;

	//현재 진행중인 선거 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllIngVoteList() {

		ArrayList ingVoteList = vd.selectAllIngVoteList(sqlSession);

		return ingVoteList;

	}
	//일주일 이내에 종료된 선거 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllEndVoteList() {

		ArrayList endVoteList = vd.selectAllEndVoteList(sqlSession);

		return endVoteList;

	}
	//선택한 선거의 상세정보를 불러오는 메소드
	@Override
	public GeneralVote selectOneGeneralVoteInfo(int voteSeq) {

		GeneralVote vote = vd.selectOneGeneralVoteInfo(sqlSession, voteSeq);

		return vote;

	}
	//선택한 선거의 후보 리스트를 불러오는 메소드
	@Override
	public ArrayList selectAllCandidateList(int voteSeq) {

		ArrayList candidateList = vd.selectAllCandidateList(sqlSession, voteSeq);

		return candidateList;

	}
	//선택한 선거의 상세정보를 불러오는 메소드 (선거)
	@Override
	public ElectionVote selectOneElectionVoteInfo(int voteSeq) {

		ElectionVote vote = vd.selectOneElectionVoteInfo(sqlSession, voteSeq);

		return vote;

	}
	//선택한 선거의 후보 리스트를 불러오는 메소드 (선거)
	@Override
	public ArrayList selectAllElectionCandidateList(int voteSeq) {

		ArrayList candidateList = vd.selectAllElectionCandidateList(sqlSession, voteSeq);

		return candidateList;

	}
	//현재 선임되어있는 선관위 리스트 불러오는 메소드
	@Override
	public ArrayList selectAllSuperintendList() {

		ArrayList superintendList = vd.selectAllSuperintendList(sqlSession);

		return superintendList;

	}
	//해당 입주민 선관위 해임처리 하는 메소드
	@Override
	public int deleteSuperiented(int residentSeq) {

		int result = vd.deleteSuperiented(sqlSession, residentSeq);

		return result;

	}
	//위원장 선임 메소드
	@Override
	public int updateNewSuperientedFirst(int residentSeq) {

		int result = vd.updateNewSuperientedFirst(sqlSession, residentSeq);

		return result;

	}
	//위원 선임 메소드
	@Override
	public int updateNewSuperientedSecond(int residentSeq) {

		int result = vd.updateNewSuperientedSecond(sqlSession, residentSeq);

		return result;

	}
	//선임된 위원장 count 메소드
	@Override
	public int selectConfirmSuperientendMember() {

		int resultNum = vd.selectConfirmSuperientendMember(sqlSession);

		return resultNum;

	}
	//각 후보마다 투표수 리스트 가져오는 메소드
	@Override
	public ArrayList<CandidatePercent> selectCandidatePercentList(ArrayList<ElectionVoteCandidate> candidateList) {

		ArrayList<CandidatePercent> candidatePercentList = new ArrayList();

		for(int i = 0; i < candidateList.size(); i++) {
			//각 후보별 투표수 담아오는 메소드
			CandidatePercent percent = vd.selectCandidatePercentList(sqlSession, candidateList.get(i));
			candidatePercentList.add(percent);
		}

		return candidatePercentList;

	}
	//각 후보마다 투표수 리스트 가져오는 메소드 (일반투표)
	@Override
	public ArrayList<CandidatePercent> selectCandidatePercentListGen(ArrayList<GeneralVoteCandidate> candidateList) {

		ArrayList<CandidatePercent> candidatePercentList = new ArrayList();

		for(int i = 0; i < candidateList.size(); i++) {
			//각 후보별 투표수 담아오는 메소드
			CandidatePercent percent = vd.selectCandidatePercentListGen(sqlSession, candidateList.get(i));
			candidatePercentList.add(percent);
		}

		return candidatePercentList;

	}

	//현재 진행중인 선거 카운트 불러오는 메소드
	@Override
	public int selectAllIngVoteCount() {
		return vd.selectAllIngVoteCount(sqlSession);
	}

	//현재 진행중인 선거 리스트 불러오는 메소드 - 페이징 버전
	@Override
	public ArrayList selectAllIngVoteListVerPaging(PageInfo pi) {
		return vd.selectAllIngVoteListVerPaging(sqlSession, pi);
	}

}
