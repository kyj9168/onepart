package com.kh.onepart.resident.residentMeeting.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResidentAllInfo {

	private int residentSeq;
	private String residentId;
	private String residentPwd;
	private String residentNm;
	private String residentPhone;
	private String residentEmail;
	private String aptDetailInfoSeq;
	private int householdAuthType;
	private Date residentEnrollDt;
	private String leaveTf;
	private int aptAuthCd;
	private Date leaveDt;
	private String residentBirth;
	private String confirmTf;
	private String residentGender;

	private String aptAuthType;
	private String aptAuthNm;

	private String bdNm;
	private String rmNm;
	private String squareMeasure;

}
