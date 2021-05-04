package com.kh.onepart.resident.messenger.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResponseMessengerAndResidentAndManagerVO {

	/*메시지 전송*/
	private int messengerSeq;
	private String messengerSender;
	private String messengerReceiver;
	private String messengerContent;
	private String readTm;
	private String messengerEnrollDt;
	private String keepTf;

	// resident
	private int residentSeq;
	private String residentId;
	private String residentPwd;
	private String residentNm;
	private String residentPhone;
	private String residentEmail;
	private int householdAuthType;
	private String residentEnrollDt;
	private String leaveTf;
	private int aptAuthCd;
	private String leaveDt;
	private String residentBirth;
	private String confirmTf;
	private String residentGender;

	// aptDetailInfo
	private String aptDetailInfoSeq;
	private int bdNm;
	private int rmNm;
	private int squareMeasure;

	// manager
	private String managerSeq;
	private String managerNm;
	private int deptCd;
	private String managerId;
	private String managerPwd;
	private String managerPhone;
	private String managerEmail;
	private String managerEnrollDt;
	private String managerLeaveDt;
	private String managerLeaveTf;

	// dept
	private String deptNm;

}
