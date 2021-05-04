package com.kh.onepart.resident.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.vo.ManagerVO;
import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.main.model.service.ResidentTemplateService;

@Controller
public class ResedentTemplateController {

	@Autowired
	ResidentTemplateService residentTemplateService;

	@RequestMapping("/resident/main")
	public ModelAndView moveMain(HttpSession session, ModelAndView modelAndView) {

		String loginUser = "";

		// 읽지 않은 메시지 가져오기
		if(session.getAttribute("loginUser") != null) {
			// 입주민일 경우
			if(session.getAttribute("loginUser") instanceof ResidentVO) {
				loginUser = String.valueOf(((ResidentVO) session.getAttribute("loginUser")).getResidentSeq());

			// 관리자일 경우
			} else if(session.getAttribute("loginUser") instanceof ManagerVO) {
				loginUser = ((ManagerVO) session.getAttribute("loginUser")).getManagerSeq();
			}

			System.out.println("loginUser :::::::::::" + loginUser);

			int count = residentTemplateService.selectNoReadMessengerCount(loginUser);

			System.out.println("count::" + count);
			modelAndView.addObject("count", count);
		}

		modelAndView.setViewName("/resident/common/residentTemplate");

		return modelAndView;
	}


	/*
	 * 현재 메뉴 세션 관리
	 *  - 새로고침 -> 메인화면 방지용
	 */

	// 메뉴 URL 가져오기
	@RequestMapping(value="/getMenu", method = RequestMethod.POST)
	@ResponseBody
	public String getMenuId(HttpSession session) {
		String menuId = (String) session.getAttribute("menuId");
		return (menuId == null)? "none" : menuId;
	}

	// 메뉴 URL 저장하기
	@RequestMapping(value="/setMenu", method = RequestMethod.POST)
	@ResponseBody
	public String setMenuId(String menuId, HttpSession session) {
		session.setAttribute("menuId", menuId);

		return "success";
	}
}
