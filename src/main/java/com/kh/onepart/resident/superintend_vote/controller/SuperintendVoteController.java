package com.kh.onepart.resident.superintend_vote.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.superintend_vote.model.service.SuperintendVoteService;
import com.kh.onepart.resident.superintend_vote.model.vo.ApartDetailInfo;
import com.kh.onepart.resident.superintend_vote.model.vo.CandidatePercent;
import com.kh.onepart.resident.superintend_vote.model.vo.ElectionVote;
import com.kh.onepart.resident.superintend_vote.model.vo.ElectionVoteCandidate;
import com.kh.onepart.resident.superintend_vote.model.vo.GeneralVote;
import com.kh.onepart.resident.superintend_vote.model.vo.GeneralVoteBdNm;
import com.kh.onepart.resident.superintend_vote.model.vo.GeneralVoteCandidate;
import com.kh.onepart.resident.superintend_vote.model.vo.VotePrtcpt;
import com.kh.onepart.resident.superintend_vote.model.vo.VoteSelected;

@Controller
public class SuperintendVoteController {
	@Autowired
	private SuperintendVoteService svs;

	@RequestMapping("/resident/menuSuperintendVote")
	public ModelAndView menuSuperintendVote(ModelAndView mv) {
		System.out.println("/menuSuperintendVote");

		//현재 진행중인 선거 리스트 불러오는 메소드
		ArrayList ingVoteList = svs.selectAllIngVoteList();
		System.out.println("controller ingVoteList : " + ingVoteList);

		//일주일 이내에 종료된 선거 리스트 불러오는 메소드
		ArrayList endVoteList = svs.selectAllEndVoteList();

		mv.addObject("ingVoteList", ingVoteList);
		mv.addObject("endVoteList", endVoteList);
		mv.setViewName("/resident/superintend_vote/superintend_vote/superintend_vote_main");

		return mv;
	}

	@RequestMapping(value="/resident/superintend_vote_registration_main")
	public ModelAndView votingCandidate(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/menuSuperintendVote");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));
		System.out.println("controller voteSeq : " + voteSeq);

		//해당 선거 정보 담아오는 메소드
		ElectionVote ev = svs.selectOneElectionVote(voteSeq);
		System.out.println("controller ev : " + ev);

		//해당 선거에 등록된 후보 담아오는 메소드
		ArrayList candidateList = svs.selectAllElectionVoteCandidate(voteSeq);

		mv.addObject("candidateList", candidateList);
		mv.addObject("ev", ev);
		mv.setViewName("/resident/superintend_vote/superintend_vote/superintend_vote_registration_main");

		return mv;
	}

	@RequestMapping(value="/resident/superintend_vote_exercise_main")
	public ModelAndView superintend_vote_exercise_main(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/menuSuperintendVote");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));
		System.out.println("controller voteSeq : " + voteSeq);

		//해당 선거 정보 담아오는 메소드
		ElectionVote ev = svs.selectOneElectionVote(voteSeq);
		System.out.println("controller ev : " + ev);

		//해당 선거에 등록된 후보 담아오는 메소드
		ArrayList candidateList = svs.selectAllElectionVoteCandidate(voteSeq);

		mv.addObject("candidateList", candidateList);
		mv.addObject("ev", ev);
		mv.setViewName("/resident/superintend_vote/superintend_vote/superintend_vote_exercise_main");

		return mv;
	}

	@RequestMapping("/resident/candidateRegistration")
	public ModelAndView candidateRegistration(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/menuSuperintendVote");
		int electVoteSeq = Integer.parseInt(request.getParameter("electVoteSeq"));
		System.out.println("controller voteSeq : " + electVoteSeq);

		//해당 선거 정보 담아오는 메소드
		ElectionVote ev = svs.selectOneElectionVote(electVoteSeq);
		System.out.println("controller ev : " + ev);

		mv.addObject("ev", ev);
		mv.setViewName("/resident/superintend_vote/superintend_vote/superintend_vote_registration_candidateReg");

		return mv;
	}

	@RequestMapping("/resident/regicandidateApply")
	public ModelAndView candidateApply(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/regicandidateApply");
		int electVoteSeq = Integer.parseInt(request.getParameter("electVoteSeq"));

		//해당 선거 정보 담아오는 메소드
		ElectionVote ev = svs.selectOneElectionVote(electVoteSeq);
		System.out.println("controller ev : " + ev);

		//해당 선거에 등록된 후보신청서 리스트 담아오는 메소드
		ArrayList candidateApplyList = svs.selectAllElectionVoteCandidateApply(electVoteSeq);

		mv.addObject("ev", ev);
		mv.addObject("candidateApplyList", candidateApplyList);
		mv.setViewName("/resident/superintend_vote/superintend_vote/superintend_vote_registration_candidateApply");

		return mv;
	}

	@RequestMapping("/resident/candidateSupervise")
	public ModelAndView candidateSupervise(HttpServletRequest request, ModelAndView mv) {
		System.out.println("/candidateSupervise");
		int electVoteSeq = Integer.parseInt(request.getParameter("electVoteSeq"));
		System.out.println("controller voteSeq : " + electVoteSeq);

		//해당 선거 정보 담아오는 메소드
		ElectionVote ev = svs.selectOneElectionVote(electVoteSeq);
		System.out.println("controller ev : " + ev);

		//해당 선거에 등록된 후보 담아오는 메소드
		ArrayList<ElectionVoteCandidate> candidateList = svs.selectAllElectionVoteCandidate(electVoteSeq);

		int maxCndtNo = 0;
		if(candidateList.size() == 0) {
			maxCndtNo = 0;
		}else {
			for(int i = 0; i < candidateList.size(); i++) {
				maxCndtNo = candidateList.get(i).getCndtNo();
			}
		}

		mv.addObject("candidateList", candidateList);
		mv.addObject("ev", ev);
		mv.addObject("maxCndtNo", maxCndtNo);
		mv.setViewName("/resident/superintend_vote/superintend_vote/superintend_vote_registration_candidateSupervise");

		return mv;
	}
	///////////////////////////////////////////////
	@RequestMapping("/resident/votingRealvote")
	public ModelAndView votingRealvote(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/votingRealvote");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));
		String voteKind = request.getParameter("voteKind");
		String voteStatus = request.getParameter("voteStatus");
		System.out.println("controller voteStatus : " + voteStatus);

		if(voteKind.equals("선거")) {
			//해당 선거 정보 담아오는 메소드
			ElectionVote ev = svs.selectOneElectionVote(voteSeq);

			//해당 선거에 등록된 후보 담아오는 메소드
			ArrayList<ElectionVoteCandidate> candidateList = svs.selectAllElectionVoteCandidate(voteSeq);

			//해당선거 투표권 명부인 갯수 가져오는 메소드
			int num1 = svs.selectCountAllElectionElectoral(voteSeq);

			//해당선거를 진행한 명부인 갯수 가녀오는 메소드
			int num2 = svs.selectCountApplyElectionElctoral(voteSeq);

			//각 후보마다 투표수 리스트 가져오는 메소드
			ArrayList<CandidatePercent> candidatePercentList = svs.selectCandidatePercentList(candidateList);

			int votePercent = (int)((double)num2 / (double)num1 * 100);
			System.out.println("result : " + votePercent);

			mv.addObject("votePercent", votePercent);
			mv.addObject("candidatePercentList", candidatePercentList);
			mv.addObject("candidateList", candidateList);
			mv.addObject("ev", ev);
			mv.addObject("voteKind", voteKind);
			mv.addObject("voteStatus", voteStatus);

		}else {
			//해당 투표 정보 담아오는 메소드
			GeneralVote gv = svs.selectOneGeneralVote(voteSeq);

			//해당 투표에 등록된 후보 담아오는 메소드
			ArrayList<GeneralVoteCandidate> candidateListGen = svs.selectAllGeneralVoteCandidate(voteSeq);

			//해당투표 투표권 명부인 갯수 가져오는 메소드 (일반투표)
			int num1 = svs.selectCountAllGeneralElectoral(voteSeq);

			//해당투표를 진행한 명부인 갯수 가녀오는 메소드 (일반투표)
			int num2 = svs.selectCountApplyGeneralElctoral(voteSeq);

			//각 후보마다 투표수 리스트 가져오는 메소드 (일반투표)
			ArrayList<CandidatePercent> candidatePercentList = svs.selectCandidatePercentListGen(candidateListGen);

			//투표율 로직처리
			int votePercent = (int)((double)num2 / (double)num1 * 100);
			System.out.println("result : " + votePercent);

			mv.addObject("votePercent", votePercent);
			mv.addObject("candidatePercentList", candidatePercentList);
			mv.addObject("candidateListGen", candidateListGen);
			mv.addObject("gv", gv);
			mv.addObject("voteKind", voteKind);
			mv.addObject("voteStatus", voteStatus);

		}

		mv.setViewName("/resident/superintend_vote/superintend_vote/superintend_vote_realvote_main");

		return mv;
	}

	@RequestMapping("/resident/endRealvote")
	public ModelAndView endRealvote(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/endRealvote");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));
		String voteKind = request.getParameter("voteKind");
		String voteStatus = request.getParameter("voteStatus");
		System.out.println("controller voteStatus : " + voteStatus);

		if(voteKind.equals("선거")) {
			//해당 선거 정보 담아오는 메소드
			ElectionVote ev = svs.selectOneElectionVote(voteSeq);

			//해당 선거에 등록된 후보 담아오는 메소드
			ArrayList<ElectionVoteCandidate> candidateList = svs.selectAllElectionVoteCandidate(voteSeq);

			//해당선거 투표권 명부인 갯수 가져오는 메소드
			int num1 = svs.selectCountAllElectionElectoral(voteSeq);

			//해당선거를 진행한 명부인 갯수 가녀오는 메소드
			int num2 = svs.selectCountApplyElectionElctoral(voteSeq);

			//각 후보마다 투표수 리스트 가져오는 메소드
			ArrayList<CandidatePercent> candidatePercentList = svs.selectCandidatePercentList(candidateList);

			int votePercent = (int)((double)num2 / (double)num1 * 100);
			System.out.println("result : " + votePercent);

			mv.addObject("votePercent", votePercent);
			mv.addObject("candidatePercentList", candidatePercentList);
			mv.addObject("candidateList", candidateList);
			mv.addObject("ev", ev);
			mv.addObject("voteKind", voteKind);
			mv.addObject("voteStatus", voteStatus);

		}else {
			//해당 투표 정보 담아오는 메소드
			GeneralVote gv = svs.selectOneGeneralVote(voteSeq);

			//해당 투표에 등록된 후보 담아오는 메소드
			ArrayList<GeneralVoteCandidate> candidateListGen = svs.selectAllGeneralVoteCandidate(voteSeq);

			//해당투표 투표권 명부인 갯수 가져오는 메소드 (일반투표)
			int num1 = svs.selectCountAllGeneralElectoral(voteSeq);

			//해당투표를 진행한 명부인 갯수 가녀오는 메소드 (일반투표)
			int num2 = svs.selectCountApplyGeneralElctoral(voteSeq);

			//각 후보마다 투표수 리스트 가져오는 메소드 (일반투표)
			ArrayList<CandidatePercent> candidatePercentList = svs.selectCandidatePercentListGen(candidateListGen);

			//투표율 로직처리
			int votePercent = (int)((double)num2 / (double)num1 * 100);
			System.out.println("result : " + votePercent);

			mv.addObject("votePercent", votePercent);
			mv.addObject("candidatePercentList", candidatePercentList);
			mv.addObject("candidateListGen", candidateListGen);
			mv.addObject("gv", gv);
			mv.addObject("voteKind", voteKind);
			mv.addObject("voteStatus", voteStatus);

		}

		mv.setViewName("/resident/superintend_vote/superintend_vote/superintend_vote_endvote_main");

		return mv;
	}

	@RequestMapping("/resident/sendMessageResident")
	public ModelAndView sendMessageResident(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/sendMessageResident");
		int electVoteSeq = Integer.parseInt(request.getParameter("electVoteSeq"));
		int voteSeq = electVoteSeq;
		String voteKind = request.getParameter("voteKind");

		ArrayList electoralList = null;
		if(voteKind.equals("선거")) {
			//해당 선거 정보 담아오는 메소드
			ElectionVote ev = svs.selectOneElectionVote(electVoteSeq);

			//해당 선거에 투표권이 있는 선거인 명부 리스트 가져오는 메소드
			electoralList = svs.selectAllElectionElectoralList(electVoteSeq);

			//해당선거 투표권 명부인 갯수 가져오는 메소드
			int num1 = svs.selectCountAllElectionElectoral(voteSeq);

			//해당선거를 진행한 명부인 갯수 가녀오는 메소드
			int num2 = svs.selectCountApplyElectionElctoral(voteSeq);

			int votePercent = (int)((double)num2 / (double)num1 * 100);
			System.out.println("result : " + votePercent);

			mv.addObject("votePercent", votePercent);
			mv.addObject("ev", ev);
		}else {
			//해당 투표 정보 담아오는 메소드
			GeneralVote gv = svs.selectOneGeneralVote(electVoteSeq);

			//해당 투표에 투표권이 있는 선거인 명부 리스트 가져오는 메소드
			electoralList = svs.selectAllGeneralElectoralList(electVoteSeq);

			mv.addObject("gv", gv);
		}

		mv.addObject("electoralList", electoralList);
		mv.addObject("voteKind", voteKind);
		mv.setViewName("/resident/superintend_vote/superintend_vote/superintend_vote_realvote_sendMessage");

		return mv;
	}

	@RequestMapping("/resident/changeOffline")
	public ModelAndView changeOffline(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuSuperintendVote");
		int electVoteSeq = Integer.parseInt(request.getParameter("electVoteSeq"));
		int voteSeq = electVoteSeq;
		String voteKind = request.getParameter("voteKind");

		if(voteKind.equals("선거")) {
			//해당 선거 정보 담아오는 메소드
			ElectionVote ev = svs.selectOneElectionVote(electVoteSeq);

			//해당 선거에 등록된 후보 담아오는 메소드
			ArrayList candidateList = svs.selectAllElectionVoteCandidate(electVoteSeq);

			//해당선거 투표권 명부인 갯수 가져오는 메소드
			int num1 = svs.selectCountAllElectionElectoral(voteSeq);
			System.out.println("controller num1 : " + num1);

			//해당선거를 진행한 명부인 갯수 가녀오는 메소드
			int num2 = svs.selectCountApplyElectionElctoral(voteSeq);
			System.out.println("controller num2 : " + num2);

			//투표율 로직처리
			int votePercent = (int)((double)num2 / (double)num1 * 100);
			System.out.println("result : " + votePercent);

			mv.addObject("votePercent", votePercent);
			mv.addObject("candidateList", candidateList);
			mv.addObject("ev", ev);
			mv.addObject("voteKind", voteKind);
		}else {
			//해당 투표 정보 담아오는 메소드
			GeneralVote gv = svs.selectOneGeneralVote(electVoteSeq);

			//해당 투표에 등록된 후보 담아오는 메소드
			ArrayList candidateListGen = svs.selectAllGeneralVoteCandidate(electVoteSeq);

			mv.addObject("candidateListGen", candidateListGen);
			mv.addObject("gv", gv);
			mv.addObject("voteKind", voteKind);
		}
		String sit = "offline";
		mv.addObject("sit", sit);
		mv.setViewName("/resident/superintend_vote/superintend_vote/superintend_vote_realvote_changeOffline");

		return mv;
	}

	@RequestMapping("/resident/confirmResident")
	public ModelAndView confirmResident(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/confirmResident");
		String bdNm = request.getParameter("bdNm");
		String rmNm = request.getParameter("rmNm");
		String residentNm = request.getParameter("residentNm");

		String aptDetailInfoSeq = "1_" + bdNm + "_" + rmNm;

		System.out.println(residentNm);
		System.out.println(aptDetailInfoSeq);

		//입력받은 정보의 거주자가 있는지 확인하는 메소드
		ResidentVO rs = new ResidentVO();
		rs.setResidentNm(residentNm);
		rs.setAptDetailInfoSeq(aptDetailInfoSeq);
		int result = svs.selectConfirmResident(rs);

		System.out.println("controller result : " + result);

		mv.addObject("result", result);
		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping("/resident/endingCandidate")
	public String endingCandidate() {
		System.out.println("/menuSuperintendVote");
		return "/resident/superintend_vote/superintend_vote/superintend_vote_endingCandidate";
	}

	@RequestMapping("/resident/endingGeneral")
	public String endingGeneral() {
		System.out.println("/menuSuperintendVote");
		return "/resident/superintend_vote/superintend_vote/superintend_vote_endingGeneral";
	}

	@RequestMapping("/resident/candApplyDetail")
	public ModelAndView candApplyDetail(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuSuperintendVote");
		int electVoteCndtSignupSeq = Integer.parseInt(request.getParameter("electVoteCndtSignupSeq"));
		int electVoteSeq = Integer.parseInt(request.getParameter("electVoteSeq"));

		//해당 선거 정보 담아오는 메소드
		ElectionVote ev = svs.selectOneElectionVote(electVoteSeq);

		//해당 신청서 세부내역 담아오는 메소드
		ElectionVoteCandidate evc = svs.selectOneElectionVoteCandidate(electVoteCndtSignupSeq);

		//해당 신청서 경력사항 리스트 담아오는 메소드
		ArrayList careerList = svs.selectAllElectionVoteCadidateCareer(electVoteCndtSignupSeq);

		mv.addObject("ev", ev);
		mv.addObject("evc", evc);
		mv.addObject("careerList", careerList);
		mv.setViewName("/resident/superintend_vote/superintend_vote/superintend_vote_realvote_candApplyDetail");

		return mv;
	}

	@RequestMapping("/resident/insert_newVote_general")
	public ModelAndView insert_newVote_general(ModelAndView mv, HttpServletRequest request) {

		//투표정보 담기
		GeneralVote gv = new GeneralVote();
		gv.setGnrVoteName(request.getParameter("gnrVoteName"));
		gv.setGnrVoteType(Integer.parseInt(request.getParameter("gnrVoteType")));
		gv.setGnrVoteEndDt(request.getParameter("gnrVoteEndDt"));
		gv.setGnrVoteOfflinePlace(request.getParameter("gnrVoteOfflinePlace"));
		gv.setGnrVoteDetail(request.getParameter("gnrVoteDetail"));
		gv.setGnrVoteGrant(Integer.parseInt(request.getParameter("gnrVoteGrant")));
		System.out.println("controller gv : " + gv);

		//동투표시, 동별투표정보 담기
		ArrayList<GeneralVoteBdNm> bdNmList = new ArrayList<GeneralVoteBdNm>();
		if(gv.getGnrVoteGrant() == 2) {
			String[] bdNmArrResult = request.getParameter("bdNmArr").split(",");
			for(int i = 0; i < bdNmArrResult.length; i++) {
				System.out.println("Controller bdNmArrResult : " + bdNmArrResult[i]);
				GeneralVoteBdNm gvb = new GeneralVoteBdNm();
				gvb.setBdNm(Integer.parseInt(bdNmArrResult[i]));
				bdNmList.add(gvb);
			}
			//
		}
		System.out.println("controller BdNmList : " + bdNmList);

		//투표 후보정보  담기
		System.out.println("controller voteCandidateArr : " + request.getParameter("voteCandidateArr"));
		String[] allCandidateInfo = request.getParameter("voteCandidateArr").split(",");
		String candidateNo = null;
		String candidateNm = null;
		String candidateInfo = null;
		ArrayList<GeneralVoteCandidate> candidateList = new ArrayList<GeneralVoteCandidate>();
		for(int i = 0; i < allCandidateInfo.length; i++) {
			String[] candidate = allCandidateInfo[i].split(":");
			for(int j = 0; j < candidate.length; j++) {
				System.out.println("contoller candidate : " + candidate[j]);
				if(j == 0) {
					candidateNo = candidate[j];
				}else if(j == 1) {
					candidateNm = candidate[j];
				}else {
					candidateInfo = candidate[j];
				}
			}
			String cndtNm = "후보" + candidateNo + ". " + candidateNm;
			GeneralVoteCandidate gvc = new GeneralVoteCandidate();
			gvc.setCndtNm(cndtNm);
			gvc.setCndtDetail(candidateInfo);
			candidateList.add(gvc);
		}
		System.out.println("controller candidateList : " + candidateList);

		//투표 insert 메소드
		int result = svs.insertGeneralVote(gv, bdNmList, candidateList);

		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping("/resident/insert_newVote_election")
	public ModelAndView insert_newVote_election(ModelAndView mv, HttpServletRequest request) {

		//선거정보 담기
		ElectionVote ev = new ElectionVote();
		ev.setElectNm(request.getParameter("electNm"));
		ev.setElectType(Integer.parseInt(request.getParameter("electType")));
		ev.setElectVoteDetail(request.getParameter("electVoteDetail"));
		ev.setCnddEnrollStartDt(request.getParameter("cnddEnrollStartDt"));
		ev.setCnddEnrollEndDt(request.getParameter("cnddEnrollEndDt"));
		ev.setCampaignStartDt(request.getParameter("campaignStartDt"));
		ev.setCampaignEndDt(request.getParameter("campaignEndDt"));
		ev.setVoteStartDt(request.getParameter("voteStartDt"));
		ev.setVoteEndDt(request.getParameter("voteEndDt"));
		ev.setElectVoteOfflinePlace(request.getParameter("electVoteOfflinePlace"));
		if(Integer.parseInt(request.getParameter("electType")) == 3) {
			ev.setBdNm(Integer.parseInt(request.getParameter("bdNm")));
		}
		System.out.println("controller ev : " + ev);

		//선거정보 insert하는 메소드
		int result = svs.insertElectionVote(ev);

		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping("/resident/changeBdNm")
	public ModelAndView changeBdNm(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuSuperintendVote");
		int bdNm = Integer.parseInt(request.getParameter("bdNm"));
		System.out.println("controller bdNm : " + bdNm);

		//해당 선택동에 포함된 호 리스트 불러오는 메소드
		ArrayList hoList = svs.selectAllHoList(bdNm);

		mv.addObject("hoList", hoList);
		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping(value="/resident/changeRmNm", produces = "application/json; charset=utf8")
	public ModelAndView changeRmNm(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuSuperintendVote");
		int bdNm = Integer.parseInt(request.getParameter("bdNm"));
		int rmNm = Integer.parseInt(request.getParameter("rmNm"));
		System.out.println("controller bdNm : " + bdNm);
		System.out.println("controller rmNm : " + rmNm);

		//해당 선택동, 선택호 에 포함된 호 리스트 불러오는 메소드
		ApartDetailInfo tdi = new ApartDetailInfo();
		tdi.setBdNm(bdNm);
		tdi.setRmNm(rmNm);
		ArrayList<ApartDetailInfo> nameList = svs.selectAllNameList(tdi);
		System.out.println("controller nameList : " + nameList);

		mv.addObject("nameList", nameList);
		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping("/resident/insertElectionVoteCandidate")
	public ModelAndView insertElectionVoteCandidate(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuSuperintendVote");
		int residentSeq = Integer.parseInt(request.getParameter("residentSeq"));
		String simpleInfo = request.getParameter("simpleInfo");
		String detailInfo = request.getParameter("detailInfo");
		String etcInfo = request.getParameter("etcInfo");
		int electVoteSeq = Integer.parseInt(request.getParameter("electVoteSeq"));
		int cndtNo = Integer.parseInt(request.getParameter("cndtNo"));
		System.out.println("insert residentSeq : " + residentSeq);
		System.out.println("insert simpleInfo : " + simpleInfo);
		System.out.println("insert detailInfo : " + detailInfo);
		System.out.println("insert etcInfo : " + etcInfo);


		//해당 후보를 등록처리하고 정보 update하는 메소드
		ElectionVoteCandidate evc = new ElectionVoteCandidate();
		evc.setResidentSeq(residentSeq);
		evc.setSimpleInfo(simpleInfo);
		evc.setDetailInfo(detailInfo);
		evc.setEtcInfo(etcInfo);
		evc.setElectVoteSeq(electVoteSeq);
		evc.setCndtNo(cndtNo);
		int result = svs.updateElectionVoteCandidate(evc);

		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping("/resident/confirmHistoryVote")
	public ModelAndView confirmHistoryVote(ModelAndView mv, HttpServletRequest request) {
		int residentSeq = Integer.parseInt(request.getParameter("residentSeq"));
		String voteKind = request.getParameter("voteKind");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));
		System.out.println("voteSeq : " + voteSeq);


		int result = 0;
		if(voteKind.equals("선거")) {
			VotePrtcpt vp = new VotePrtcpt();
			vp.setElectVoteSeq(voteSeq);
			vp.setResidentSeq(residentSeq);
			//선거 참여내역 확인하는 메소드
			result = svs.selectConfirmHistoryElectionVote(vp);
		}else {
			VotePrtcpt vp = new VotePrtcpt();
			vp.setGnrVoteSeq(voteSeq);
			vp.setResidentSeq(residentSeq);
			//일반투표 참여내역 확인하는 메소드
			result = svs.selectConfirmHistoryGeneralVote(vp);
		}

		mv.addObject("result", result);
		mv.setViewName("jsonView");

		return mv;

	}

	@RequestMapping("/resident/insertRealVote")
	public ModelAndView insertRealVote(ModelAndView mv, HttpServletRequest request) {
		int residentSeq = Integer.parseInt(request.getParameter("residentSeq"));
		String voteKind = request.getParameter("voteKind");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));
		int resultCandidate = Integer.parseInt(request.getParameter("resultCandidate"));
		System.out.println("voteSeq : " + voteSeq);


		int result = 0;
		if(voteKind.equals("선거")) {
			VotePrtcpt vp = new VotePrtcpt();
			vp.setElectVoteSeq(voteSeq);
			vp.setResidentSeq(residentSeq);
			VoteSelected vs = new VoteSelected();
			vs.setElectVoteCndtSignupSeq(resultCandidate);
			//선거내역 insert하는 메소드
			result = svs.insertRealVoteElection(vp, vs);
		}else {
			VotePrtcpt vp = new VotePrtcpt();
			vp.setGnrVoteSeq(voteSeq);
			vp.setResidentSeq(residentSeq);
			VoteSelected vs = new VoteSelected();
			vs.setGnrVoteCndtEnrollSeq(resultCandidate);
			//일반투표 insert하는 메소드
			result = svs.insertRealVoteGeneral(vp, vs);
		}

		mv.addObject("result", result);
		mv.setViewName("jsonView");

		return mv;

	}

	/**
     * BASE64 Encoder
     * @param str
     * @return
     */
    public static String base64Encode(String str)  throws java.io.IOException {
        sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
        byte[] strByte = str.getBytes();
        String result = encoder.encode(strByte);
        return result ;
    }

    /**
     * BASE64 Decoder
     * @param str
     * @return
     */
    public static String base64Decode(String str)  throws java.io.IOException {
        sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
        byte[] strByte = decoder.decodeBuffer(str);
        String result = new String(strByte);
        return result ;
    }

    public static String nullcheck(String str,  String Defaultvalue ) throws Exception
    {
         String ReturnDefault = "" ;
         if (str == null)
         {
             ReturnDefault =  Defaultvalue ;
         }
         else if (str == "" )
        {
             ReturnDefault =  Defaultvalue ;
         }
         else
         {
                     ReturnDefault = str ;
         }
          return ReturnDefault ;
    }

	@RequestMapping("/resident/sendMessage")
	@ResponseBody
	public HashMap<String, String> sendMessage(ModelAndView
			mv, HttpServletRequest request) throws IOException, Exception {

		System.out.println("sendMessage...");

		String sendMessagePeoples = base64Encode(nullcheck(request.getParameter("sendMessagePeoples"), ""));
		String sendMessagePhones = request.getParameter("sendMessagePhones");
		String sendMessage = request.getParameter("sendMessage");

		String[] people = sendMessagePeoples.split(",");
		String[] phone = sendMessagePhones.split(",");

		String sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
        String user_id = base64Encode("ho6132"); // SMS아이디
        String secure = base64Encode("b8757f7462341bd8911014e4557741b9");//인증키
        String msg = base64Encode(nullcheck(sendMessage , ""));
        String rphone = null;
		String sphone1 = "010";
		String sphone2 = "2603";
		String sphone3 = "9932";

        String[] host_info = sms_url.split("/");
        String host = host_info[2];
        String path = "/" + host_info[3];
        int port = 80;

        for(int j = 0; j < phone.length; j++) {
        	System.out.println("phoneArr :: " + phone[j].toString());
        	// 데이터 맵핑 변수 정의
        	String arrKey[]
        			= new String[] {"user_id","secure","msg", "rphone","sphone1","sphone2","sphone3"};

        	String valKey[]= new String[arrKey.length] ;
        	valKey[0] = user_id;
        	valKey[1] = secure;
        	valKey[2] = msg;
        	valKey[3] = phone[j];
        	valKey[4] = sphone1;
        	valKey[5] = sphone2;
        	valKey[6] = sphone3;

        	String boundary = "";
        	Random rnd = new Random();
        	String rndKey = Integer.toString(rnd.nextInt(32000));


        	try {
        		MessageDigest md = MessageDigest.getInstance("MD5");
        		byte[] bytData = rndKey.getBytes();
        		md.update(bytData);
        		byte[] digest = md.digest();
        		for(int i =0;i<digest.length;i++)
        		{
        			boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
        		}
        		boundary = "---------------------"+boundary.substring(0,11);

        		// 본문 생성
        		String data = "";
        		String index = "";
        		String value = "";
        		for (int i=0;i<arrKey.length; i++)
        		{
        			index =  arrKey[i];
        			value = valKey[i];
        			data +="--"+boundary+"\r\n";
        			data += "Content-Disposition: form-data; name=\""+index+"\"\r\n";
        			data += "\r\n"+value+"\r\n";
        			data +="--"+boundary+"\r\n";
        		}
        		InetAddress addr = InetAddress.getByName(host);
        		Socket socket = new Socket(host, port);
        		// 헤더 전송
        		BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), "UTF-8"));
        		wr.write("POST "+path+" HTTP/1.0\r\n");
        		wr.write("Content-Length: "+data.length()+"\r\n");
        		wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
        		wr.write("\r\n");

        		// 데이터 전송
        		wr.write(data);
        		wr.flush();

        		// 결과값 얻기
        		BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(), "UTF-8"));
        		String line;
        		String alert = "";
        		ArrayList tmpArr = new ArrayList();
        		while ((line = rd.readLine()) != null) {
        			tmpArr.add(line);
        		}
        		wr.close();
        		rd.close();
        		String tmpMsg = (String)tmpArr.get(tmpArr.size()-1);
        		String[] rMsg = tmpMsg.split(",");
        		String Result= rMsg[0]; //발송결과
        		String Count= ""; //잔여건수
        		if(rMsg.length>1) {Count= rMsg[1]; }

        		//발송결과 알림
        		if(Result.equals("success")) {
        			alert = "성공적으로 발송하였습니다.";
        			alert += " 잔여건수는 "+ Count+"건 입니다.";
        		}
        		else if(Result.equals("reserved")) {
        			alert = "성공적으로 예약되었습니다";
        			alert += " 잔여건수는 "+ Count+"건 입니다.";
        		}
        		else if(Result.equals("3205")) {
        			alert = "잘못된 번호형식입니다.";
        		}
        		else {
        			alert = "[Error]"+Result;
        		}
        	} catch (UnknownHostException e) {
        		// TODO Auto-generated catch block
        		e.printStackTrace();
        	} catch (IOException e) {
        		// TODO Auto-generated catch block
        		e.printStackTrace();
        	} catch (NoSuchAlgorithmException e) {
        		// TODO Auto-generated catch block
        		e.printStackTrace();
        	}

        }


        //mv.addObject("msgRnd" , msg);
        //mv.setViewName("JsonView");


        HashMap<String, String> map = new HashMap<String, String>();
        map.put("code","1");
        map.put("msg", "등록하였습니다.");
        return map;

	}

}
