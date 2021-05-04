package com.kh.onepart.resident.my_home.visit_car.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.my_home.visit_car.model.service.VisitCarService;
import com.kh.onepart.resident.my_home.visit_car.model.vo.VisitCarVo;

@Controller

public class VisitCarController {
	@Autowired
	private VisitCarService visitCarService;

	//이동 방문차량 등록 화면
	@RequestMapping("/resident/menuVisitCar")
	public String moveVisitCar() {
		System.out.println("/resident/moveVisitCar");
		return "/resident/my_home/visit_car/registerVisitCar";
	}

	//이동 방문차량 등록 리스트 화면
	@RequestMapping("/resident/moveListVisitCar")
	public ModelAndView moveListVisitCar(ModelAndView mv, HttpSession session) {
		System.out.println("/resident/listVisitCar");

		// residentSeq 추가
		ResidentVO loginUser = (ResidentVO)session.getAttribute("loginUser");
		int residentSeq = 0;
		if(loginUser != null) {
			residentSeq = loginUser.getResidentSeq();
		}
		System.out.println("현재 로그인 하고있는 residentSeq ::C:: " + residentSeq);

		//로그인 유저의 방문차량 등록 리스트 불러오는 메소드
		ArrayList myVisitcarList = visitCarService.selectMyVisitcarList(residentSeq);
		System.out.println("myVisitcarList ::C:: " + myVisitcarList);

		mv.addObject("myVisitcarList", myVisitcarList);
		mv.setViewName("/resident/my_home/visit_car/listVisitCar");

		return mv;
	}

	//방문차량 등록용 메소드
		@RequestMapping("/resident/registerVisitCar")
		public ModelAndView registerVisitCar(ModelAndView mv, HttpSession session, String visitCarNum,
				String subPhone, String visitPurpose, String visitDt) {

			ResidentVO loginUser = (ResidentVO)session.getAttribute("loginUser");
			int residentSeq = loginUser.getResidentSeq();
			System.out.println("현재 로그인 하고있는 residentSeq ::C:: " + residentSeq);

			VisitCarVo requestVisitCarVo = new VisitCarVo();
			requestVisitCarVo.setVisitCarNum(visitCarNum);
			requestVisitCarVo.setSubPhone(subPhone);
			requestVisitCarVo.setVisitPurpose(visitPurpose);
			requestVisitCarVo.setVisitDt(visitDt);
			requestVisitCarVo.setResidentSeq(residentSeq);
			System.out.println("requestVisitCarVo ::C::" + requestVisitCarVo);

			int result = visitCarService.registerVisitCar(requestVisitCarVo);
			System.out.println("result ::C:: " + result);
			if(result > 0) {
				mv.addObject("result", result);
				mv.setViewName("jsonView");
			}else {
				System.out.println("방문 차량 등록 실패!");
				mv.addObject("msg", "방문 차량 등록 실패!");
				mv.setViewName("common/errorPage");
			}
			return mv;
	}

		//방문차량 등록 삭제용 메소드
		@RequestMapping("/resident/deleteListVisitCar")
		public String deleteListVisitCar(Model model, HttpSession session, String resultCheckArr) {
			System.out.println("/resident/deleteListVisitCar");
			System.out.println("resultCheckArr ::C:: " + resultCheckArr);

			String[] visitCarSeqArr = resultCheckArr.split(",");
			System.out.println("residentSeqArr ::C:: "+visitCarSeqArr);

			int result = visitCarService.deleteListVisitCar(visitCarSeqArr );
			System.out.println("DeletemyResult ::C:: " + result);

//			mv.addObject("myVisitcarList", myVisitcarList1);
//			mv.setViewName("jsonView");

			return "redirect:/resident/moveListVisitCar";
		}
}