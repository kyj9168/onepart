package com.kh.onepart.resident.messenger.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.onepart.resident.main.model.service.ResidentTemplateService;

public class MessengerWebSocket extends TextWebSocketHandler {

	@Autowired
	ResidentTemplateService residentTemplateService;

	private static Map<String, WebSocketSession> memberMap = Collections.synchronizedMap(new HashMap<String, WebSocketSession>());
	// after open
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + " connection!!");
		System.out.println("init memberMap size : " + memberMap.size());
	}

	// sendText
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		System.out.println("handleTextMessage in !!!");

		@SuppressWarnings("unchecked")
		Map<String, Object> msg = new ObjectMapper().readValue(message.getPayload(), HashMap.class);

		String type = (String) msg.get("type");
		switch(type) {
		case "init":
			String residentSeq = (String) msg.get("residentSeq");
			memberMap.put(residentSeq, session);
			System.out.println("add memberMap size : " + memberMap.size());
			break;

		//
		case "refreshCount":
			System.out.println("refreshCount in!!");

			ArrayList<String> list = (ArrayList<String>) msg.get("target");
			System.out.println(list);



			Iterator i = memberMap.keySet().iterator();
			while(i.hasNext()) {
				String key = (String) i.next();
				System.out.println("key:::::" + key);
				for(String target : list) {
					if(key.equals(target)) {
						int count = residentTemplateService.selectNoReadMessengerCount(target);
						System.out.println("web socket count : " + count);
						memberMap.get(key).sendMessage(new TextMessage(String.valueOf(count)));
					}
				}

			}

			break;
		}
	}

	// after close
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Iterator i = memberMap.keySet().iterator();
		while(i.hasNext()) {
			String key = (String) i.next();
			if(memberMap.get(key) == session) {
				memberMap.remove(key);
			}
		}
		System.out.println("remove memberMap size : " + memberMap.size());
		System.out.println(session.getId() + " close!!");
	}
}
