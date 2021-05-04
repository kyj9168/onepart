package com.kh.onepart.resident.warm.open_chatting.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.warm.open_chatting.model.service.OpenChatCommService;
import com.kh.onepart.resident.warm.open_chatting.model.service.OpenChatService;
import com.kh.onepart.resident.warm.open_chatting.model.vo.ImageVO;
import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatCommVO;
import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatVO;

import lombok.extern.java.Log;

@Log
public class SpringChatWebsocket extends TextWebSocketHandler {
	@Autowired
	OpenChatService openChatService;
	@Autowired
	OpenChatCommService openChatCommService;

	private static Map<Integer, List<WebSocketSession>> memberMap = Collections.synchronizedMap(new HashMap<Integer, List<WebSocketSession>>());


	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info(session.getId()+" 연결됨");
	}

	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		try {
			// JSON To Java Object
			@SuppressWarnings("unchecked")
			Map<String, Object> msg = new ObjectMapper().readValue(message.getPayload(), HashMap.class);

			if(msg.get("act").equals("sendMsg")) {
				List<WebSocketSession> roomResidentList = memberMap.get(Integer.parseInt((String)msg.get("openChatSeq")));
				for (WebSocketSession sess : roomResidentList) {
					// 보낸사람인지
					msg.put("isMe", sess.equals(session) );
					// 서버 날짜
					Date date = new Date();
					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd HH:mm");
					String nowTime = dateFormat.format(date);
					msg.put("date", nowTime);



					// Java Object To JSON
					String resultData = new ObjectMapper().writeValueAsString(msg);

					OpenChatCommVO openChatCommVO = new OpenChatCommVO();

					openChatCommVO.setOpenChatCommSendDt(new java.sql.Timestamp(date.getTime()));
					openChatCommVO.setOpenChatCommContent((String)msg.get("message"));
					openChatCommVO.setOpenChatCommAttchTf("N");
					openChatCommVO.setOpenChatCommImgTf("N");
					openChatCommVO.setResidentSeq(Integer.parseInt((String)msg.get("sender")));
					openChatCommVO.setOpenChatSeq(Integer.parseInt((String)msg.get("openChatSeq")));
					if(msg.get("isMe").equals(true)) {
						openChatCommService.saveOpenChatComm(openChatCommVO);
					}


					System.out.println(openChatCommVO);

					// 결과 전송
					sess.sendMessage(new TextMessage(resultData));
				}
			}else if( msg.get("act").equals("sendImageUrl")) {
				List<WebSocketSession> roomResidentList = memberMap.get(Integer.parseInt((String)msg.get("openChatSeq")));
				for (WebSocketSession sess : roomResidentList) {
					// 보낸사람인지
					msg.put("isMe", sess.equals(session) );
					// 서버 날짜
					Date date = new Date();
					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd HH:mm");
					String nowTime = dateFormat.format(date);
					msg.put("date", nowTime);




					// Java Object To JSON
					String resultData = new ObjectMapper().writeValueAsString(msg);

					OpenChatCommVO openChatCommVO = new OpenChatCommVO();

					openChatCommVO.setOpenChatCommSendDt(new java.sql.Timestamp(date.getTime()));
					String Image = ("<a href=" + (String)msg.get("message") + " download><img src= "+(String)msg.get("message")+"></a>");
					openChatCommVO.setOpenChatCommContent(Image);
					openChatCommVO.setOpenChatCommAttchTf("N");
					openChatCommVO.setOpenChatCommImgTf("Y");
					openChatCommVO.setResidentSeq(Integer.parseInt((String)msg.get("sender")));
					openChatCommVO.setOpenChatSeq(Integer.parseInt((String)msg.get("openChatSeq")));




					if(msg.get("isMe").equals(true)) {
						openChatCommService.saveOpenChatImageComm(openChatCommVO);

					}


					System.out.println(openChatCommVO);

					// 결과 전송
					sess.sendMessage(new TextMessage(resultData));
				}
			}else if(msg.get("act").equals("enterRoom")) {

				// 웹소켓 접속중인 채팅자 추가
				List<WebSocketSession> roomResidentList = memberMap.get(Integer.parseInt((String)msg.get("openChatSeq")));
				if(roomResidentList == null) {
					roomResidentList = new ArrayList<WebSocketSession>();
				}

				roomResidentList.add(session);

				memberMap.put(Integer.parseInt((String)msg.get("openChatSeq")), roomResidentList);
			}
			else if(msg.get("act").equals("getPrevMessages")) {

				// 이전 대화 내용 불러오기
				msg.put("prevMessageList", openChatCommService.getPrevMessages(Integer.parseInt((String)msg.get("openChatSeq"))));

				String resultData =new ObjectMapper().writeValueAsString(msg);
				session.sendMessage(new TextMessage(resultData));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		// 채팅 참가한 모든 방에서 세션 나가기
		List<OpenChatVO> openChatList = openChatService.getRoomListAll();
		for (OpenChatVO openChatVO : openChatList) {
			int openChatSeq = openChatVO.getOpenChatSeq();
			List<WebSocketSession> sessList = memberMap.get(openChatSeq);
			sessList.remove(session);
		}

		log.info(session.getId()+" 연결 끊김 ");
	}
}