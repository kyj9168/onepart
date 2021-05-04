package com.kh.onepart.account.model.vo;

import java.sql.Date;

//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class ManagerVO {

	private String managerSeq;
	private String managerNm;
	private int deptCd;
	private String managerId;
	private String managerPwd;
	private String managerPhone;
	private String managerEmail;
	private Date managerEnrollDt;
	private Date managerLeaveDt;
	private String managerLeaveTf;
	private String residentSeq;

	public ManagerVO() {}

	public ManagerVO(String managerSeq, String managerNm, int deptCd, String managerId, String managerPwd,
			String managerPhone, String managerEmail, Date managerEnrollDt, Date managerLeaveDt, String managerLeaveTf,
			String residentSeq) {
		super();
		this.managerSeq = managerSeq;
		this.managerNm = managerNm;
		this.deptCd = deptCd;
		this.managerId = managerId;
		this.managerPwd = managerPwd;
		this.managerPhone = managerPhone;
		this.managerEmail = managerEmail;
		this.managerEnrollDt = managerEnrollDt;
		this.managerLeaveDt = managerLeaveDt;
		this.managerLeaveTf = managerLeaveTf;
		this.residentSeq = residentSeq;
	}

	public String getManagerSeq() {
		return managerSeq;
	}

	public void setManagerSeq(String managerSeq) {
		this.managerSeq = managerSeq;
	}

	public String getManagerNm() {
		return managerNm;
	}

	public void setManagerNm(String managerNm) {
		this.managerNm = managerNm;
	}

	public int getDeptCd() {
		return deptCd;
	}

	public void setDeptCd(int deptCd) {
		this.deptCd = deptCd;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerPwd() {
		return managerPwd;
	}

	public void setManagerPwd(String managerPwd) {
		this.managerPwd = managerPwd;
	}

	public String getManagerPhone() {
		return managerPhone;
	}

	public void setManagerPhone(String managerPhone) {
		this.managerPhone = managerPhone;
	}

	public String getManagerEmail() {
		return managerEmail;
	}

	public void setManagerEmail(String managerEmail) {
		this.managerEmail = managerEmail;
	}

	public Date getManagerEnrollDt() {
		return managerEnrollDt;
	}

	public void setManagerEnrollDt(Date managerEnrollDt) {
		this.managerEnrollDt = managerEnrollDt;
	}

	public Date getManagerLeaveDt() {
		return managerLeaveDt;
	}

	public void setManagerLeaveDt(Date managerLeaveDt) {
		this.managerLeaveDt = managerLeaveDt;
	}

	public String getManagerLeaveTf() {
		return managerLeaveTf;
	}

	public void setManagerLeaveTf(String managerLeaveTf) {
		this.managerLeaveTf = managerLeaveTf;
	}

	public String getResidentSeq() {
		return residentSeq;
	}

	public void setResidentSeq(String residentSeq) {
		this.residentSeq = residentSeq;
	}

	@Override
	public String toString() {
		return "ManagerVO [managerSeq=" + managerSeq + ", managerNm=" + managerNm + ", deptCd=" + deptCd
				+ ", managerId=" + managerId + ", managerPwd=" + managerPwd + ", managerPhone=" + managerPhone
				+ ", managerEmail=" + managerEmail + ", managerEnrollDt=" + managerEnrollDt + ", managerLeaveDt="
				+ managerLeaveDt + ", managerLeaveTf=" + managerLeaveTf + ", residentSeq=" + residentSeq + "]";
	}



}
