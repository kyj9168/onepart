package com.kh.onepart.resident.messenger.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessengerBasicAllData {

	// messenger
	private int messengerSeq;
	private String messengerSender;
	private String messengerReceiver;
	private String messengerContent;
	private String readTm;
	private String messengerEnrollDt;
	private String keepTf;
	private String deleteTf;

	// sender resident
	private String sendResidentSeq;
	private String sendResidentNm;

	// sender manager
	private String sendManagerSeq;
	private String sendManagerNm;

	// receiver resident
	private String receiverResidentSeq;
	private String receiverResidentNm;

	// receiver manager
	private String receiverManagerSeq;
	private String receiverManagerNm;

	// aptdetailinfo
	private int bdNm;
	private int rmNm;

	// dept
	private String deptNm;
}
