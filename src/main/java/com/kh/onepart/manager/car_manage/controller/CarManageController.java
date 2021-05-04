package com.kh.onepart.manager.car_manage.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.onepart.manager.car_manage.model.service.ResidentCarService;
import com.kh.onepart.manager.car_manage.model.vo.ResidentCarVO;



@Controller
public class CarManageController {
	@Autowired
	ResidentCarService residentCarService;

	@RequestMapping("/manager/menuCarManage")
	public ModelAndView menuCarManage(ModelAndView mv) {
		List<ResidentCarVO> residentCarList = residentCarService.residentCarList();
		System.out.println(residentCarList);
		mv.addObject("residentCarList",residentCarList);

		mv.setViewName("/manager/car_manage/carManage");

		return mv;
	}

	@RequestMapping(value="/manager/addResidentCar", produces = "application/text; charset=utf8")
	@ResponseBody
	public String addResidentCar(HttpSession session, ResidentCarVO residentCarVO) throws JsonProcessingException {

		ResidentCarVO residentCarVO2 = residentCarService.selectResidentCar(residentCarVO);
		System.out.println("있어 없어    : : : :" + residentCarVO2);
		Map<String, Object> result = new HashMap<>();
		if(residentCarVO2 == null ) {
			residentCarService.addResidentCar(residentCarVO);
			result.put("result", "success");
		}


		return new ObjectMapper().writeValueAsString(result);

	}

	@RequestMapping(value="/manager/deleteResidentCar", produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteResidentCar(HttpSession session, String tmp) throws JsonProcessingException {

		String[] list = tmp.split(",");

		for (int i = 0; i < list.length; i++) {
			System.out.println(list[i]);
			residentCarService.deleteResidentCar(list[i]);
		}

		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return new ObjectMapper().writeValueAsString(result);

	}



}
