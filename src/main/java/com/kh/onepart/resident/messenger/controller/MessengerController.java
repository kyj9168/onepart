package com.kh.onepart.resident.messenger.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.vo.ManagerVO;
import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.common.PageInfo;
import com.kh.onepart.common.Pagination;
import com.kh.onepart.manager.visit_car.model.service.ManagerVisitCarService;
import com.kh.onepart.manager.visit_car.model.vo.ManagerVisitCarVo;
import com.kh.onepart.resident.messenger.model.service.MessengerService;
import com.kh.onepart.resident.messenger.model.vo.ManagerAndDeptVO;
import com.kh.onepart.resident.messenger.model.vo.MessengerBasicAllData;
import com.kh.onepart.resident.messenger.model.vo.RequestAttachVO;
import com.kh.onepart.resident.messenger.model.vo.RequestImgVO;
import com.kh.onepart.resident.messenger.model.vo.RequestMessengerVO;
import com.kh.onepart.resident.messenger.model.vo.ResponseMessengerAndResidentAndManagerVO;
import com.kh.onepart.resident.messenger.model.vo.ResponseResidentVO;

@Controller
public class MessengerController {

	@Autowired
	MessengerService messengerService;

	@Autowired
	ManagerVisitCarService mVisitCarService;

	/**
	 * 쪽지 메인페이지로 이동
	 * @return
	 */
	@RequestMapping("messenger/moveMessenger")
	public String moveMessenger() {

		return "messenger/resident/residentMessenger";
	}

	/**
	 * 타입별 쪽지 리스트 보여주기
	 * @param type
	 * @param currentPage
	 * @param session
	 * @param requestMessengerVO
	 * @return
	 */
	@RequestMapping("messenger/loadMessenger")
	public ModelAndView loadMessenger(int type, int currentPage, HttpSession session, RequestMessengerVO requestMessengerVO, ModelAndView modelAndView) {

		System.out.println("loadMessenger in !");
		System.out.println("type :: " + type);
		System.out.println("currentPage :: " + currentPage);

		// 받는 사람 구하기(로그인 유저)
		String loginUser = "";
		// 입주민일 경우, int > String 으로 형변환
		if(session.getAttribute("loginUser") instanceof ResidentVO) {
			loginUser = String.valueOf(((ResidentVO) session.getAttribute("loginUser")).getResidentSeq());

		// 관리자일 경우
		} else if(session.getAttribute("loginUser") instanceof ManagerVO) {
			System.out.println("manager in");
			loginUser = String.valueOf(((ManagerVO) session.getAttribute("loginUser")).getManagerSeq());

		}
		requestMessengerVO.setLoginUser(loginUser);

		// 타입 설정
		/*
		type 1 : 읽지 않은 쪽지 - READ_TM null
		type 2 : 받은 쪽지 - RECEIVER = LoginUser
		type 3 : 보낸 쪽지 - Sender = Loginuser
		type 4 : 보관함 - KEEP_TF = 'Y'
		 */
		requestMessengerVO.setType(type);

		// 타입별 카운트 가져오기
		int messengerCount = messengerService.selectMessengerCount(requestMessengerVO);
		System.out.println("messengerCount");

		PageInfo pi = Pagination.getPageInfo(currentPage, messengerCount);

		ArrayList<ResponseMessengerAndResidentAndManagerVO> responseMessengerAndResidentAndManagerVOList = messengerService.selectMessengerList(pi, requestMessengerVO);

		System.out.println("responseMessengerAndResidentAndManagerVOList.size() ::: " + responseMessengerAndResidentAndManagerVOList.size());
		System.out.println("responseMessengerAndResidentAndManagerVOList ::: " + responseMessengerAndResidentAndManagerVOList);


		modelAndView.addObject("responseMessengerAndResidentAndManagerVOList", responseMessengerAndResidentAndManagerVOList);
		modelAndView.addObject("pi", pi);

		modelAndView.setViewName("jsonView");
		return modelAndView;
	}



	/**
	 * 쪽지 작성 페이지로 이동
	 * @return
	 */
	@RequestMapping("messenger/writeMessengerForm")
	public ModelAndView moveWriteMessengerForm(HttpSession session, ModelAndView modelAndView) {

		String loginUser = "";

		// 입주민일 경우, int > String 으로 형변환
		if(session.getAttribute("loginUser") instanceof ResidentVO) {
			System.out.println("resident in");
			loginUser = String.valueOf(((ResidentVO) session.getAttribute("loginUser")).getResidentSeq());
			ArrayList<ManagerAndDeptVO> managerAndDeptVOList = messengerService.selectManagerList();
			System.out.println("managerAndDeptVOList:::" + managerAndDeptVOList);
			modelAndView.addObject("managerAndDeptVOList", managerAndDeptVOList);

		// 관리자일 경우
		} else if(session.getAttribute("loginUser") instanceof ManagerVO) {
			System.out.println("manager in");
			loginUser = String.valueOf(((ManagerVO) session.getAttribute("loginUser")).getManagerSeq());
			ArrayList<ResponseResidentVO> residentVOList = messengerService.selectResidentList();
			System.out.println("residentVOList:::" + residentVOList);
			modelAndView.addObject("residentVOList", residentVOList);
		}

		modelAndView.setViewName("messenger/resident/writeMessengerForm");

		return modelAndView;
	}

	/**
	 * 쪽지 작성
	 * @return
	 */
	@RequestMapping("messenger/writeMessenger")
	public ModelAndView insertMessenger(RequestMessengerVO requestMessengerVO, String[] tags, HttpSession session, MultipartHttpServletRequest req, HttpServletRequest request, ModelAndView modelAndView) {

		System.out.println("messenger/writeMessenger in!");
		System.out.println("requestMessengerVO:::" + requestMessengerVO);
		System.out.println("messengerContent : " + req.getParameter("messengerContent"));
		System.out.println("tags:::" + tags);

		String messengerSender = "";
		// 입주민일 경우, int > String 으로 형변환
		if(session.getAttribute("loginUser") instanceof ResidentVO) {
			messengerSender = String.valueOf(((ResidentVO) session.getAttribute("loginUser")).getResidentSeq());

			// 관리자일 경우
		} else if(session.getAttribute("loginUser") instanceof ManagerVO) {
			messengerSender = String.valueOf(((ManagerVO) session.getAttribute("loginUser")).getManagerSeq());
		}

		requestMessengerVO.setMessengerSender(messengerSender);

		// ============================업로드 관련============================
		String [] extArray = {".jpeg", ".png", ".gif", ".psd", ".bmp", ".tiff", ".eps"};
		String root = request.getSession().getServletContext().getRealPath("resources");
		String uploadFiles = "uploadFiles" + File.separator + "messenger";
		System.out.println(root + File.separator + uploadFiles);
		String filePath = "";
		List<MultipartFile> mf = req.getFiles("files");
		ArrayList<RequestImgVO> requestImgVOList = new ArrayList<RequestImgVO>();
		ArrayList<RequestAttachVO> requestAttachVOList = new ArrayList<RequestAttachVO>();

		boolean imgFlag = false;
		for(int i=0; i<mf.size(); i++){
			// 파일명 정의
			String originFileName = mf.get(i).getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf('.')).toLowerCase();
			String chageName = UUID.randomUUID().toString().replace("-", "") + ext;

			System.out.println("originFileName :: " + originFileName);
			System.out.println("ext :: " + ext);
			System.out.println("chageName :: " + chageName);

			// 이미지 확장자 체크
			for(int j=0; j<extArray.length; j++) {
				if(ext.equals(extArray[j])) {
					imgFlag = true;
				}
			}

			// 이미지
			if(imgFlag) {
				filePath = root + File.separator + uploadFiles + File.separator + "image";

				RequestImgVO requestImgVO = new RequestImgVO();
				requestImgVO.setOriginNm(originFileName);
				requestImgVO.setChangeNm(chageName);
				requestImgVO.setFilePath(filePath);

				requestImgVOList.add(requestImgVO);

			} else {
				filePath = root + File.separator + uploadFiles + File.separator + "attachment";

				RequestAttachVO requestAttachVO = new RequestAttachVO();
				requestAttachVO.setOriginNm(originFileName);
				requestAttachVO.setChangeNm(chageName);
				requestAttachVO.setFilePath(filePath);
				requestAttachVOList.add(requestAttachVO);
			}
			imgFlag = false;
			try {
				mf.get(i).transferTo(new File(filePath + File.separator + chageName));

			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				new File(filePath + File.separator + chageName + ext).delete();
			}
		}

		System.out.println("requestImgVOList ::: " + requestImgVOList);
		System.out.println("requestAttachVOList ::: " + requestAttachVOList);

		// 메신저 보내기 DB 저장
		messengerService.insertMessenger(requestMessengerVO, tags, requestImgVOList, requestAttachVOList);

		modelAndView.setViewName("jsonView");

		return modelAndView;
	}

	/**
	 * 쪽지 상세보기
	 * @param messengerSeq
	 * @param session
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("messenger/moveMessengerDetail")
	public ModelAndView selectMessengerDetail(String messengerSeq, HttpSession session, ModelAndView modelAndView) {

		System.out.println("moveMessengerDetail in!@!!!");
		System.out.println("messengerSeq :: " + messengerSeq);

		// 쪽지 기본정보, 첨부파일, 이미지 조회
		ArrayList<Object> messengerDetailData = messengerService.selectMessengerDetail(messengerSeq);
		MessengerBasicAllData basicInfo = (MessengerBasicAllData) messengerDetailData.get(0);
		ArrayList<RequestImgVO> imgVOList = (ArrayList<RequestImgVO>) messengerDetailData.get(1);
		ArrayList<RequestAttachVO> attachVOList = (ArrayList<RequestAttachVO>) messengerDetailData.get(2);

		System.out.println("basicInfo.getReadTm() : " + basicInfo.getReadTm());

		if(basicInfo.getReadTm() == null) {
			messengerService.updateMessengerReadProcess(messengerSeq);
		}

		modelAndView.addObject("basicInfo", basicInfo);
		modelAndView.addObject("imgVOList", imgVOList);
		modelAndView.addObject("attachVOList", attachVOList);

		modelAndView.setViewName("messenger/resident/messengerDetail");
		return modelAndView;
	}

	/**
	 * 이미지 다운로드
	 * @param requestImgVO
	 * @throws IOException
	 */
	@RequestMapping("messenger/downloadImage")
	public void downloadImage(RequestImgVO requestImgVO, HttpServletResponse response) throws IOException {
		System.out.println(requestImgVO);
		RequestImgVO responseImgVO = messengerService.selectDownloadImg(requestImgVO);
		System.out.println("contoller result : " + responseImgVO);

		BufferedInputStream buf = null;

		ServletOutputStream downOut = response.getOutputStream();

		File downFile = new File(responseImgVO.getFilePath() + File.separator +responseImgVO.getChangeNm());

		response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(responseImgVO.getOriginNm().getBytes("UTF-8"), "ISO-8859-1") + "\"");

		response.setContentLength((int) downFile.length());

		buf = new BufferedInputStream(new FileInputStream(downFile));

		int readBytes = 0;

		while((readBytes = buf.read()) != -1) {
			downOut.write(readBytes);
		}

		downOut.close();
		buf.close();
	}

	/**
	 * 이미지 다운로드
	 * @param requestImgVO
	 * @throws IOException
	 */
	@RequestMapping("messenger/downloadAttachment")
	public void downloadAttachment(RequestAttachVO requestAttachVO, HttpServletResponse response) throws IOException {
		System.out.println(requestAttachVO);
		RequestAttachVO responseAttachVO = messengerService.selectDownloadAttach(requestAttachVO);
		System.out.println("contoller result : " + responseAttachVO);

		BufferedInputStream buf = null;

		ServletOutputStream downOut = response.getOutputStream();

		File downFile = new File(responseAttachVO.getFilePath() + File.separator +responseAttachVO.getChangeNm());

		response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(responseAttachVO.getOriginNm().getBytes("UTF-8"), "ISO-8859-1") + "\"");

		response.setContentLength((int) downFile.length());

		buf = new BufferedInputStream(new FileInputStream(downFile));

		int readBytes = 0;

		while((readBytes = buf.read()) != -1) {
			downOut.write(readBytes);
		}

		downOut.close();
		buf.close();
	}

	/**
	 * 보관함으로
	 * @param messengerSeq
	 */
	@RequestMapping("/messenger/keepMessenger")
	public ModelAndView keepMessenger(String messengerSeq, HttpServletRequest request, ModelAndView modelAndview) {

		String[] temp = messengerSeq.split(",");
		ArrayList<String> list = new ArrayList<String>();

		for(int i=0; i<temp.length; i++) {
			list.add(temp[i]);
		}

		messengerService.keepMessenger(list);

		modelAndview.setViewName("jsonView");
		return modelAndview;
	}

	/**
	 * 선택 삭제
	 * @param messengerSeq
	 */
	@RequestMapping("/messenger/deleteMessenger")
	public ModelAndView deleteMessenger(String messengerSeq, HttpServletRequest request, ModelAndView modelAndview) {

		String[] temp = messengerSeq.split(",");
		ArrayList<String> list = new ArrayList<String>();

		for(int i=0; i<temp.length; i++) {
			list.add(temp[i]);
		}

		messengerService.deleteMessenger(list);

		modelAndview.setViewName("jsonView");
		return modelAndview;
	}

	/**
	 * @param requestMessengerVO
	 * @param tags
	 * @param req
	 * @param request
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/messenger/sendMessageForVisitCar")
	public ModelAndView insertMessengerForVisitCar(RequestMessengerVO requestMessengerVO, int visitCarSeq, int residentSeq, int type, String cancelReason, HttpServletRequest req, HttpSession session, HttpServletRequest request, ModelAndView modelAndView) {

		/*
		 * data : {
		 * 		residentSeq : residentSeq,
		 * 		type : 1 or 2 (1 = 승인, 2 = 거절),
		 * 		cancelReason : cancelReason
		 * }
		 *
		 */

		System.out.println("messenger/insertMessengerForVisitCar in!");
		System.out.println("requestMessengerVO:::" + requestMessengerVO);
		System.out.println("messengerContent : " + req.getParameter("messengerContent"));

		String messengerSender = "";
		messengerSender = String.valueOf(((ManagerVO) session.getAttribute("loginUser")).getManagerSeq());

		requestMessengerVO.setMessengerSender(messengerSender);
		requestMessengerVO.setMessengerReceiver(String.valueOf(residentSeq));

		String messengerContent;
		if(type == 1) {
			messengerContent = "방문차량 등록이 승인되었습니다.";
		} else {
			messengerContent = "방문차량 등록이 거절되었습니다.\n" + cancelReason;
			// 작성부분
			ManagerVisitCarVo requestManagerVisitCarVo = new ManagerVisitCarVo();
			requestManagerVisitCarVo.setVisitCarSeq(visitCarSeq);
			requestManagerVisitCarVo.setRejectReason(messengerContent);

			int result = mVisitCarService.updateRejectReason(requestManagerVisitCarVo);
			modelAndView.addObject("result", result);
		}
		requestMessengerVO.setMessengerContent(messengerContent);

		// 메신저 보내기 DB 저장
		System.out.println("@@requestMessengerVO ::: " + requestMessengerVO);
		messengerService.insertMessengerForVisitCar(requestMessengerVO);

		modelAndView.setViewName("jsonView");

		return modelAndView;
	}

}
