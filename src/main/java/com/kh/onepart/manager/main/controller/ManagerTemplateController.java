package com.kh.onepart.manager.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.vo.ManagerVO;
import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.main.model.service.ResidentTemplateService;

@Controller
public class ManagerTemplateController {

	@Autowired
	ResidentTemplateService residentTemplateService;

	@RequestMapping("/manager/main")
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

		modelAndView.setViewName("/manager/common/managerTemplate");

		return modelAndView;
	}

}

