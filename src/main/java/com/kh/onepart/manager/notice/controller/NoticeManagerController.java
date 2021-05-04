package com.kh.onepart.manager.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.manager.notice.model.service.NoticeManagerService;


@Controller
public class NoticeManagerController {
	@Autowired
	private NoticeManagerService nms;
	
	@RequestMapping("/manager/menuNotice")
	public ModelAndView menuNotice(ModelAndView mv) {
		System.out.println("/manager/notice/notice");
		
		ArrayList list = nms.selectAllNotice();
		
		mv.addObject("list", list);
		mv.setViewName("manager/notice/notice");
		
		return mv;
	}
	@RequestMapping("/manager/moveNoticeWrite")
	public ModelAndView moveNoticeWrite(ModelAndView mv) {
		System.out.println("/moveNoticeWrite");
		
		
		return null;
	}
	@RequestMapping("/manager/moveNoticeUpdate")
	public ModelAndView moveNoticeUpdate(ModelAndView mv) {
		System.out.println("/moveNoticeUpdate");
		
		
		return null;
	}
}








