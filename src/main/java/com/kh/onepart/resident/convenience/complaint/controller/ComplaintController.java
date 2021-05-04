package com.kh.onepart.resident.convenience.complaint.controller;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.convenience.complaint.model.service.ComplaintService;
import com.kh.onepart.resident.convenience.complaint.model.vo.ComplaintVo;


@Controller
public class ComplaintController {
	/*$("#menuComplaint").data("menu-url", "/onepart/resident/menuComplaint");*/
	
	@Autowired
	private ComplaintService service;
	
	//민원접수 화면보기 
	@RequestMapping("/resident/menuComplaint")
	public ModelAndView moveComplaint(HttpSession session,ModelAndView mv) {
		System.out.println("/menuComplaint");
		
		ResidentVO loginResident = (ResidentVO)session.getAttribute("loginUser");
		
		ArrayList<ComplaintVo> list = service.selectAllComplaintVo();
//		return "/resident/convenience/complaint/complaint";
		
		mv.addObject("list", list);
		mv.setViewName("/resident/convenience/complaint/complaint");
	
		return mv;
	}
	
	@RequestMapping("/resident/moveComplaintDetail")
	public String moveComplaintDetail(ModelAndView mv, int complaintSeq, String complaintTitle, 
										String complaintContent, Date complaintEnrollDt) {
		System.out.println("/moveComplaintDetail");
		
		ComplaintVo cv = new ComplaintVo();
		//버튼만눌렀을때 셀렉트 되게 
		return "/resident/convenience/complaint/complaint_detail";
	}

	@RequestMapping("/resident/moveComplaintWrite")
	public ModelAndView moveComplaintWrite(ModelAndView mv, String complaintTitle, String complaintContent,
										Date complaintEnrollDt) {
		System.out.println("/moveComplaintWrite");
		
		ComplaintVo cv = new ComplaintVo();
		
		cv.setComplaintTitle(complaintTitle);
		cv.setComplaintContent(complaintContent);
		cv.setComplaintEnrollDt(complaintEnrollDt);
		System.out.println("컨트롤 complaintVo : " + cv.toString());
		
		ArrayList<ComplaintVo> list = service.insertComplaintVo();
		
		mv.addObject("list", list);
		mv.setViewName("/resident/convenience/complaint/complaint_write");
		return mv;
	}
	
	@RequestMapping("/resident/moveComplaintUpdate")
	public String moveComplaintUpdate() {
		System.out.println("/moveComplaintUpdate");
		
		
		return "/resident/convenience/complaint/complaint_update";
	}
	
	


}