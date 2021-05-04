package com.kh.onepart.resident.convenience.reservate_facility.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.convenience.reservate_facility.model.service.ReservationService;
import com.kh.onepart.resident.convenience.reservate_facility.model.vo.FacReservation;
import com.kh.onepart.resident.convenience.reservate_facility.model.vo.FacSeatInfo;
import com.kh.onepart.resident.convenience.reservate_facility.model.vo.Reservation;

@Controller
public class ReservateFacilityController {
	@Autowired
	private ReservationService rs;

	@RequestMapping("/resident/menuReservateFacility")
	public ModelAndView moveReservation(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/menuReservateFacility");

		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();

		//로그인 유저의 예약리스트 불러오는 메소드
		ArrayList reservationList = rs.selectUserReservation(residentSeq);
		System.out.println("controller reservation : " + reservationList);

		//단지내 모든 시설물 리스트 불러오는 메소드
		ArrayList list = rs.selectAllReservation();

		mv.addObject("reservationList", reservationList);
		mv.addObject("list", list);
		mv.setViewName("/resident/convenience/reservate_facility/reservation_main");

		return mv;
	}

	@RequestMapping("/resident/insertReservation")
	public ModelAndView returnMain(ModelAndView mv, HttpServletRequest request, int facSeq, String propUseDt, String propUseTm, String toalFee,
				String useHeadCount, String usePurpose, String etc, String rsrvNm, String rsrvPhone, int residentSeq, String rsrvGroupType) {
		System.out.println("/insertReservation 호출..");

		FacReservation fr = new FacReservation();
		fr.setFacSeq(facSeq);
		fr.setPropUseDt(propUseDt);
		fr.setResidentSeq(residentSeq);
		fr.setToalFee(Integer.parseInt(toalFee));
		fr.setPropUseTm(propUseTm);
		fr.setUsePurpose(usePurpose);
		fr.setEtc(etc);
		if(useHeadCount.length() == 0) {
			fr.setUseHeadCount(1);
		}else {
			fr.setUseHeadCount(Integer.parseInt(useHeadCount));
		}
		if(rsrvGroupType.equals("one")) {
			fr.setRsrvGroupType(1);
		}else {
			fr.setRsrvGroupType(2);
		}
		fr.setRsrvNm(rsrvNm);
		fr.setRsrvPhone(rsrvPhone);

		System.out.println("controller fr : " + fr.toString());

		// 해당 예약 insert하는 메소드
		int result = rs.insertReservation(fr);

		//로그인 유저의 예약리스트 불러오는 메소드
		ArrayList reservationList = rs.selectUserReservation(residentSeq);
		System.out.println("controller reservation : " + reservationList);

		//단지내 모든 시설물 리스트 불러오는 메소드
		ArrayList list = rs.selectAllReservation();

		mv.addObject("reservationList", reservationList);
		mv.addObject("list", list);
		mv.setViewName("/resident/convenience/reservate_facility/reservation_main");

		return mv;
	}

	@RequestMapping("/resident/reservateGeneral")
	public ModelAndView moveReservation_reservateGeneral(ModelAndView mv, int facSeq) {
		System.out.println("/menuVote");

		//해당 시설물번호의 상세정보 불러오는 메소드
		Reservation reserv = rs.selectOneReservation(facSeq);

		System.out.println("reserv : " + reserv);

		mv.addObject("reserv", reserv);
		mv.setViewName("/resident/convenience/reservate_facility/reservation_general");

		return mv;
	}

	@RequestMapping("/resident/reservatenSeat")
	public ModelAndView moveReservation_reservatenSeat(ModelAndView mv, int facSeq) {
		System.out.println("/menuVote");

		//해당 시설물번호의 상세정보 불러오는 메소드
		Reservation reserv = rs.selectOneReservation(facSeq);

		//해당 시설물번호의 좌석정보 불러오는 메소드
		ArrayList<FacSeatInfo> seatList = rs.selectOneReservationSeatList(facSeq);
		int maxNumber = seatList.get(0).getFacSeatMaxNum();
		int widthSize = 100 / maxNumber;

		//해당 시설물번호의 좌석예약 상태 불러오는 메소드
		ArrayList<FacReservation> propSeatList =  rs.selectOnePropSeatList(facSeq);

		if(seatList.size() != 0 && propSeatList.size() != 0) {
			for(int i = 0; i < seatList.size(); i++) {
				for(int j = 0; j < propSeatList.size(); j++) {
					if(seatList.get(i).getFacPositionNum().equals(propSeatList.get(j).getFacPositionNum())) {
						seatList.remove(i);
					}
				}
			}
		}

		mv.addObject("widthSize", widthSize);
		mv.addObject("maxNumber", maxNumber);
		mv.addObject("propSeatList", propSeatList);
		mv.addObject("seatList", seatList);
		mv.addObject("reserv", reserv);
		mv.setViewName("/resident/convenience/reservate_facility/reservation_seat");

		return mv;
	}

	@RequestMapping("/resident/deleteUserReservation")
	public ModelAndView deleteUserReservation(ModelAndView mv, int facRsrvSeq, int residentSeq) {
		System.out.println("/menuVote");

		//해당 예약번호의 예약건을 삭제하는 메소드
		int result = rs.deleteUserReservation(facRsrvSeq);

		//로그인 유저의 예약리스트 불러오는 메소드
		ArrayList reservationList = rs.selectUserReservation(residentSeq);
		System.out.println("controller reservation : " + reservationList);

		//단지내 모든 시설물 리스트 불러오는 메소드
		ArrayList list = rs.selectAllReservation();

		mv.addObject("reservationList", reservationList);
		mv.addObject("list", list);
		mv.setViewName("/resident/convenience/reservate_facility/reservation_main");

		return mv;
	}

	@RequestMapping("/resident/selectDdayReservation")
	public ModelAndView selectDdayReservation(ModelAndView mv, int facSeq, String propUseDt) {

		//해당 날짜 해당 시설물의 예약건 리스트를 불러오는 메소드
		FacReservation fr = new FacReservation();
		fr.setFacSeq(facSeq);
		fr.setPropUseDt(propUseDt);
		System.out.println("예약시간 조회할 객체 : " + fr);
		ArrayList<FacReservation> dayReservationList = rs.selectDdayReservation(fr);
		String result = "";
		for(int i = 0; i < dayReservationList.size(); i++) {
			result += dayReservationList.get(i).getPropUseTm() + ",";
		}

		System.out.println("예약 시간대 리스트 문자열 : " + result);
		String[] resultArr = result.split(",");
		System.out.println("예약 시간대 리스트 문자배열 : " + resultArr);
		ArrayList resultList = new ArrayList();
		for(int i = 0; i < resultArr.length; i++) {
			resultList.add(resultArr[i]);
		}
		System.out.println("최종 예약 시간대 리스트 : " + resultList);

		mv.addObject("resultList", resultList);
		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping("/resident/insertReservation_seat")
	public ModelAndView insertReservation_seat(ModelAndView mv, int facSeq, String propSeat, HttpServletRequest request) {

		System.out.println("facSqe : " + facSeq );
		System.out.println("propSeatCode : " + propSeat);

		//해당 좌석코드번호의 PK 불러오는 메소드
		FacSeatInfo fr = new FacSeatInfo();
		fr.setFacSeq(facSeq);
		fr.setFacPositionNum(propSeat);
		int realPropSeat = rs.selectSeatPrimarykey(fr);
		System.out.println("realPropSeat : " + realPropSeat);

		int residentSeq = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentSeq();
		String rsrvNm =  ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentNm();
		String rsrvPhone = ((ResidentVO) request.getSession().getAttribute("loginUser")).getResidentPhone();

		//좌석 시설물 예약하는 메소드
		FacReservation fr2 = new FacReservation();
		fr2.setFacSeq(facSeq);
		fr2.setPropSeat(realPropSeat);
		fr2.setResidentSeq(residentSeq);
		fr2.setRsrvNm(rsrvNm);
		fr2.setRsrvPhone(rsrvPhone);
		int result = rs.insertReservationSeat(fr2);

		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping("/resident/voiceForKaKao")
	@ResponseBody
	public File voiceForKaKao(MultipartFile file, ModelAndView mv, HttpServletRequest request) {

		String resultData = request.getParameter("resultData");
		System.out.println(resultData);

		String url = "https://kakaoi-newtone-openapi.kakao.com/v1/synthesize";
		URL object;
		File f = null;

		try {
			object = new URL(url);
			HttpURLConnection con = (HttpURLConnection) object.openConnection();
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("Content-Type", "application/xml");
			con.setRequestProperty("Authorization", "KakaoAK c855aa08eb4a7540112bc314f63385ab");
			con.setRequestMethod("POST");

			OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
			wr.write(resultData);
			wr.flush();

			int HttpResult = con.getResponseCode();
			if (HttpResult == HttpURLConnection.HTTP_OK) {
				InputStream is = con.getInputStream();
				int read = 0;
                byte[] bytes = new byte[1024];
                String tempname = Long.valueOf(new Date().getTime()).toString();

                f = new File(tempname + ".mp3");
                f.createNewFile();

                OutputStream outputStream = new FileOutputStream(f);
                while ((read =is.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                is.close();
                System.out.println(f);

                String root = request.getSession().getServletContext().getRealPath("resources");
        		String filePath = root + "\\uploadFiles\\reservation";

        		System.out.println(" f.getName() :: " +  f.getName());

        		//File saveFile = new File(filePath + "\\" + f.getName());
			    System.out.println(con.getResponseCode());
			    file.transferTo(f);
			    mv.addObject("outputStream", f.getName());
			} else {
			    System.out.println(con.getResponseCode());
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		mv.setViewName("jsonView");

		return f;
	}
}
