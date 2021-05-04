package com.kh.onepart.resident.my_home.my_car.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.my_home.my_car.model.service.MyCarService;
import com.kh.onepart.resident.warm.open_chatting.model.service.OpenChatService;

@Controller
public class MyCarController {
	@Autowired
	MyCarService MyCarService;

	@RequestMapping("/resident/menuMyCar")
	public String moveMyCar() {
		System.out.println("/resident/MyCar");
		return "/resident/my_home/my_car/myCar";
	}


	@RequestMapping(value="/resident/getMyCarList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getMyCarList(HttpSession session) throws JsonProcessingException {
		ResidentVO loginResident = (ResidentVO)session.getAttribute("loginUser");
		int residentSeq = loginResident.getResidentSeq();
		System.out.println("현재로그인하고있는 : " + residentSeq);
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		result.put("getMyCarList", MyCarService.getMyCarList(residentSeq));
		System.out.println("RESULT : " + result);
		return new ObjectMapper().writeValueAsString(result);

	}
}