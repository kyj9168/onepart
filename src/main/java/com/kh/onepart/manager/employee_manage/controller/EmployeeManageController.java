package com.kh.onepart.manager.employee_manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.onepart.manager.car_manage.model.vo.ResidentCarVO;
import com.kh.onepart.manager.employee_manage.model.service.EmployeeManageService;
import com.kh.onepart.manager.employee_manage.model.vo.EmployeeManageVO;


@Controller
public class EmployeeManageController {
	@Autowired
	EmployeeManageService employeeManageService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;


	@RequestMapping("/manager/menuEmployeeManage")
	public ModelAndView menuEmployeeManage(ModelAndView mv) {
		List<EmployeeManageVO> managerList = employeeManageService.managerList();
		System.out.println(managerList);
		mv.addObject("managerList",managerList);
		mv.setViewName("/manager/employee_manage/employeeManage");

		return mv;
	}


	@RequestMapping(value="/manager/addManager", produces = "application/text; charset=utf8")
	@ResponseBody
	public String addManager(HttpSession session, EmployeeManageVO employeeManageVO) throws JsonProcessingException {

		EmployeeManageVO employeeManageVO2 = employeeManageService.selectManager(employeeManageVO);
		System.out.println("있어 없어    : : : :" + employeeManageVO2);
		Map<String, Object> result = new HashMap<>();
		if(employeeManageVO2 == null ) {
			String encPassword = passwordEncoder.encode(employeeManageVO.getManagerId());
			System.out.println("encPassword ::C:: " + encPassword);
			employeeManageVO.setManagerPwd(encPassword);
			employeeManageService.addManager(employeeManageVO);
			result.put("result", "success");
		}
			return new ObjectMapper().writeValueAsString(result);

	}

	@RequestMapping(value="/manager/deleteManager", produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteManager(HttpSession session, String tmp) throws JsonProcessingException {

		String[] list = tmp.split(",");

		for (int i = 0; i < list.length; i++) {
			System.out.println(list[i]);
			employeeManageService.deleteManager(list[i]);
		}

		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return new ObjectMapper().writeValueAsString(result);

	}

	@RequestMapping(value="/manager/updateManager", produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateManager(HttpSession session, String tmp) throws JsonProcessingException {

		String[] list = tmp.split(",");

		for (int i = 0; i < list.length; i++) {
			System.out.println(list[i]);
			employeeManageService.updateManager(list[i]);
		}

		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return new ObjectMapper().writeValueAsString(result);

	}


}
