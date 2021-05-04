package com.kh.onepart.resident.messenger.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestMessengerVO {

	private int messengerSeq;
	private String messengerSender;
	private String messengerReceiver;
	private String messengerContent;
	private String managerEnrollDt;
	private String readTm;
	private String messengerEnrollDt;

	/*쪽지 리스트 확인*/
	private int type;
	private String loginUser;

}
