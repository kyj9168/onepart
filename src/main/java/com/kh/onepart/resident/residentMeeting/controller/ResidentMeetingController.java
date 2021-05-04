package com.kh.onepart.resident.residentMeeting.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.residentMeeting.service.ResidentMeetingService;
import com.kh.onepart.resident.residentMeeting.vo.ResidentAllInfo;
import com.kh.onepart.resident.residentMeeting.vo.ResidentMeetingVO;

@Controller
public class ResidentMeetingController {

	@Autowired
	ResidentMeetingService residentMeetingService;

	/**
	 * 입주자 대표 회의 메인페이지
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("resident/menuMeetingInfo")
	public ModelAndView moveMenuMeetingInfo(ModelAndView modelAndView) {
		System.out.println("resident/menuMeetingInfo in");

		// 입주민 정보 가져오기
		ArrayList<ResidentAllInfo> residentVOList = residentMeetingService.selectResidentVOList();
		System.out.println("residentVOList : " + residentVOList);
		// 회의 정보 가져오기
		ArrayList<ResidentMeetingVO> residentMeetingVOList = residentMeetingService.selectMeetingInfo();
		System.out.println("ResidentMeetingVOList :: " + residentMeetingVOList);

		modelAndView.addObject("residentVOList", residentVOList);
		modelAndView.addObject("residentMeetingVOList", residentMeetingVOList);
		modelAndView.setViewName("resident/resident_meeting/residentMeetingMain");

		return modelAndView;
	}

	/**
	 * 입주자 대표 회의 등록 페이지
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("resident/moveResidentMeetingRegister")
	public ModelAndView moveResidentMeetingRegister(ModelAndView modelAndView) {
		modelAndView.setViewName("resident/resident_meeting/residentMeetingRegister");
		return modelAndView;
	}

	/**
	 * 입주자 대표 회의 등록
	 * @param modelAndView
	 * @param residentMeetingVO
	 * @return
	 */
	@RequestMapping("resident/residentMeetingRegister")
	public ModelAndView residentMeetingRegister(ModelAndView modelAndView, ResidentMeetingVO residentMeetingVO, HttpSession session) {
		System.out.println("residentMeetingRegister in");
		System.out.println("residentMeetingVO : " + residentMeetingVO);

		if(session.getAttribute("loginUser") != null) {
			int residentSeq = ((ResidentVO) session.getAttribute("loginUser")).getResidentSeq();
			residentMeetingVO.setResidentSeq(residentSeq);
		}

		residentMeetingService.residentMeetingRegister(residentMeetingVO);
		modelAndView.setViewName("redirect:menuMeetingInfo");

		return modelAndView;
	}

	/**
	 * 입주자 대표 회의 상세보기
	 * @param modelAndView
	 * @param residentMeetingVO
	 * @return
	 */
	@RequestMapping("/resident/moveResidentMeetingMainDetail")
	public ModelAndView moveResidentMeetingMainDetail(ModelAndView modelAndView, ResidentMeetingVO residentMeetingVO) {
		System.out.println("moveResidentMeetingMainDetail in");

		ResidentMeetingVO responseResidentMeetingVO = residentMeetingService.selectResidentMeetingMainDetail(residentMeetingVO);
		System.out.println("responseResidentMeetingVO::" + responseResidentMeetingVO);

		modelAndView.addObject("responseResidentMeetingVO", responseResidentMeetingVO);
		modelAndView.setViewName("resident/resident_meeting/residentMeetingMainDetail");

		return modelAndView;
	}

	/**
	 * 입주자 대표 회의 상세보기
	 * @param modelAndView
	 * @param residentMeetingVO
	 * @return
	 */
	@RequestMapping("/resident/moveResidentMeetingMainModify")
	public ModelAndView moveResidentMeetingMainModify(ModelAndView modelAndView, ResidentMeetingVO residentMeetingVO) {
		System.out.println("moveResidentMeetingMainDetail in");

		ResidentMeetingVO responseResidentMeetingVO = residentMeetingService.selectResidentMeetingMainDetail(residentMeetingVO);
		System.out.println("responseResidentMeetingVO::" + responseResidentMeetingVO);

		modelAndView.addObject("responseResidentMeetingVO", responseResidentMeetingVO);
		modelAndView.setViewName("resident/resident_meeting/residentMeetingMainModify");

		return modelAndView;
	}

	@RequestMapping("/resident/removeResidentMeeting")
	public ModelAndView removeResidentMeeting(ModelAndView modelAndView, ResidentMeetingVO residentMeetingVO) {
		System.out.println("removeResidentMeeting in");

		residentMeetingService.deleteResidentMeeting(residentMeetingVO.getResidentsMeetingSeq());

		modelAndView.setViewName("redirect:menuMeetingInfo");
		return modelAndView;
	}

	/**
	 * 입주자 대표 회의 수정
	 * @param modelAndView
	 * @param residentMeetingVO
	 * @return
	 */
	@RequestMapping("resident/residentMeetingMainModify")
	public ModelAndView residentMeetingMainModify(ModelAndView modelAndView, ResidentMeetingVO residentMeetingVO, HttpSession session) {
		System.out.println("residentMeetingMainModify in");
		System.out.println("residentMeetingVO : " + residentMeetingVO);

		if(session.getAttribute("loginUser") != null) {
			int residentSeq = ((ResidentVO) session.getAttribute("loginUser")).getResidentSeq();
			residentMeetingVO.setResidentSeq(residentSeq);
		}

		residentMeetingService.residentMeetingMainModify(residentMeetingVO);
		modelAndView.setViewName("jsonView");

		return modelAndView;
	}
	/**
	 * 입주자 대표 회의 회의록 저장
	 * @param modelAndView
	 * @param residentMeetingVO
	 * @return
	 */
	@RequestMapping("resident/saveMeetingMinutes")
	public ModelAndView saveMeetingMinutes(ModelAndView modelAndView, ResidentMeetingVO residentMeetingVO, HttpSession session) {
		System.out.println("saveMeetingMinutes in");
		System.out.println("residentMeetingVO : " + residentMeetingVO);

		residentMeetingService.saveMeetingMinutes(residentMeetingVO);
		modelAndView.setViewName("jsonView");

		return modelAndView;
	}

}
