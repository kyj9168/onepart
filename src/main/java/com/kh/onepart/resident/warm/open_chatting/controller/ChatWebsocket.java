//package com.kh.onepart.resident.warm.open_chatting.controller;
//
//import java.io.IOException;
//import java.util.Collections;
//import java.util.HashMap;
//import java.util.HashSet;
//import java.util.List;
//import java.util.Map;
//import java.util.Set;
//
//import javax.inject.Inject;
//import javax.websocket.OnClose;
//import javax.websocket.OnMessage;
//import javax.websocket.OnOpen;
//import javax.websocket.Session;
//import javax.websocket.server.ServerEndpoint;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.socket.server.standard.SpringConfigurator;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.kh.onepart.account.model.vo.ResidentVO;
//import com.kh.onepart.resident.warm.open_chatting.model.service.OpenChatService;
//
//@ServerEndpoint(value="/resident/menuOpenChatRoom", configurator = SpringConfigurator.class)
//public class ChatWebsocket {
//
//	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
//
//	@OnMessage
//	public void onMessage(String jsonData, Session session) throws IOException {
//
//		try {
//			// 여기에서 DB insert
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		// JSON To Java Object
//		@SuppressWarnings("unchecked")
//		Map<String, Object> msg = new ObjectMapper().readValue(jsonData, HashMap.class);
//
//		if(msg.get("act").equals("getPastData")) {
//			// DB에서 이전 대화내용 꺼내오기
//
//
//			// 결과 전송
//
//		}else if(msg.get("act").equals("sendMsg")) {
//
//			// 채팅방 구분 조건 개발예정
//			synchronized (clients) {
//				for (Session client : clients) {
//					// 보낸사람인지
//					msg.put("isMe", client.equals(session) );
//					// 서버 날짜
//					msg.put("date", "08/26 11:11");
//
//					// Java Object To JSON
//					String resultData = new ObjectMapper().writeValueAsString(msg);
//
//					// 결과 전송
//					client.getBasicRemote().sendText(resultData);
//				}
//			}
//		}
//	}
//
//	@OnOpen
//	public void onOpen(Session session) {
//		// Add session to the connected sessions set
//		System.out.println(session);
//		clients.add(session);
//	}
//
//	@OnClose
//	public void onClose(Session session) {
//		// Remove session from the connected sessions set
//		clients.remove(session);
//	}
//
//}
//
//
