package com.kh.onepart.manager.vote.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.manager.vote.model.service.ManagerVoteService;
import com.kh.onepart.manager.vote.model.vo.CandidatePercent;
import com.kh.onepart.manager.vote.model.vo.ElectionVote;
import com.kh.onepart.manager.vote.model.vo.ElectionVoteCandidate;
import com.kh.onepart.manager.vote.model.vo.GeneralVote;
import com.kh.onepart.manager.vote.model.vo.GeneralVoteCandidate;
import com.kh.onepart.resident.superintend_vote.model.service.SuperintendVoteService;

@Controller
public class ManagerVoteController {
	@Autowired
	private ManagerVoteService vs;
	@Autowired
	private SuperintendVoteService svs;

	@RequestMapping("/manager/menuVote")
	public ModelAndView menuVote(ModelAndView mv) {
		System.out.println("/menuVote");

		//현재 진행중인 선거 리스트 불러오는 메소드
		ArrayList ingVoteList = vs.selectAllIngVoteList();
		System.out.println("controller ingVoteList : " + ingVoteList);

		//일주일 이내에 종료된 선거 리스트 불러오는 메소드
		ArrayList endVoteList = vs.selectAllEndVoteList();

		//현재 선임되어있는 선관위 리스트 불러오는 메소드
		ArrayList superintendList = vs.selectAllSuperintendList();

		mv.addObject("superintendList", superintendList);
		mv.addObject("ingVoteList", ingVoteList);
		mv.addObject("endVoteList", endVoteList);
		mv.setViewName("/manager/vote/vote_main");

		return mv;
	}
	/////////////////////
	@RequestMapping("/manager/detailvote_candidate")
	public ModelAndView detailvote_candidate(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/menuVote");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));

		//선택한 선거의 상세정보를 불러오는 메소드 (선거)
		ElectionVote vote = vs.selectOneElectionVoteInfo(voteSeq);

		//선택한 선거의 후보 리스트를 불러오는 메소드 (선거)
		ArrayList<ElectionVoteCandidate> candidateList = vs.selectAllElectionCandidateList(voteSeq);

		//해당선거 투표권 명부인 갯수 가져오는 메소드
		int num1 = svs.selectCountAllElectionElectoral(voteSeq);

		//해당선거를 진행한 명부인 갯수 가녀오는 메소드
		int num2 = svs.selectCountApplyElectionElctoral(voteSeq);

		//각 후보마다 투표수 리스트 가져오는 메소드
		ArrayList<CandidatePercent> candidatePercentList = vs.selectCandidatePercentList(candidateList);

		int votePercent = (int)((double)num2 / (double)num1 * 100);
		System.out.println("result : " + votePercent);

		mv.addObject("votePercent", votePercent);
		mv.addObject("candidatePercentList", candidatePercentList);
		mv.addObject("vote2", vote);
		mv.addObject("candidateList", candidateList);
		mv.setViewName("/manager/vote/vote_detail_candidate");


		return mv;
	}
	@RequestMapping("/manager/detailvote_candidate_end")
	public ModelAndView detailvote_candidate_end(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/menuVote");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));

		//선택한 선거의 상세정보를 불러오는 메소드 (선거)
		ElectionVote vote = vs.selectOneElectionVoteInfo(voteSeq);

		//선택한 선거의 후보 리스트를 불러오는 메소드 (선거)
		ArrayList<ElectionVoteCandidate> candidateList = vs.selectAllElectionCandidateList(voteSeq);

		//해당선거 투표권 명부인 갯수 가져오는 메소드
		int num1 = svs.selectCountAllElectionElectoral(voteSeq);

		//해당선거를 진행한 명부인 갯수 가녀오는 메소드
		int num2 = svs.selectCountApplyElectionElctoral(voteSeq);

		//각 후보마다 투표수 리스트 가져오는 메소드
		ArrayList<CandidatePercent> candidatePercentList = vs.selectCandidatePercentList(candidateList);

		int votePercent = (int)((double)num2 / (double)num1 * 100);
		System.out.println("result : " + votePercent);

		mv.addObject("votePercent", votePercent);
		mv.addObject("candidatePercentList", candidatePercentList);
		mv.addObject("vote2", vote);
		mv.addObject("candidateList", candidateList);
		mv.setViewName("/manager/vote/vote_end_candidate");


		return mv;
	}
	/////////////////////
	@RequestMapping("/manager/detailvote_general")
	public ModelAndView detailvote_general(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/menuVote");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));

		//선택한 선거의 상세정보를 불러오는 메소드
		GeneralVote vote = vs.selectOneGeneralVoteInfo(voteSeq);

		//선택한 선거의 후보 리스트를 불러오는 메소드
		ArrayList<GeneralVoteCandidate> candidateList = vs.selectAllCandidateList(voteSeq);

		//해당투표 투표권 명부인 갯수 가져오는 메소드 (일반투표)
		int num1 = svs.selectCountAllGeneralElectoral(voteSeq);

		//해당투표를 진행한 명부인 갯수 가녀오는 메소드 (일반투표)
		int num2 = svs.selectCountApplyGeneralElctoral(voteSeq);

		//각 후보마다 투표수 리스트 가져오는 메소드 (일반투표)
		ArrayList<CandidatePercent> candidatePercentList = vs.selectCandidatePercentListGen(candidateList);

		//투표율 로직처리
		int votePercent = (int)((double)num2 / (double)num1 * 100);
		System.out.println("result : " + votePercent);

		mv.addObject("votePercent", votePercent);
		mv.addObject("candidatePercentList", candidatePercentList);
		mv.addObject("vote", vote);
		mv.addObject("candidateList", candidateList);
		mv.setViewName("/manager/vote/vote_detail_general");

		return mv;
	}

	@RequestMapping("/manager/detailvote_general_end")
	public ModelAndView detailvote_general_end(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/menuVote");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));

		//선택한 선거의 상세정보를 불러오는 메소드
		GeneralVote vote = vs.selectOneGeneralVoteInfo(voteSeq);

		//선택한 선거의 후보 리스트를 불러오는 메소드
		ArrayList<GeneralVoteCandidate> candidateList = vs.selectAllCandidateList(voteSeq);

		//해당투표 투표권 명부인 갯수 가져오는 메소드 (일반투표)
		int num1 = svs.selectCountAllGeneralElectoral(voteSeq);

		//해당투표를 진행한 명부인 갯수 가녀오는 메소드 (일반투표)
		int num2 = svs.selectCountApplyGeneralElctoral(voteSeq);

		//각 후보마다 투표수 리스트 가져오는 메소드 (일반투표)
		ArrayList<CandidatePercent> candidatePercentList = vs.selectCandidatePercentListGen(candidateList);

		//투표율 로직처리
		int votePercent = (int)((double)num2 / (double)num1 * 100);
		System.out.println("result : " + votePercent);

		mv.addObject("votePercent", votePercent);
		mv.addObject("candidatePercentList", candidatePercentList);
		mv.addObject("vote", vote);
		mv.addObject("candidateList", candidateList);
		mv.setViewName("/manager/vote/vote_end_general");

		return mv;
	}

	@RequestMapping("/manager/endvote_candidate")
	public String endvote_candidate() {
		System.out.println("/menuVote");
		return "/manager/vote/vote_end_candidate";
	}

	@RequestMapping("/manager/endvote_general")
	public String endvote_general() {
		System.out.println("/menuVote");
		return "/manager/vote/vote_end_general";
	}

	@RequestMapping("/manager/delegationSuperintend")
	public ModelAndView delegationSuperintend(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/menuVote");

		//현재 선임되어있는 선관위 리스트 불러오는 메소드
		ArrayList superintendList = vs.selectAllSuperintendList();

		mv.addObject("superintendList", superintendList);
		mv.setViewName("/manager/vote/vote_delegation_superintend");

		return mv;
	}

	@RequestMapping("/manager/deleteSuperientend")
	public ModelAndView deleteSuperientend(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/menuVote");
		int residentSeq = Integer.parseInt(request.getParameter("residentSeq"));

		//해당 입주민 선관위 해임처리 하는 메소드
		int result = vs.deleteSuperiented(residentSeq);

		//현재 선임되어있는 선관위 리스트 불러오는 메소드
		ArrayList superintendList = vs.selectAllSuperintendList();

		mv.addObject("superintendList", superintendList);
		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping("/manager/insertSuperientend")
	public ModelAndView insertSuperientend(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/menuVote");
		int residentSeq = Integer.parseInt(request.getParameter("residentSeq"));
		String choiceKind = request.getParameter("choiceKind");

		if(choiceKind.equals("위원장")) {
			//위원장 선임 메소드
			int result = vs.updateNewSuperientedFirst(residentSeq);
		}else {
			//위원 선임 메소드
			int result = vs.updateNewSuperientedSecond(residentSeq);
		}

		//현재 선임되어있는 선관위 리스트 불러오는 메소드
		ArrayList superintendList = vs.selectAllSuperintendList();

		mv.addObject("superintendList", superintendList);
		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping("/manager/confirmSuperientendMember")
	public ModelAndView confirmSuperientendMember(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/menuVote");

		//선임된 위원장 count 메소드
		int resultNum = vs.selectConfirmSuperientendMember();

		mv.addObject("resultNum", resultNum);
		mv.setViewName("jsonView");

		return mv;
	}
}
