package com.kh.onepart.manager.vote.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Superintend {

	private int residentSeq;
	private String residentId;
	private String residentPwd;
	private String residentNm;
	private String residentPhone;
	private String residentEmail;
	private String aptDetailInfoSeq;
	private int householdAuthType;
	private String residentEnrollDt;
	private String leaveTf;
	private int aptAuthCd;
	private String leaveDt;
	private String residentBirth;
	private String confirmTf;
	private String residentGender;

}
