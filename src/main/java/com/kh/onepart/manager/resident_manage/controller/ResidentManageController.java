package com.kh.onepart.manager.resident_manage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.manager.resident_manage.model.service.ResidentManageService;

@Controller
public class ResidentManageController {
	@Autowired
	private ResidentManageService rms;
	
//	$("#menuResidentManage").data("menu-url", "/onepart/manager/menuResidentManage");
	@RequestMapping("/manager/menuResidentManage")
	public ModelAndView menuResidentManage(ModelAndView mv) {
		System.out.println("/manager/resident_manage/resident");
		
		ArrayList list = rms.selectAllResident();
		
		mv.addObject("list", list);
		mv.setViewName("manager/resident_manage/resident");
		
		return mv;
	}
	
	
}
