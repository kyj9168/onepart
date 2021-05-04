package com.kh.onepart.resident.my_apartment.notice.controller;

import java.sql.Date;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.resident.my_apartment.notice.model.service.NoticeService;
import com.kh.onepart.resident.my_apartment.notice.model.vo.NoticeVo;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	//공지사항 리스트
	@RequestMapping(value="/resident/menuNotice", method=RequestMethod.GET)
	public ModelAndView menuNotice(ModelAndView mv, HttpServletRequest request, int noticeSeq) {
		System.out.println("/menuNotice");
		
		int NoticeSeq = ((NoticeVo) request.getSession().getAttribute("loginUser")).getNoticeSeq();
		
		ArrayList<NoticeVo> list = service.selectNoticeVo(noticeSeq);
		
		mv.addObject("list", list);
		mv.setViewName("/resident/my_apartment/notice/notice");
		//		return "/resident/my_apartment/notice/notice";
		return mv;
	}

	//공지사항 글등록
	/*
	 * @RequestMapping("/resident/moveNoticeWrite") public ModelAndView
	 * moveNoticeWrite(ModelAndView mv, int noticeSeq, String noticeTitle, String
	 * noticeContent, Date noticeEnrollDt ) {
	 * System.out.println("/moveNoticeWrite");
	 * 
	 * NoticeVo n = new NoticeVo();
	 * 
	 * n.setNoticeSeq(noticeSeq); n.setNoticeTitle(noticeTitle);
	 * n.setNoticeContent(noticeContent); n.setNoticeEnrollDt(noticeEnrollDt);
	 * 
	 * //확인 System.out.println("controller NoticeVo :" + n.toString());
	 * ArrayList<NoticeVo> list = service.insertNoticeVo();
	 * 
	 * mv.addObject("list", list);
	 * mv.setViewName("/resident/my_apartment/notice/notice_write"); return mv; }
	 */

	//공지사항 수정
	/*
	 * @RequestMapping( value= "/resident/moveNoticeUpdate", method=
	 * {RequestMethod.POST, RequestMethod.GET})
	 * public ModelAndView moveNoticeUpdate(@RequestParam(value="noticeSeq")int
	 * noticeSeq, @ModelAttribute("noticeVo") NoticeVo noticeVo) {
	 * System.out.println("/moveNoticeUpdate"); 
	 * ModelAndView mv = new ModelAndView("update"); 
	 * ArrayList<NoticeVo> list = service.updateNoticeVo();
	 * 
	 * mv.addObject("list", list);
	 * mv.setViewName("/resident/my_apartment/notice/notice_update"); return mv; }
	 */

}










