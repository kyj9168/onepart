package com.kh.onepart.resident.my_apartment.vote.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.common.CommonUtils;
import com.kh.onepart.resident.my_apartment.vote.model.service.VoteService;
import com.kh.onepart.resident.my_apartment.vote.model.vo.CandidatePercent;
import com.kh.onepart.resident.my_apartment.vote.model.vo.Career;
import com.kh.onepart.resident.my_apartment.vote.model.vo.ElectionVote;
import com.kh.onepart.resident.my_apartment.vote.model.vo.ElectionVoteCandidate;
import com.kh.onepart.resident.my_apartment.vote.model.vo.GeneralVote;
import com.kh.onepart.resident.my_apartment.vote.model.vo.GeneralVoteCandidate;
import com.kh.onepart.resident.my_apartment.vote.model.vo.Image;
import com.kh.onepart.resident.my_apartment.vote.model.vo.VoteList;
import com.kh.onepart.resident.my_apartment.vote.model.vo.VotePrtcpt;
import com.kh.onepart.resident.superintend_vote.model.service.SuperintendVoteService;

@Controller
public class VoteController {
	@Autowired
	private VoteService vs;
	@Autowired
	private SuperintendVoteService svs;

	@RequestMapping("/resident/menuVote")
	public ModelAndView moveVote(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuVote123");

		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();

		//현재 진행중인 선거 리스트 불러오는 메소드
		ArrayList ingVoteList = vs.selectAllIngVoteList(residentSeq);
		System.out.println("controller ingVoteList : " + ingVoteList);

		//현재 진행중인 투표중 로그인유저가 참여하지 않은 선거 리스트 불러오는 메소드
		ArrayList noVoteList = vs.selectAllNoVoteList(residentSeq);

		//일주일 이내에 종료된 선거 리스트 불러오는 메소드
		ArrayList endVoteList = vs.selectAllEndVoteList(residentSeq);

		mv.addObject("ingVoteList", ingVoteList);
		mv.addObject("noVoteList", noVoteList);
		mv.addObject("endVoteList", endVoteList);
		mv.setViewName("/resident/my_apartment/vote/vote_main");

		return mv;

	}

	@RequestMapping("/resident/candidateApply")
	public ModelAndView moveVote_candidateApply(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuVote");

		//현재 후보신청을 받고있는 선거 리스트 불러오는메소드
		ArrayList candidateVoteList = vs.selectAllCandidateVoteList();

		mv.addObject("candidateVoteList", candidateVoteList);
		mv.setViewName("/resident/my_apartment/vote/vote_election_apply");

		return mv;
	}

	@RequestMapping("/resident/applyCandidate")
	public ModelAndView moveVote_applyCandidate(ModelAndView mv, HttpServletRequest request, MultipartHttpServletRequest req) {
		System.out.println("/moveVote_applyCandidate");
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();
		int electVoteSeq = Integer.parseInt(request.getParameter("electVoteSeq"));
		String finalEdu = request.getParameter("finalEdu");
		String workNm = request.getParameter("workNm");
		String workPosition = request.getParameter("workPosition");
		String workAdd = request.getParameter("workAdd");
		System.out.println("controller workNm : " + workNm);
		String careerTm1 = request.getParameter("careerTm1");
		String careerTm2 = request.getParameter("careerTm2");
		String careerTm3 = request.getParameter("careerTm3");
		String careerTm4 = request.getParameter("careerTm4");
		String careerCon1 = request.getParameter("careerCon1");
		String careerCon2 = request.getParameter("careerCon2");
		String careerCon3 = request.getParameter("careerCon3");
		String careerCon4 = request.getParameter("careerCon4");


		List<MultipartFile> mf = req.getFiles("thumbnailImg1");

		Image img = new Image();
		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {

        } else {
            for (int i = 0; i < mf.size(); i++) {
                // 파일 중복명 처리
                String genId = CommonUtils.getRandomString();
                // 본래 파일명
                String originalfileName = mf.get(i).getOriginalFilename();

                System.out.println("originalfileName : " + originalfileName);

                String saveFileName = genId + "." + originalfileName.substring(originalfileName.lastIndexOf("."));
                // 저장되는 파일 이름

                String root = request.getSession().getServletContext().getRealPath("resources");
        		String filePath = root + "\\uploadFiles\\reservation";

                // 저장 될 파일 경로
                long fileSize = mf.get(i).getSize();

                img.setOriginNm(originalfileName);
                img.setChangeNm(saveFileName);
                img.setFilePath(filePath);

                System.out.println("controller img : " + img);

                try {
					mf.get(i).transferTo(new File(filePath + "\\" + saveFileName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // 파일 저장

            }
        }

		//신청서 insert 메소드
		ElectionVoteCandidate evc = new ElectionVoteCandidate();
		evc.setFinalEdu(finalEdu);
		evc.setWorkNm(workNm);
		evc.setWorkPosition(workPosition);
		evc.setWorkAdd(workAdd);
		evc.setElectVoteSeq(electVoteSeq);
		evc.setResidentSeq(residentSeq);
		System.out.println("Controller evc : " + evc);
		ArrayList<Career> careerArr = new ArrayList<Career>();
		if(!careerTm1.equals("")) {
			Career career = new Career();
			career.setCareerPeriod(careerTm1);
			career.setCareerDetail(careerCon1);
			careerArr.add(career);
			System.out.println("1");
		}

		if(!careerTm2.equals("")) {
			Career career = new Career();
			career.setCareerPeriod(careerTm2);
			career.setCareerDetail(careerCon2);
			careerArr.add(career);
			System.out.println("2");
		}

		if(!careerTm3.equals("")) {
			Career career = new Career();
			career.setCareerPeriod(careerTm3);
			career.setCareerDetail(careerCon3);
			careerArr.add(career);
			System.out.println("3");
		}

		if(!careerTm4.equals("")) {
			Career career = new Career();
			career.setCareerPeriod(careerTm4);
			career.setCareerDetail(careerCon4);
			careerArr.add(career);
			System.out.println("4");
		}

		int result = vs.insertElectionCandidateApply(img, evc, careerArr);

		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping("/resident/election")
	public ModelAndView moveVote_election(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuVote");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));
		System.out.println("controller voteSeq : " + voteSeq);
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();

		//선택한 선거의 상세정보를 불러오는 메소드 (선거)
		VoteList info = new VoteList();
		info.setVoteSeq(voteSeq);
		info.setResidentSeq(residentSeq);
		ElectionVote vote = vs.selectOneElectionVoteInfo(voteSeq);
		System.out.println("controller vote : " + vote);

		//로그인유저의 현황을 불러오는 메소드 (선거)
		VoteList voteUser = vs.selectOneElectionVoteUserInfo(info);
		System.out.println("controller voteUser : " + voteUser);

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
		mv.addObject("voteUser", voteUser);
		mv.addObject("candidateList", candidateList);
		mv.setViewName("/resident/my_apartment/vote/vote_election");

		return mv;
	}

	@RequestMapping("/resident/general")
	public ModelAndView moveVote_general(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuVote");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));
		System.out.println("controller voteSeq : " + voteSeq);
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();

		//선택한 선거의 상세정보를 불러오는 메소드
		VoteList info = new VoteList();
		info.setVoteSeq(voteSeq);
		info.setResidentSeq(residentSeq);
		GeneralVote vote = vs.selectOneGeneralVoteInfo(voteSeq);
		System.out.println("controller vote : " + vote);

		//로그인유저의 현황을 불러오는 메소드
		VoteList voteUser = vs.selectOneGeneralVoteUserInfo(info);
		System.out.println("controller voteUser : " + voteUser);

		//선택한 선거의 후보 리스트를 불러오는 메소드
		ArrayList<GeneralVoteCandidate> candidateList = vs.selectAllCandidateList(voteSeq);
		System.out.println("controller candidateList : " + candidateList);

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
		mv.addObject("voteUser", voteUser);
		mv.setViewName("/resident/my_apartment/vote/vote_general");

		return mv;
	}

	@RequestMapping("/resident/modifyGeneral")
	public ModelAndView moveVote_modifyGeneral(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/modifyGeneral");
		int gnrVoteSeq = Integer.parseInt(request.getParameter("gnrVoteSeq"));
		int voteSeq = gnrVoteSeq;
		System.out.println("modify gnrVoteSeq : " + gnrVoteSeq);
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();

		//선택한 선거의 상세정보를 불러오는 메소드
		VoteList info = new VoteList();
		info.setVoteSeq(gnrVoteSeq);
		info.setResidentSeq(residentSeq);
		GeneralVote vote = vs.selectOneGeneralVoteInfo(gnrVoteSeq);
		System.out.println("modify vote : " + vote);

		//로그인유저의 현황을 불러오는 메소드
		VoteList voteUser = vs.selectOneGeneralVoteUserInfo(info);
		System.out.println("modify voteUser : " + voteUser);

		//선택한 선거의 후보 리스트를 불러오는 메소드
		ArrayList candidateList = vs.selectAllCandidateList(gnrVoteSeq);
		System.out.println("modify candidateList : " + candidateList);

		//해당투표 투표권 명부인 갯수 가져오는 메소드 (일반투표)
		int num1 = svs.selectCountAllGeneralElectoral(voteSeq);

		//해당투표를 진행한 명부인 갯수 가녀오는 메소드 (일반투표)
		int num2 = svs.selectCountApplyGeneralElctoral(voteSeq);

		//투표율 로직처리
		int votePercent = (int)((double)num2 / (double)num1 * 100);
		System.out.println("result : " + votePercent);

		mv.addObject("votePercent", votePercent);
		mv.addObject("vote", vote);
		mv.addObject("candidateList", candidateList);
		mv.addObject("voteUser", voteUser);
		mv.setViewName("/resident/my_apartment/vote/vote_general_modify");

		return mv;
	}

	@RequestMapping("/resident/endElection")
	public ModelAndView moveVote_endElection(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuVote");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));
		System.out.println("controller voteSeq : " + voteSeq);
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();
		String voteStatus = request.getParameter("voteStatus");

		//선택한 선거의 상세정보를 불러오는 메소드 (선거)
		VoteList info = new VoteList();
		info.setVoteSeq(voteSeq);
		info.setResidentSeq(residentSeq);
		ElectionVote vote = vs.selectOneElectionVoteInfo(voteSeq);
		System.out.println("controller vote : " + vote);

		//로그인유저의 현황을 불러오는 메소드 (선거)
		VoteList voteUser = vs.selectOneElectionVoteUserInfo(info);
		System.out.println("controller voteUser : " + voteUser);

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
		mv.addObject("voteUser", voteUser);
		mv.addObject("candidateList", candidateList);
		mv.addObject("voteStatus", voteStatus);

		mv.setViewName("/resident/my_apartment/vote/vote_election_end");

		return mv;

	}

	@RequestMapping("/resident/endGeneral")
	public ModelAndView moveVote_endGeneral(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuVote");
		int voteSeq = Integer.parseInt(request.getParameter("voteSeq"));
		System.out.println("controller voteSeq : " + voteSeq);
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();
		String voteStatus = request.getParameter("voteStatus");

		//선택한 선거의 상세정보를 불러오는 메소드
		VoteList info = new VoteList();
		info.setVoteSeq(voteSeq);
		info.setResidentSeq(residentSeq);
		GeneralVote vote = vs.selectOneGeneralVoteInfo(voteSeq);
		System.out.println("controller vote : " + vote);

		//로그인유저의 현황을 불러오는 메소드
		VoteList voteUser = vs.selectOneGeneralVoteUserInfo(info);
		System.out.println("controller voteUser : " + voteUser);

		//선택한 선거의 후보 리스트를 불러오는 메소드
		ArrayList<GeneralVoteCandidate> candidateList = vs.selectAllCandidateList(voteSeq);
		System.out.println("controller candidateList : " + candidateList);

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
		mv.addObject("voteUser", voteUser);
		mv.addObject("voteStatus", voteStatus);

		mv.setViewName("/resident/my_apartment/vote/vote_general_end");

		return mv;
	}

	@RequestMapping("/resident/realVoteGeneral")
	public ModelAndView moveVote_realVoteGeneral(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/realVoteGeneral");
		int gnrVoteSeq = Integer.parseInt(request.getParameter("gnrVoteSeq"));
		System.out.println("modify gnrVoteSeq : " + gnrVoteSeq);
		int voteSeq = gnrVoteSeq;
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();

		//선택한 선거의 상세정보를 불러오는 메소드
		VoteList info = new VoteList();
		info.setVoteSeq(gnrVoteSeq);
		info.setResidentSeq(residentSeq);
		GeneralVote vote = vs.selectOneGeneralVoteInfo(gnrVoteSeq);
		System.out.println("modify vote : " + vote);

		//로그인유저의 현황을 불러오는 메소드
		VoteList voteUser = vs.selectOneGeneralVoteUserInfo(info);
		System.out.println("modify voteUser : " + voteUser);

		//선택한 선거의 후보 리스트를 불러오는 메소드
		ArrayList candidateList = vs.selectAllCandidateList(gnrVoteSeq);
		System.out.println("modify candidateList : " + candidateList);

		//해당투표 투표권 명부인 갯수 가져오는 메소드 (일반투표)
		int num1 = svs.selectCountAllGeneralElectoral(voteSeq);

		//해당투표를 진행한 명부인 갯수 가녀오는 메소드 (일반투표)
		int num2 = svs.selectCountApplyGeneralElctoral(voteSeq);

		//투표율 로직처리
		int votePercent = (int)((double)num2 / (double)num1 * 100);
		System.out.println("result : " + votePercent);

		mv.addObject("votePercent", votePercent);
		mv.addObject("vote", vote);
		mv.addObject("candidateList", candidateList);
		mv.addObject("voteUser", voteUser);
		mv.setViewName("/resident/my_apartment/vote/vote_general_realvote");

		return mv;
	}

	@RequestMapping("/resident/realVoteElection")
	public ModelAndView moveVote_realVoteElection(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/realVoteElection");
		int electVoteSeq = Integer.parseInt(request.getParameter("electVoteSeq"));
		int voteSeq = electVoteSeq;
		System.out.println("modify gnrVoteSeq : " + electVoteSeq);
		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();

		//선택한 선거의 상세정보를 불러오는 메소드 (선거)
		VoteList info = new VoteList();
		info.setVoteSeq(electVoteSeq);
		info.setResidentSeq(residentSeq);
		ElectionVote vote = vs.selectOneElectionVoteInfo(electVoteSeq);
		System.out.println("controller vote : " + vote);

		//로그인유저의 현황을 불러오는 메소드 (선거)
		VoteList voteUser = vs.selectOneElectionVoteUserInfo(info);
		System.out.println("controller voteUser : " + voteUser);

		//선택한 선거의 후보 리스트를 불러오는 메소드 (선거)
		ArrayList candidateList = vs.selectAllElectionCandidateList(electVoteSeq);

		//해당선거 투표권 명부인 갯수 가져오는 메소드
		int num1 = svs.selectCountAllElectionElectoral(voteSeq);

		//해당선거를 진행한 명부인 갯수 가녀오는 메소드
		int num2 = svs.selectCountApplyElectionElctoral(voteSeq);

		int votePercent = (int)((double)num2 / (double)num1 * 100);
		System.out.println("result : " + votePercent);

		mv.addObject("votePercent", votePercent);
		mv.addObject("vote2", vote);
		mv.addObject("candidateList", candidateList);
		mv.addObject("voteUser", voteUser);
		mv.setViewName("/resident/my_apartment/vote/vote_election_realvote");

		return mv;
	}

	@RequestMapping("/resident/updateGeneralVote")
	public ModelAndView updateGeneralVote(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/updateGeneralVote");

		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();
		int gnrVoteSeq = Integer.parseInt(request.getParameter("gnrVoteSeq"));
		int gnrVoteCndtEnrollSeq = Integer.parseInt(request.getParameter("gnrVoteCndtEnrollSeq"));
		System.out.println("update gnrVoteSeq : " + gnrVoteSeq);
		System.out.println("update gnrVoteCndtEnrollSeq : " + gnrVoteCndtEnrollSeq);

		//해당 투표의 수정내역 update하는 메소드
		VotePrtcpt vp = new VotePrtcpt();
		vp.setGnrVoteSeq(gnrVoteSeq);
		vp.setResidentSeq(residentSeq);
		int result = vs.updateGeneralVote(vp, gnrVoteCndtEnrollSeq);

		mv.setViewName("jsonView");

		return mv;

	}

	@RequestMapping("/resident/insertGeneralVote")
	public ModelAndView insertGeneralVote(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/updateGeneralVote");


		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();
		int gnrVoteSeq = Integer.parseInt(request.getParameter("gnrVoteSeq"));
		int gnrVoteCndtEnrollSeq = Integer.parseInt(request.getParameter("gnrVoteCndtEnrollSeq"));
		System.out.println("update gnrVoteSeq : " + gnrVoteSeq);
		System.out.println("update gnrVoteCndtEnrollSeq : " + gnrVoteCndtEnrollSeq);

		//해당 투표의 수정내역 insert하는 메소드
		VotePrtcpt vp = new VotePrtcpt();
		vp.setGnrVoteSeq(gnrVoteSeq);
		vp.setResidentSeq(residentSeq);
		int result = vs.insertGeneralVote(vp, gnrVoteCndtEnrollSeq);

		mv.setViewName("jsonView");

		return mv;

	}

	@RequestMapping("/resident/insertElectionVote")
	public ModelAndView insertElectionVote(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/insertElectionVote");


		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();
		int electVoteSeq = Integer.parseInt(request.getParameter("electVoteSeq"));
		int electVoteCndtSignupSeq = Integer.parseInt(request.getParameter("electVoteCndtSignupSeq"));
		System.out.println("update gnrVoteSeq : " + electVoteSeq);
		System.out.println("update gnrVoteCndtEnrollSeq : " + electVoteCndtSignupSeq);

		//해당 투표의 수정내역 insert하는 메소드
		VotePrtcpt vp = new VotePrtcpt();
		vp.setElectVoteSeq(electVoteSeq);
		vp.setResidentSeq(residentSeq);
		int result = vs.insertElectionVote(vp, electVoteCndtSignupSeq);

		mv.setViewName("jsonView");

		return mv;

	}

}
