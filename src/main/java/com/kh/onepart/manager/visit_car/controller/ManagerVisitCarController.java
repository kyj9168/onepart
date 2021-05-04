package com.kh.onepart.manager.visit_car.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.manager.visit_car.model.service.ManagerVisitCarService;
import com.kh.onepart.manager.visit_car.model.vo.ManagerVisitCarVo;
@Controller
public class ManagerVisitCarController {
	@Autowired
	ManagerVisitCarService mVisitCarService;


	//이동 방문차량 등록 화면
		@RequestMapping("/manager/menuVisitCar")
		public ModelAndView moveVisitCar(ModelAndView mv, HttpSession session) {
			System.out.println("/manager/managerVisitCar");

			//로그인 유저의 방문차량 등록 리스트 불러오는 메소드
			ArrayList myVisitcarList = mVisitCarService.selectVisitcarList();
			System.out.println("myVisitcarList ::C:: " + myVisitcarList);

			mv.addObject("myVisitcarList", myVisitcarList);
			mv.setViewName("/manager/visit_car/managerVisitCar");

			return mv;
		}

	//방문차량 상태 승인으로 업데이트용 메소드
	@RequestMapping("/manager/yesVisitCar")
	public String yesVisitCar(Model model, HttpSession session, int visitCarSeq){
		System.out.println("visitCarSeq ::C:: " + visitCarSeq);

		int result = mVisitCarService.updateYesVisitCar(visitCarSeq);
		System.out.println("result ::C:: " + result);
		if(result > 0) {
			return "redirect:/manager/menuVisitCar";
		}else {
			System.out.println("방문 차량 승인 실패!");
			model.addAttribute("msg", "방문 차량 승인 실패!");
			return "common/errorPage";
		}
	}

	//방문차량 상태 거절로 업데이트용 메소드
	@RequestMapping("/manager/noVisitCar")
	public String noVisitCar(Model model, HttpSession session, int visitCarSeq){
		System.out.println("visitCarSeq ::C:: " + visitCarSeq);

		int result = mVisitCarService.updateNoVisitCar(visitCarSeq);
		System.out.println("result ::C:: " + result);
		if(result > 0) {
			return "redirect:/manager/menuVisitCar";
		}else {
			System.out.println("방문 차량 거절 실패!");
			model.addAttribute("msg", "방문 차량 거절 실패!");
			return "common/errorPage";
		}
	}

}
