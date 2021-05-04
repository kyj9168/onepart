package com.kh.onepart.account.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResidentVO {

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
	private String residentNm2;
	private String managerSeq;

	//private String aptNm; // APT_INFO_SEQ 이 있어야 하는거


}
