package com.kh.onepart.resident.convenience.complaint.model.vo;

import java.sql.Date;

public class ComplaintVo {
	private int complaintSeq; //민원접수 고유번호
	private String complaintTitle; //제목
	private int residentSeq;  //입주민 고유 번호
	private String complaintContent; //내용
	private Date complaintEnrollDt; //등록일
	private int complaintStatus; //상태
	
public ComplaintVo() {}

public ComplaintVo(int complaintSeq, String complaintTitle, int residentSeq, String complaintContent,
		Date complaintEnrollDt, int complaintStatus) {
	super();
	this.complaintSeq = complaintSeq;
	this.complaintTitle = complaintTitle;
	this.residentSeq = residentSeq;
	this.complaintContent = complaintContent;
	this.complaintEnrollDt = complaintEnrollDt;
	this.complaintStatus = complaintStatus;
}

public int getComplaintSeq() {
	return complaintSeq;
}

public void setComplaintSeq(int complaintSeq) {
	this.complaintSeq = complaintSeq;
}

public String getComplaintTitle() {
	return complaintTitle;
}

public void setComplaintTitle(String complaintTitle) {
	this.complaintTitle = complaintTitle;
}

public int getResidentSeq() {
	return residentSeq;
}

public void setResidentSeq(int residentSeq) {
	this.residentSeq = residentSeq;
}

public String getComplaintContent() {
	return complaintContent;
}

public void setComplaintContent(String complaintContent) {
	this.complaintContent = complaintContent;
}

public Date getComplaintEnrollDt() {
	return complaintEnrollDt;
}

public void setComplaintEnrollDt(Date complaintEnrollDt) {
	this.complaintEnrollDt = complaintEnrollDt;
}

public int getComplaintStatus() {
	return complaintStatus;
}

public void setComplaintStatus(int complaintStatus) {
	this.complaintStatus = complaintStatus;
}

@Override
public String toString() {
	return "ComplaintVo [complaintSeq=" + complaintSeq + ", complaintTitle=" + complaintTitle + ", residentSeq="
			+ residentSeq + ", complaintContent=" + complaintContent + ", complaintEnrollDt=" + complaintEnrollDt
			+ ", complaintStatus=" + complaintStatus + "]";
}


}
